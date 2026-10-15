#!/usr/bin/env python3
"""Reproducible, evidence-labelled function inventory for the five preferred images.

This is an analysis index, not a source acceptance gate. In particular, neither
the copyright string nor a byte match proves ownership of an entire function.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
sys.path.insert(0, r"C:\tools\capstone-5.0.3")
from capstone import Cs, CS_ARCH_X86, CS_MODE_16  # noqa: E402
from capstone.x86_const import X86_OP_IMM, X86_OP_MEM  # noqa: E402

TARGETS = ("circuit_ega", "circuit_cga", "cycles_ega", "cycles_cga", "cycles_tandy")
PROLOGUES = (b"\x55\x8b\xec", b"\x55\x89\xe5", b"\x56\x57\x55", b"\x53\x55\x8b\xec")


def read_json(path):
    return json.loads(path.read_text(encoding="utf-8"))


def digest(data):
    return hashlib.sha256(data).hexdigest()


def hx(n):
    return f"0x{n:X}"


def decoder():
    md = Cs(CS_ARCH_X86, CS_MODE_16)
    md.detail = True
    return md


def instructions(md, image, start, end):
    return list(md.disasm(image[start:end], start))


def direct(ins, segment, image, relocs):
    """Resolve direct transfer to an unrelocated linear image offset."""
    if not ins.operands or ins.operands[0].type != X86_OP_IMM:
        return None
    if ins.mnemonic in ("lcall", "ljmp") and len(ins.operands) == 2:
        if ins.operands[1].type != X86_OP_IMM or ins.size != 5:
            return None
        # x86 encodes IP first, segment second; Capstone presents segment first.
        word_at = segment * 16 + ins.address + 3
        if word_at not in relocs:
            return None
        cs = int.from_bytes(image[word_at:word_at + 2], "little")
        ip = int.from_bytes(image[word_at - 2:word_at], "little")
        return cs * 16 + ip, "far", word_at
    if ins.mnemonic.startswith(("call", "j")) and len(ins.operands) == 1:
        # Capstone's near immediate is the next IP plus displacement. A linear
        # decode yields the same destination within the current segment.
        ip = ins.operands[0].imm & 0xffff
        return segment * 16 + ip, "near", None
    return None


def segment_for(start, ghidra_row, census_row):
    if census_row:
        return int(census_row["start_segment_offset"].split(":")[0], 16)
    # Ghidra's FUN_ssss_iiii label preserves its load-image segment context.
    parts = ghidra_row.get("name", "").split("_") if ghidra_row else []
    if len(parts) >= 3 and parts[0] == "FUN":
        try:
            seg = int(parts[1], 16)
            if seg * 16 <= start < seg * 16 + 0x10000:
                return seg
        except ValueError:
            pass
    return 0


def runtime_intervals(target):
    doc = read_json(ROOT / "analysis/runtime_libraries.json")
    hits = defaultdict(list)
    for release, r in doc["releases"].items():
        for library, lib in r["libraries"].items():
            for hit in lib.get("targets", {}).get(target, {}).get("shortlist", []):
                start = hit["image_offset"]
                hits[(start, hit["member"])].append({"release": release, "library": library,
                    "exact_run_bytes": hit["longest_exact_run_bytes"]})
    return [{"start": a, "end": a + max(x["exact_run_bytes"] for x in evidence),
             "member": member, "evidence": evidence}
            for (a, member), evidence in sorted(hits.items())]


def binding_evidence(image, relocation_list, md):
    relocs = set(relocation_list)  # membership only; ordered list is kept below
    code = defaultdict(list)
    dgroup = []
    pointers = []
    for ordinal, r in enumerate(relocation_list):
        if r < 3 or r + 1 >= len(image):
            continue
        seg = int.from_bytes(image[r:r + 2], "little")
        if image[r - 3] in (0x9A, 0xEA):
            ip = int.from_bytes(image[r - 2:r], "little")
            at = r - 3
            kind = "far_call" if image[at] == 0x9A else "far_jump"
            if seg * 16 + ip < len(image):
                code[seg * 16].append({"at": at, "segment_word_relocation_ordinal": ordinal,
                    "segment_word_at": r, "target": seg * 16 + ip, "kind": kind})
            continue
        if image[r - 1] == 0xB8:
            # Startup's mov ax,seg DGROUP is followed by mov ds,ax (and often
            # mov es,ax). Other relocated AX constants remain candidates.
            after = image[r + 2:r + 12]
            if b"\x8e\xd8" in after:
                dgroup.append({"segment": seg, "linear_base": seg * 16,
                    "instruction_at": r - 1, "relocation_at": r, "relocation_ordinal": ordinal,
                    "evidence": "relocated mov ax,imm16 followed by mov ds,ax"})
        # Segment:offset pointer, including table entries; accepting a pointer
        # requires target code evidence later in the pipeline.
        ip = int.from_bytes(image[r - 2:r], "little")
        dest = seg * 16 + ip
        if dest < len(image):
            pointers.append({"at": r - 2, "segment_word_at": r,
                "relocation_ordinal": ordinal, "target": dest, "segment_base": seg * 16})
    return code, dgroup, pointers


def infer_end(md, image, start, ceiling, segment):
    """Bound a single linear candidate at its first return, with a small cap."""
    limit = min(ceiling, start + 2048, len(image))
    if limit <= start:
        return None, None
    for ins in md.disasm(image[start:limit], start - segment * 16):
        if ins.mnemonic.startswith("ret") or ins.mnemonic in ("iret", "iretw"):
            return start + (ins.address - (start - segment * 16)) + ins.size, (
                "far" if ins.mnemonic in ("retf", "retfq") or ins.bytes[:1] in (b"\xcb", b"\xca") else "near")
        if ins.mnemonic in ("jmp", "ljmp") and ins.address > (start - segment * 16) + 16:
            break
    return None, None


def dgroup_string(image, base, offset):
    if base is None:
        return None
    at = base + offset
    if at < 0 or at >= len(image):
        return None
    raw = image[at:min(at + 81, len(image))]
    end = raw.find(b"\0")
    if not 4 <= end <= 80:
        return None
    raw = raw[:end]
    if any(c < 32 or c > 126 for c in raw) or len(set(raw)) < 3:
        return None
    return raw.decode("ascii")


def build_target(target, census, matches, out):
    folder = ROOT / "work/oracles" / target
    image = (folder / "image.bin").read_bytes()
    meta = read_json(folder / "metadata.json")
    if digest(image) != meta["image_sha256"]:
        raise ValueError(f"pinned image mismatch: {target}")
    ordered = meta["relocations"]
    reloc_set = set(ordered)
    md = decoder()
    ghpath = ROOT / "work/census/ghidra" / f"{target}_functions.csv"
    gh = {}
    if ghpath.exists():
        for row in csv.DictReader(ghpath.open(newline="", encoding="utf-8")):
            at = int(row["start_hex"], 16)
            end = int(row["end_exclusive_hex"], 16)
            if 0 <= at < end <= len(image):
                gh[at] = row
    cen = {r["start"]: r for r in census if r["target"] == target and r["variant_id"] == target}
    code, dg, pointers = binding_evidence(image, ordered, md)
    dgroup_counts = Counter(x["linear_base"] for x in dg)
    dgroup_base = dgroup_counts.most_common(1)[0][0] if dg else None
    runtime = runtime_intervals(target)
    marker = image.find(b"Microsoft C")
    if marker < 0:
        marker = len(image)
    starts = set(gh) | set(cen)
    anchor = {}
    for m in matches:
        if m["gp_target"] != target or m["stunts_function_type"] != "function-or-helper-candidate":
            continue
        if m["match_class"] in ("exact", "relocation_masked") and m["length"] >= 20:
            anchor[m["gp_offset"]] = m
            starts.add(m["gp_offset"])
    # Far-call and relocated far-pointer entries can restore entries missed by
    # the historical census operand-order bug. A pointer needs Ghidra/census,
    # prologue, or a neighboring table entry before it is admitted.
    far_in = defaultdict(list)
    for sites in code.values():
        for site in sites:
            far_in[site["target"]].append(site)
            starts.add(site["target"])
    ptr_in = defaultdict(list)
    ptr_by_at = {p["at"]: p for p in pointers}
    for p in pointers:
        dest = p["target"]
        adjacent = p["at"] - 4 in ptr_by_at or p["at"] + 4 in ptr_by_at
        if dest in starts or (adjacent and image[dest:dest + 3] in PROLOGUES):
            ptr_in[dest].append(p)
            starts.add(dest)
    # A bounded prologue sweep between established starts. Every such entry is
    # explicitly low confidence; embedded data can mimic a prologue.
    known = sorted(starts)
    for left, right in zip(known, known[1:]):
        g, c = gh.get(left), cen.get(left)
        established_end = max(int(g["end_exclusive_hex"], 16) if g else left,
                              c["end"] if c else left)
        gap_start = max(left + 3, established_end)
        if right - gap_start < 8 or right - gap_start > 4096:
            continue
        for at in range(gap_start, right - 5):
            if any(image.startswith(p, at) for p in PROLOGUES):
                seg = segment_for(left, gh.get(left), cen.get(left))
                end, _ = infer_end(md, image, at, right, seg)
                if end and end <= right and end - at >= 8:
                    starts.add(at)
    known = sorted(starts)
    # Direct caller sites are decoded within bounded Ghidra/census extents.
    callers = defaultdict(list)
    outgoing = defaultdict(list)
    data_refs = defaultdict(set)
    for start in known:
        g, c = gh.get(start), cen.get(start)
        end = int(g["end_exclusive_hex"], 16) if g else c["end"] if c else min(start + 256, len(image))
        if end - start < 1 or end - start > 4096:
            continue
        seg = segment_for(start, g, c)
        # Decode with segment IP so near destinations are represented correctly.
        for ins in md.disasm(image[start:end], start - seg * 16):
            at = start + ins.address - (start - seg * 16)
            if ins.mnemonic.startswith(("call", "j")) or ins.mnemonic in ("lcall", "ljmp"):
                transfer = direct(ins, seg, image, reloc_set)
                if transfer and 0 <= transfer[0] < len(image):
                    dest, kind, word = transfer
                    if ins.mnemonic.startswith("call") or ins.mnemonic == "lcall":
                        callers[dest].append({"at": at, "caller": start, "kind": kind,
                            **({"segment_word_at": word} if word is not None else {})})
                        outgoing[start].append(dest)
            for op in ins.operands:
                if op.type == X86_OP_MEM and not op.mem.base and not op.mem.index:
                    data_refs[start].add(op.mem.disp & 0xffff)
    rows = []
    for ix, start in enumerate(known):
        g, c = gh.get(start), cen.get(start)
        seg = segment_for(start, g, c)
        ceiling = known[ix + 1] if ix + 1 < len(known) else len(image)
        gh_end = int(g["end_exclusive_hex"], 16) if g else None
        cen_end = c["end"] if c else None
        linear_end, ret = infer_end(md, image, start, ceiling, seg)
        candidates = [x for x in (gh_end, cen_end, linear_end) if x and x > start]
        if not candidates:
            continue
        # A distinct later entry bounds the extent. Ghidra's span is preferred
        # when it agrees with a return; census can encompass several routines.
        end = gh_end if gh_end and (not linear_end or abs(gh_end - linear_end) <= 3) else linear_end or min(candidates)
        end = min(end, ceiling, len(image))
        if end <= start:
            continue
        evidence = []
        if g:
            evidence.append({"kind": "ghidra_candidate", "end": gh_end,
                "source": f"work/census/ghidra/{target}_functions.csv"})
        if c:
            evidence.append({"kind": "census_reachable_call_target", "end": cen_end,
                "source": "analysis/census/function_candidates.json"})
        if linear_end and linear_end == end:
            evidence.append({"kind": "linear_return", "return": ret, "at": end - (1 if ret == "near" else 1),
                "status": "heuristic linear decode"})
        if start in far_in:
            evidence.append({"kind": "relocated_far_transfer", "sites": far_in[start][:12]})
        if start in ptr_in:
            evidence.append({"kind": "relocated_far_pointer", "sites": ptr_in[start][:12],
                "status": "table interpretation heuristic"})
        incoming = sorted({(x["at"], x["kind"]): x for x in callers[start]}.values(), key=lambda x: x["at"])
        if incoming:
            evidence.append({"kind": "direct_callers", "sites": incoming[:24], "total": len(incoming)})
        if not g and not c and start not in far_in and start not in ptr_in:
            evidence.append({"kind": "prologue_scan", "status": "heuristic; may be embedded data"})
        cls, class_evidence = "data/unknown", []
        if start in anchor:
            m = anchor[start]
            cls = "MSC runtime" if "runtime" in m["stunts_attribution"].lower() else "game/engine"
            class_evidence.append({"kind": "stunts_cross_reference", "name": m["stunts_function"],
                "match": m["match_class"], "score": m["score"], "source": "work/workers/stunts-xref/matches.json"})
            if cls == "game/engine" and (m.get("recipe_profile") or "").startswith("masm"):
                cls = "hand asm"
        for hit in runtime:
            overlap = max(0, min(end, hit["end"]) - max(start, hit["start"]))
            if overlap >= min(24, (end - start + 1) // 2) and hit["start"] - start < 12:
                cls = "MSC runtime"
                class_evidence.append({"kind": "MSC_library_member_exact_run", "member": hit["member"],
                    "run": [hit["start"], hit["end"]], "evidence": hit["evidence"]})
        if cls == "data/unknown" and (g or c) and (incoming or linear_end == end):
            cls = "game/engine" if end <= marker else "data/unknown"
            class_evidence.append({"kind": "pre_runtime_marker_heuristic", "marker": marker})
        if start == dict(zip(TARGETS, (0x5704, 0x55BA, 0x1D68, 0x1C46, 0x1C3C)))[target]:
            end = start + 36
            ret = "near"
            cls = "game/engine"
            evidence.append({"kind": "strict_source_promotion", "source": "analysis/matching/decimal_promotion.json"})
            class_evidence.append({"kind": "descriptive_reconstruction_name", "name": "format_u8_decimal3"})
        confidence = "high" if any(x["kind"] == "strict_source_promotion" for x in evidence) else (
            "medium" if g and c and incoming and linear_end == end else "low")
        rows.append({"id": f"{target}_{start:05x}", "target": target, "start": start, "end": end,
            "return_kind": ret or "unknown", "segment_base": seg * 16,
            "segment_evidence": "relocated far transfer segment" if seg * 16 in code else
                "Ghidra/census segment context; no direct far transfer evidence",
            "boundary_evidence": evidence, "confidence": confidence, "classification": cls,
            "classification_evidence": class_evidence, "direct_callers": incoming[:24],
            "direct_callees": sorted(set(outgoing[start])), "absolute_data_references": sorted(data_refs[start]),
            "dgroup_string_references": sorted({s for offset in data_refs[start]
                if (s := dgroup_string(image, dgroup_base, offset))}),
            "bytes_sha256": digest(image[start:end])})
    result = {"schema_version": 1, "target": target, "image_sha256": digest(image),
        "model_hypothesis": "MSC 5.x small /AS /O /Gs" if target.startswith("circuit") else "MSC 5.x medium /AM /O /Gs",
        "model_evidence": "work/workers/compiler-id/REPORT.md; matched leaves, not global proof",
        "runtime_boundary": {"offset": marker, "evidence": "first Microsoft C byte marker; census scope heuristic, not a proven code boundary"},
        "dgroup_candidates": dg, "dgroup_base": dgroup_base,
        "dgroup_selection": "most repeated relocated mov ax,imm16 followed by mov ds,ax; heuristic" if dg else "not found",
        "code_segment_bases": [{"base": base, "segment": base // 16, "far_transfer_sites": sites[:24],
            "site_count": len(sites)} for base, sites in sorted(code.items())],
        "relocation_count_ordered": len(ordered), "relocation_count_distinct": len(reloc_set),
        "functions": rows}
    out.mkdir(parents=True, exist_ok=True)
    (out / f"{target}.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    return result, image, ordered


def masked(image, start, end, relocations):
    data = bytearray(image[start:end])
    for r in relocations:
        if start <= r < end:
            data[r - start:r - start + 2] = b"\0\0"[:min(2, end - r)]
    return bytes(data)


def skeleton(md, image, row):
    sig = []
    for ins in md.disasm(image[row["start"]:row["end"]], row["start"]):
        ops = []
        for op in ins.operands:
            if op.type == X86_OP_IMM:
                ops.append("imm")
            elif op.type == X86_OP_MEM:
                ops.append("mem:" + str(bool(op.mem.base)) + ":" + str(bool(op.mem.index)))
            else:
                ops.append(ins.reg_name(op.reg))
        mnemonic = "call" if ins.mnemonic in ("call", "lcall") else "ret" if ins.mnemonic.startswith("ret") else ins.mnemonic
        sig.append(mnemonic + "/" + ",".join(ops))
    return tuple(sig)


def groups(results, out):
    md = decoder()
    images = {t: item[1] for t, item in results.items()}
    relocs = {t: item[2] for t, item in results.items()}
    rows = {r["id"]: r for t, item in results.items() for r in item[0]["functions"]}
    exact, mask, skel = defaultdict(list), defaultdict(list), defaultdict(list)
    for ident, r in rows.items():
        t = r["target"]
        data = images[t][r["start"]:r["end"]]
        if len(data) < 16 or r["classification"] == "data/unknown" or len(set(data)) < 8:
            continue
        exact[(len(data), digest(data))].append(ident)
        mask[(len(data), digest(masked(images[t], r["start"], r["end"], relocs[t])))].append(ident)
        s = skeleton(md, images[t], r)
        if len(s) >= 12:
            skel[s].append(ident)
    edges = {}
    for kind, index, score in (("operand-normalized skeleton", skel, 0.72),
                                ("relocation-masked", mask, 0.91), ("exact", exact, 1.0)):
        for fingerprint, members in index.items():
            if len(members) > 8:
                continue
            for i, a in enumerate(members):
                for b in members[i + 1:]:
                    if rows[a]["target"] == rows[b]["target"]:
                        continue
                    if kind == "operand-normalized skeleton":
                        la = rows[a]["end"] - rows[a]["start"]
                        lb = rows[b]["end"] - rows[b]["start"]
                        if len(fingerprint) < 20 or max(la, lb) > min(la, lb) * 1.5:
                            continue
                    key = tuple(sorted((a, b)))
                    edges[key] = {"a": key[0], "b": key[1], "kind": kind, "score": score}
    # A call graph and absolute data references anchor ambiguous skeletons.
    for edge in edges.values():
        a, b = rows[edge["a"]], rows[edge["b"]]
        caller_bonus = min(len(a["direct_callers"]), len(b["direct_callers"]), 3) * 0.015
        data_a, data_b = set(a["absolute_data_references"]), set(b["absolute_data_references"])
        data_bonus = 0.03 if data_a and data_a == data_b else 0
        shared_strings = sorted(set(a["dgroup_string_references"]) & set(b["dgroup_string_references"]))
        edge["anchors"] = {"caller_count_min": min(len(a["direct_callers"]), len(b["direct_callers"])),
                           "equal_absolute_data_references": bool(data_bonus),
                           "shared_dgroup_strings": shared_strings[:8]}
        edge["score"] = min(1.0, round(edge["score"] + caller_bonus + data_bonus
                                             + (0.05 if shared_strings else 0), 3))
    # Repeated call-graph reinforcement uses already strong pairs only.
    strong = {key for key, e in edges.items() if e["kind"] in ("exact", "relocation-masked")}
    by_start = {(r["target"], r["start"]): ident for ident, r in rows.items()}
    for key, e in edges.items():
        if e["kind"] != "operand-normalized skeleton":
            continue
        a, b = rows[key[0]], rows[key[1]]
        anchored = any(tuple(sorted((ia, ib))) in strong
                       for x in a["direct_callees"] for y in b["direct_callees"]
                       if (ia := by_start.get((a["target"], x))) and (ib := by_start.get((b["target"], y))))
        caller_anchored = any(tuple(sorted((ca, cb))) in strong
                              for x in a["direct_callers"] for y in b["direct_callers"]
                              if (ca := by_start.get((a["target"], x["caller"])))
                              and (cb := by_start.get((b["target"], y["caller"]))))
        if anchored or caller_anchored:
            e["kind"] = "call-graph-anchored"
            e["score"] = min(1.0, round(e["score"] + 0.1, 3))
            e["anchors"]["matched_callee"] = anchored
            e["anchors"]["matched_caller"] = caller_anchored
    edges = {k: e for k, e in edges.items() if e["kind"] != "operand-normalized skeleton"
             or e["anchors"]["equal_absolute_data_references"]
             or e["anchors"]["shared_dgroup_strings"]
             or len(skel[skeleton(md, images[rows[k[0]]["target"]], rows[k[0]])]) <= 5}
    parent = {x: x for x in rows}
    def root(x):
        while parent[x] != x:
            x = parent[x]
        return x
    def join(a, b):
        ra, rb = root(a), root(b)
        if ra != rb:
            parent[max(ra, rb)] = min(ra, rb)
    component_targets = {x: {rows[x]["target"]} for x in rows}
    kept = {}
    for e in sorted(edges.values(), key=lambda x: (-x["score"], x["a"], x["b"])):
        ra, rb = root(e["a"]), root(e["b"])
        if ra != rb and component_targets[ra].isdisjoint(component_targets[rb]):
            both = component_targets[ra] | component_targets[rb]
            join(e["a"], e["b"])
            component_targets[root(e["a"])] = both
            kept[(e["a"], e["b"])] = e
        elif ra == rb:
            kept[(e["a"], e["b"])] = e
    edges = kept
    components = defaultdict(list)
    for ident in rows:
        if any(ident in key for key in edges):
            components[root(ident)].append(ident)
    output = []
    for members in components.values():
        if len({rows[x]["target"] for x in members}) < 2:
            continue
        relevant = [e for k, e in edges.items() if k[0] in members and k[1] in members]
        named = any(rows[x]["start"] in (0x5704, 0x55BA, 0x1D68, 0x1C46, 0x1C3C)
                    and rows[x]["end"] - rows[x]["start"] == 36 for x in members)
        name = "format_u8_decimal3" if named else "grp_" + digest("|".join(sorted(members)).encode())[:8]
        best = max(relevant, key=lambda e: e["score"])
        output.append({"id": name, "members": sorted(members), "kind": best["kind"],
                       "score": best["score"], "pair_evidence": sorted(relevant, key=lambda e: (e["a"], e["b"])),
                       "status": "strict source promotion" if named else "heuristic correspondence; no shared-source claim"})
    output.sort(key=lambda g: g["id"])
    doc = {"schema_version": 1, "groups": output}
    (out / "groups.json").write_text(json.dumps(doc, indent=2) + "\n", encoding="utf-8")
    return doc


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--output", type=Path, default=ROOT / "analysis/inventory")
    args = p.parse_args()
    census = read_json(ROOT / "analysis/census/function_candidates.json")["functions"]
    matches = read_json(ROOT / "work/workers/stunts-xref/matches.json")["matches"]
    results = {t: build_target(t, census, matches, args.output) for t in TARGETS}
    grp = groups(results, args.output)
    print(json.dumps({"functions": {t: len(x[0]["functions"]) for t, x in results.items()},
                      "groups": len(grp["groups"]), "output": str(args.output)}))


if __name__ == "__main__":
    main()
