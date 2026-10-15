#!/usr/bin/env python3
"""Build a reproducible byte-level and conservative x86 census from oracle images.

Images are expected at work/oracles/<variant-id>/image.bin with metadata.json.
The script intentionally calls its decoded regions heuristic candidates: 16-bit
DOS images mix code, tables, and embedded data, so linear disassembly is not a
source-level function proof.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import math
import re
import shutil
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
CAPSTONE_PATH = Path(r"C:\tools\capstone-5.0.3")
if CAPSTONE_PATH.exists():
    sys.path.insert(0, str(CAPSTONE_PATH))
try:
    from capstone import Cs, CS_ARCH_X86, CS_MODE_16
except ImportError:
    Cs = None

TARGETS = ("circuit_ega", "circuit_cga", "cycles_ega", "cycles_cga", "cycles_tandy")
RUNTIME_MARKERS = (b"Microsoft C", b"Microsoft (R) C", b"Microsoft C/C++")


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_variant(path: Path) -> dict:
    image_path = path / "image.bin"
    metadata_path = path / "metadata.json"
    if not image_path.is_file() or not metadata_path.is_file():
        raise ValueError(f"missing image.bin or metadata.json in {path}")
    image = image_path.read_bytes()
    metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
    target = metadata.get("target") or metadata.get("target_id")
    if target not in TARGETS:
        target = path.name
    relocs = metadata.get("relocations", [])
    if isinstance(relocs, dict):
        relocs = relocs.get("linear", relocs.get("linear_offsets", []))
    relocs = [parse_int(x) for x in relocs]
    runtime = metadata.get("runtime_start") or metadata.get("runtime_start_offset")
    runtime = parse_int(runtime) if runtime is not None else find_runtime_start(image)
    return {"id": path.name, "target": target, "path": path, "image": image,
            "metadata": metadata, "relocations": relocs, "runtime_start": runtime}


def parse_int(value):
    if value is None:
        return None
    return int(value, 0) if isinstance(value, str) else int(value)


def find_runtime_start(image: bytes):
    positions = [p for marker in RUNTIME_MARKERS if (p := image.find(marker)) >= 0]
    return min(positions) if positions else len(image)


def high_variation(data: bytes) -> bool:
    # Keep only windows with enough symbol diversity and Shannon entropy.
    if len(data) < 32:
        return False
    counts = Counter(data)
    entropy = -sum((n / len(data)) * math.log2(n / len(data)) for n in counts.values())
    return len(counts) >= 10 and entropy >= 3.0


def exact_blocks(a: bytes, b: bytes, min_size=32):
    """Find deterministic non-overlapping exact runs from high-variation anchors."""
    anchors = defaultdict(list)
    for j in range(max(0, len(b) - min_size + 1)):
        window = b[j:j+min_size]
        if high_variation(window):
            anchors[window].append(j)
    candidates = set()
    for i in range(max(0, len(a) - min_size + 1)):
        window = a[i:i+min_size]
        if not high_variation(window):
            continue
        for j in anchors.get(window, ()):
            left = 0
            while i-left-1 >= 0 and j-left-1 >= 0 and a[i-left-1] == b[j-left-1]:
                left += 1
            right = min_size
            while i+right < len(a) and j+right < len(b) and a[i+right] == b[j+right]:
                right += 1
            candidates.add((i-left, j-left, left+right))
    chosen = []
    used_a, used_b = [], []
    for i, j, n in sorted(candidates, key=lambda x: (-x[2], x[0], x[1])):
        if any(i < end and start < i+n for start, end in used_a):
            continue
        if any(j < end and start < j+n for start, end in used_b):
            continue
        chosen.append((i, j, n))
        used_a.append((i, i+n))
        used_b.append((j, j+n))
    chosen.sort()
    merged = []
    for block in chosen:
        if merged and merged[-1][0] + merged[-1][2] == block[0] and merged[-1][1] + merged[-1][2] == block[1]:
            pi, pj, pn = merged[-1]
            merged[-1] = (pi, pj, pn + block[2])
        else:
            merged.append(block)
    return merged


def relocation_masked(data: bytes, relocations: list[int]) -> bytes:
    masked = bytearray(data)
    for offset in relocations:
        if 0 <= offset < len(masked):
            masked[offset] = 0
        if 0 <= offset + 1 < len(masked):
            masked[offset + 1] = 0
    return bytes(masked)


def control_target_context(ins, current_segment):
    """Return an (MZ-relative segment, IP) pair for a direct x86 transfer."""
    if not ins.operands:
        return None
    mnemonic = ins.mnemonic.lower()
    if mnemonic in ("lcall", "callf", "ljmp", "jmpf") and len(ins.operands) >= 2:
        if ins.operands[-1].type == 2 and ins.operands[0].type == 2:
            return (ins.operands[0].imm & 0xffff, ins.operands[-1].imm & 0xffff)
        return None
    if ins.operands[0].type == 2:
        return (current_segment, ins.operands[0].imm & 0xffff)
    return None


def image_offset(segment, ip):
    return (segment * 16 + ip) & 0xffffffff


def disassemble_candidates(v: dict) -> list[dict]:
    """Conservatively traverse reachable instructions from metadata entry seeds.

    Direct near/far call destinations become candidate starts after segment:IP
    normalization against the unrelocated MZ load image. Interrupt vectors,
    indirect calls, overlays, and code hidden behind tables remain unresolved.
    """
    if Cs is None:
        return []
    image = v["image"]
    meta = v["metadata"]
    entry = meta.get("entry_offset")
    entry_cs, entry_ip = 0, 0
    if entry is None:
        ep = meta.get("entry_point", meta.get("entry"))
        if isinstance(ep, dict) and "cs" in ep and "ip" in ep:
            entry_cs, entry_ip = parse_int(ep["cs"]), parse_int(ep["ip"])
        elif isinstance(ep, dict) and "offset" in ep:
            entry_ip = parse_int(ep["offset"])
        elif isinstance(ep, str) and ":" in ep:
            entry_cs, entry_ip = (parse_int(x) for x in ep.split(":", 1))
        elif isinstance(ep, str):
            entry_ip = parse_int(ep)
        else:
            entry_ip = parse_int(meta.get("entry_point_offset", 0))
    else:
        entry_ip = parse_int(entry)
    entry_ip &= 0xffff
    entry = image_offset(entry_cs, entry_ip)
    runtime_end = v["runtime_start"]
    md = Cs(CS_ARCH_X86, CS_MODE_16)
    md.detail = True
    decoded = {}
    decoded_context = {}
    starts = {entry: (entry_cs, entry_ip)}
    queue = [(entry_cs, entry_ip)]
    visited = set()
    while queue:
        segment, ip = queue.pop()
        off = image_offset(segment, ip)
        context = (segment, ip)
        if context in visited or off < 0 or off >= runtime_end:
            continue
        visited.add(context)
        ins = next(md.disasm(image[off:min(runtime_end, off + 15)], ip), None)
        if ins is None:
            continue
        decoded[off] = ins
        decoded_context[off] = context
        next_ip = (ip + ins.size) & 0xffff
        next_context = (segment, next_ip)
        next_off = image_offset(*next_context)
        mnemonic = ins.mnemonic.lower()
        is_call = mnemonic.startswith("call") or mnemonic in ("lcall", "callf")
        if is_call:
            dest = control_target_context(ins, segment)
            if dest is not None:
                dest_off = image_offset(*dest)
                if dest_off < runtime_end:
                    starts[dest_off] = dest
                    queue.append(dest)
            queue.append(next_context)
        elif mnemonic.startswith("ret") or mnemonic in ("iret", "iretw", "hlt"):
            continue
        elif mnemonic.startswith("j") or mnemonic in ("ljmp", "jmpf"):
            dest = control_target_context(ins, segment)
            if dest is not None:
                dest_off = image_offset(*dest)
                if dest_off < runtime_end:
                    queue.append(dest)
            if mnemonic not in ("jmp", "jmpw", "jmpl", "ljmp", "jmpf"):
                queue.append(next_context)
        else:
            queue.append(next_context)
        # Unconditional jumps, returns, and indirect control flow terminate a path.
    # Trace each call-target candidate through its own local control flow. Calls
    # stop at the callsite and resume at fallthrough; known entry targets reached
    # by jumps are treated as tail calls. The resulting span remains heuristic.
    funcs = []
    for start in sorted(starts):
        if start not in decoded:
            continue
        pending = [starts[start]]
        body = set()
        while pending:
            seg, addr = pending.pop()
            pc = image_offset(seg, addr)
            if pc in body or pc not in decoded or (pc in starts and pc != start):
                continue
            body.add(pc)
            ins = decoded[pc]
            next_ctx = (seg, (addr + ins.size) & 0xffff)
            next_pc = image_offset(*next_ctx)
            mnemonic = ins.mnemonic.lower()
            if mnemonic.startswith("ret") or mnemonic in ("iret", "iretw", "hlt"):
                continue
            if mnemonic.startswith("call") or mnemonic in ("lcall", "callf"):
                pending.append(next_ctx)
                continue
            if mnemonic.startswith("j") or mnemonic in ("ljmp", "jmpf"):
                dest = control_target_context(ins, seg)
                if dest is not None:
                    dest_pc = image_offset(*dest)
                    if dest_pc not in starts or dest_pc == start:
                        pending.append(dest)
                if mnemonic not in ("jmp", "jmpw", "jmpl", "ljmp", "jmpf"):
                    pending.append(next_ctx)
                continue
            pending.append(next_ctx)
        if not body:
            continue
        end = max(pc + decoded[pc].size for pc in body)
        if end <= start:
            continue
        funcs.append({"start": start, "end": end, "size": end-start,
                      "boundary_status": "heuristic_reachable_call_target_until_ret",
                      "confidence": "low", "classification": "UNKNOWN",
                      "runtime_attribution": "unproven",
                      "start_segment_offset": "%04X:%04X" % starts[start],
                      "decoded_instruction_count": len(body)})
    return funcs


def target_pairs(variants):
    bytarget = defaultdict(list)
    for v in variants:
        bytarget[v["target"]].append(v)
    wanted = [("circuit_ega", "cycles_ega"), ("circuit_cga", "cycles_cga"),
              ("circuit_ega", "circuit_cga"),
              ("cycles_ega", "cycles_cga"), ("cycles_ega", "cycles_tandy"),
              ("cycles_cga", "cycles_tandy")]
    pairs = []
    for ta, tb in wanted:
        if bytarget.get(ta) and bytarget.get(tb):
            pick = lambda target: sorted(bytarget[target], key=lambda v: (v["id"] != target, v["id"]))[0]
            pairs.append((pick(ta), pick(tb)))
    return pairs


def run(args):
    oracle_root = Path(args.oracles)
    out_dir = Path(args.output)
    out_dir.mkdir(parents=True, exist_ok=True)
    variants = []
    for p in sorted(oracle_root.iterdir()):
        if p.is_dir() and (p / "image.bin").exists():
            variants.append(read_variant(p))
    summary = {"schema_version": 1, "generated_by": "tools/census/analyze.py",
               "algorithm": {"min_exact_block": 32, "matching": "greedy longest non-overlapping exact runs anchored by high-variation 32-byte windows",
                             "high_variation_min_distinct_bytes": 10,
                             "high_variation_min_entropy_bits_per_byte": 3.0,
                             "matching_scope": "image bytes [0, runtime marker/start); exploratory only"},
               "variants": [], "pairs": [], "regions": []}
    for v in variants:
        summary["variants"].append({"variant_id": v["id"], "target": v["target"],
            "image_size": len(v["image"]), "image_sha256": sha256(v["image"]),
            "runtime_start": v["runtime_start"], "relocation_count": len(v["relocations"]),
            "distinct_relocation_count": len(set(v["relocations"])),
        "metadata_entry_point": v["metadata"].get("entry_point", v["metadata"].get("entry", v["metadata"].get("entry_offset"))),
            "source_metadata": "work/oracles/%s/metadata.json" % v["id"]})
    for a, b in target_pairs(variants):
        a_end, b_end = a["runtime_start"], b["runtime_start"]
        ablocks = exact_blocks(a["image"][:a_end], b["image"][:b_end])
        ar = relocation_masked(a["image"][:a_end], a["relocations"])
        br = relocation_masked(b["image"][:b_end], b["relocations"])
        nblocks = exact_blocks(ar, br)
        strict_bytes = sum(n for _, _, n in ablocks)
        norm_bytes = sum(n for _, _, n in nblocks)
        pair = {"a": a["target"], "b": b["target"],
                "a_scope_end": a_end, "b_scope_end": b_end,
                "strict_exact_high_variation_bytes": strict_bytes,
                "strict_block_count": len(ablocks),
                "relocation_masked_high_variation_bytes": norm_bytes,
                "relocation_masked_block_count": len(nblocks),
                "interpretation": "exploratory byte coverage; not function or source similarity"}
        summary["pairs"].append(pair)
        for i, j, n in ablocks:
            summary["regions"].append({"a": a["target"], "b": b["target"], "a_start": i,
                "b_start": j, "size": n, "match_type": "SHARED_EXACT",
                "common_bytes_sha256": sha256(a["image"][i:i+n]),
                "confidence": "high for these bytes only", "classification": "UNKNOWN",
                "source_level_status": "unproven"})
        for i, j, n in nblocks:
            summary["regions"].append({"a": a["target"], "b": b["target"], "a_start": i,
                "b_start": j, "size": n, "match_type": "RELOCATION_MASKED",
                "masked_bytes_sha256": sha256(ar[i:i+n]),
                "confidence": "high for masked bytes only", "classification": "UNKNOWN",
                "source_level_status": "unproven"})
    funcs = []
    for v in variants:
        for f in disassemble_candidates(v):
            f.update({"variant_id": v["id"], "target": v["target"],
                      "start_hex": f"0x{f['start']:04X}", "end_hex": f"0x{f['end']:04X}"})
            funcs.append(f)
    (out_dir / "census.json").write_text(json.dumps(summary, indent=2)+"\n", encoding="utf-8")
    (out_dir / "function_candidates.json").write_text(json.dumps({"schema_version": 1,
        "status": "heuristic; manually verify all boundaries", "functions": funcs}, indent=2)+"\n", encoding="utf-8")
    with (out_dir / "function_candidates.csv").open("w", newline="", encoding="utf-8") as f:
        cols = ["target", "variant_id", "start_hex", "end_hex", "size", "confidence", "boundary_status", "decoded_instruction_count"]
        writer = csv.DictWriter(f, fieldnames=cols)
        writer.writeheader()
        for row in funcs:
            writer.writerow({k: row.get(k, "") for k in cols})
    for filename in ("known_regions.json", "reconstruction_shortlist.json"):
        source = ROOT / "analysis" / "census" / filename
        target = out_dir / filename
        if source.resolve() != target.resolve():
            shutil.copyfile(source, target)
    print(json.dumps({"variants": len(variants), "pairs": len(summary["pairs"]),
                      "candidate_regions": len(funcs), "output": str(out_dir)}, indent=2))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--oracles", default=str(ROOT / "work" / "oracles"))
    parser.add_argument("--output", default=str(ROOT / "analysis" / "census"))
    run(parser.parse_args())
