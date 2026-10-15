#!/usr/bin/env python3
"""Find exact OMF runtime-library code fingerprints in canonical DOS images.

This records runtime byte evidence only. It does not infer which compiler built
the game, nor does it modify the manifest or the pinned oracle files.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PYTHON = Path(r"C:\Users\jiriv\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe")
MIN_WINDOW = 32
MIN_CODE_CHUNK = 40
TARGETS = ["circuit_ega", "circuit_cga", "cycles_ega", "cycles_cga", "cycles_tandy"]
RELEASES = {
    "msc-5.00": {
        "root": Path(r"C:\tools\msc-5.00"),
        "libs": ["SLIBC.LIB", "MLIBC.LIB", "CLIBC.LIB", "LLIBC.LIB"],
        "compiler": ["C1.EXE", "C2.EXE", "C3.EXE", "CL.EXE", "LINK.EXE"],
    },
    "msc-5.10": {
        "root": Path(r"C:\tools\msc-5.10"),
        "libs": ["SLIBCR.LIB", "MLIBCR.LIB", "CLIBCR.LIB", "LLIBCR.LIB"],
        "compiler": ["C1.EXE", "C2.EXE", "C3.EXE", "CL.EXE", "LINK.EXE"],
    },
    "msc-6.00": {
        "root": Path(r"C:\tools\msc-6.00"),
        "libs": ["LIB/SLIBCR.LIB", "LIB/MLIBCR.LIB", "LIB/CLIBCR.LIB", "LIB/LLIBCR.LIB"],
        "compiler": ["BIN/C1.EXE", "BIN/C2.EXE", "BIN/C3.EXE", "BIN/CL.EXE", "BIN/LINK.EXE"],
    },
}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def omf_records(data: bytes):
    """Yield records from a library module area until malformed/truncated."""
    pos = 0
    while pos + 3 <= len(data):
        kind = data[pos]
        length = int.from_bytes(data[pos + 1:pos + 3], "little")
        end = pos + 3 + length
        if length < 1 or end > len(data):
            return
        raw = data[pos:end]
        if sum(raw) & 0xFF:
            return
        yield kind, raw[3:-1], pos, end
        pos = end


def index_value(buf: bytes, pos: int):
    if pos >= len(buf):
        return None, pos
    first = buf[pos]
    if first & 0x80:
        if pos + 1 >= len(buf):
            return None, pos
        return ((first & 0x7F) << 8) | buf[pos + 1], pos + 2
    return first, pos + 1


def parse_library(path: Path):
    data = path.read_bytes()
    if not data or data[0] != 0xF0:
        return [], {"error": "missing OMF LIBHDR"}
    header_len = int.from_bytes(data[1:3], "little")
    if header_len < 4 or 3 + header_len > len(data):
        return [], {"error": "invalid LIBHDR"}
    # LIBHDR's first four data bytes are the little-endian dictionary byte
    # offset (the low word is not an absolute file offset by itself).
    dict_offset = int.from_bytes(data[3:7], "little")
    if dict_offset < 3 + header_len or dict_offset > len(data):
        dict_offset = len(data)
    mods = []
    module_area_end = dict_offset
    # Library modules are padded to page boundaries. Resume only at a valid
    # THEADR after padding; ordinary OMF records within a member stay contiguous.
    def find_theadr(start):
        pos = start
        while pos + 4 < module_area_end:
            if data[pos] == 0x80:
                length = int.from_bytes(data[pos + 1:pos + 3], "little")
                end = pos + 3 + length
                if 2 <= length <= 256 and end <= module_area_end:
                    raw = data[pos:end]
                    payload = raw[3:-1]
                    n = payload[0] if payload else 0
                    name = payload[1:1+n]
                    if sum(raw) & 0xFF == 0 and n > 0 and len(name) == n and all(32 <= c < 127 for c in name):
                        return pos
            pos += 1
        return None

    starts = []
    scan = 3 + header_len
    while (pos := find_theadr(scan)) is not None:
        starts.append(pos)
        scan = pos + 3
    record_count = 0
    for mod_pos in starts:
        pos = mod_pos
        cur = None
        lnames = []
        segments = []
        while pos + 3 <= module_area_end:
            kind = data[pos]
            length = int.from_bytes(data[pos + 1:pos + 3], "little")
            end = pos + 3 + length
            if length < 1 or end > module_area_end:
                break
            raw = data[pos:end]
            if sum(raw) & 0xFF:
                break
            payload = raw[3:-1]
            record_count += 1
            if kind == 0x80:
                n = payload[0] if payload else 0
                member = payload[1:1+n].decode("ascii", "replace") if n else "?"
                cur = {"member": member, "chunks": []}
            elif cur is not None and kind == 0x96:  # LNAMES
                p = 0
                while p < len(payload):
                    n = payload[p]
                    p += 1
                    if p + n > len(payload):
                        break
                    lnames.append(payload[p:p+n].decode("ascii", "replace"))
                    p += n
            elif cur is not None and kind in (0x98, 0x99):  # SEGDEF/SEGDEF32
                p = 1 + (2 if kind == 0x98 else 4)
                seg_name, p = index_value(payload, p)
                class_name, p = index_value(payload, p)
                _, p = index_value(payload, p)
                sn = lnames[seg_name - 1] if seg_name and seg_name <= len(lnames) else ""
                cn = lnames[class_name - 1] if class_name and class_name <= len(lnames) else ""
                segments.append((sn, cn))
            elif cur is not None and kind in (0xA0, 0xA1):  # LEDATA/LEDATA32
                seg, p = index_value(payload, 0)
                if seg is not None and p + (2 if kind == 0xA0 else 4) <= len(payload):
                    p += 2 if kind == 0xA0 else 4
                    sn, cn = segments[seg - 1] if seg and seg <= len(segments) else ("", "")
                    code = cn.upper() in {"CODE", "_TEXT", "TEXT", "C_CODE"} or sn.upper() in {"CODE", "_TEXT", "TEXT"}
                    raw_code = payload[p:]
                    if code and len(raw_code) >= MIN_CODE_CHUNK:
                        cur["chunks"].append({"segment": sn, "class": cn, "bytes": raw_code})
            elif cur is not None and kind in (0x8A, 0x8B):  # MODEND/MODEND32
                mods.append(cur)
                cur = None
                break
            pos = end
        if cur is not None:
            mods.append(cur)
    summary = {
        "sha256": sha256(path),
        "size": len(data),
        "module_count": len(mods),
        "code_module_count": sum(bool(m["chunks"]) for m in mods),
        "code_chunks": sum(len(m["chunks"]) for m in mods),
        "code_bytes": sum(len(c["bytes"]) for m in mods for c in m["chunks"]),
        "omf_record_count": record_count,
    }
    return mods, summary


def entropy_window(b: bytes):
    counts = Counter(b)
    return len(counts), -sum((n / len(b)) * math.log2(n / len(b)) for n in counts.values())


def fingerprint(mods):
    """Unique 32-byte high-variation shingles, retaining full source chunk."""
    out = {}
    for mod in mods:
        for chunk in mod["chunks"]:
            raw = chunk["bytes"]
            for i in range(0, len(raw) - MIN_WINDOW + 1, 4):
                w = raw[i:i+MIN_WINDOW]
                distinct, ent = entropy_window(w)
                if distinct < 12 or ent < 3.2:
                    continue
                out.setdefault(w, []).append((mod["member"], chunk["segment"], i, raw))
    return out


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=ROOT / "work/research/runtime_libraries.json")
    parser.add_argument("--check", action="store_true", help="compare a fresh scan with tracked evidence without rewriting it")
    args = parser.parse_args()
    manifest = json.loads((ROOT / "analysis" / "manifest.json").read_text(encoding="utf-8"))
    variant_by_id = {v["id"]: v for v in manifest["variants"]}
    expected_images = {
        t["id"]: variant_by_id[t["canonical_variant"]]["image_sha256"]
        for t in manifest["targets"]
    }
    if set(expected_images) != set(TARGETS):
        raise ValueError(f"canonical target set mismatch: {sorted(expected_images)}")
    images = {}
    for target in TARGETS:
        path = ROOT / "work" / "oracles" / target / "image.bin"
        digest = sha256(path)
        if digest != expected_images[target]:
            raise ValueError(f"oracle digest mismatch for {target}: {digest} != {expected_images[target]}")
        images[target] = path.read_bytes()
    variants = {}
    release_out = {}
    global_cache = {}
    for release, spec in RELEASES.items():
        root = spec["root"]
        prov = root / "provenance.json"
        provenance = {"path": str(prov), "sha256": sha256(prov)} if prov.exists() else None
        compiler_hashes = {}
        for relpath in spec["compiler"]:
            path = root / relpath
            if path.exists():
                compiler_hashes[relpath] = {"sha256": sha256(path), "size": path.stat().st_size}
        lib_results = {}
        for relpath in spec["libs"]:
            path = root / relpath
            if not path.exists():
                lib_results[relpath] = {"error": "missing"}
                continue
            cache_key = (str(path), path.stat().st_mtime_ns, path.stat().st_size)
            if cache_key not in global_cache:
                mods, lib_meta = parse_library(path)
                shingles = fingerprint(mods)
                global_cache[cache_key] = (mods, lib_meta, shingles)
            mods, lib_meta, shingles = global_cache[cache_key]
            matches = {}
            for target, image in images.items():
                member_windows = defaultdict(set)
                member_max_run = defaultdict(int)
                member_best_offset = {}
                # For each high-variation shingle in each member, keep module
                # attribution; the whole source chunk is also used to recover
                # the longest exact contiguous run in that chunk.
                for w, origins in shingles.items():
                    p = image.find(w)
                    if p < 0:
                        continue
                    for member, segment, off, chunk in origins:
                        member_windows[member].add(w)
                        # Longest exact sequence extending around the seed.
                        left = 0
                        while off-left > 0 and p-left > 0 and chunk[off-left-1] == image[p-left-1]:
                            left += 1
                        right = MIN_WINDOW
                        while off+right < len(chunk) and p+right < len(image) and chunk[off+right] == image[p+right]:
                            right += 1
                        run_len = left + right
                        if run_len > member_max_run[member]:
                            member_max_run[member] = run_len
                            member_best_offset[member] = p - left
                ranked = sorted(member_windows, key=lambda m: (len(member_windows[m]), member_max_run[m]), reverse=True)
                max_run_member = max(member_max_run, key=member_max_run.get) if member_max_run else None
                matches[target] = {
                    "matched_member_count": len(ranked),
                    "matched_32b_window_count": sum(len(member_windows[m]) for m in ranked),
                    "strongest_member": ranked[0] if ranked else None,
                    "longest_exact_run_member": max_run_member,
                    "longest_exact_run_bytes": member_max_run[max_run_member] if max_run_member else 0,
                    "shortlist": [
                    {"member": m, "matching_32b_windows": len(member_windows[m]),
                     "longest_exact_run_bytes": member_max_run[m],
                     "image_offset": member_best_offset[m]}
                    for m in ranked[:12]],
                }
            lib_results[relpath] = {**lib_meta, "targets": matches}
        release_summaries = {}
        for target in TARGETS:
            all_candidates = []
            matched_libraries = 0
            matched_slots = 0
            distinct_names = set()
            longest_run = 0
            for lib_name, lib in lib_results.items():
                stats = lib.get("targets", {}).get(target, {})
                shortlist = stats.get("shortlist", [])
                if stats.get("matched_member_count", 0):
                    matched_libraries += 1
                matched_slots += stats.get("matched_member_count", 0)
                longest_run = max(longest_run, stats.get("longest_exact_run_bytes", 0))
                for candidate in shortlist:
                    distinct_names.add(candidate["member"])
                    all_candidates.append({"library": lib_name, **candidate})
            all_candidates.sort(key=lambda x: (x["matching_32b_windows"], x["longest_exact_run_bytes"]), reverse=True)
            release_summaries[target] = {
                "libraries_with_hits": matched_libraries,
                "matched_member_slots": matched_slots,
                "distinct_shortlist_member_names": len(distinct_names),
                "longest_exact_run_bytes": longest_run,
                "best_candidates": all_candidates[:12],
            }
        release_out[release] = {
            "directory": str(root), "provenance_file": provenance,
            "compiler_tool_hashes": compiler_hashes, "libraries": lib_results,
            "target_summary": release_summaries,
        }
    output = {
        "schema": "runtime-library-fingerprints-v1",
        "method": {
            "input": "OMF library LEDATA bytes from segments whose SEGDEF name or class is CODE/_TEXT/TEXT",
            "match": "Exact 32-byte windows, sampled every 4 bytes, at least 12 distinct byte values and Shannon entropy >=3.2 bits/byte; exact contiguous extension around each hit",
            "image_scope": "Headerless, unrelocated load image only; excludes the MZ header and applied relocations",
            "limitations": ["Exact runtime byte evidence only; it does not identify the game's compiler or compiler version.",
                           "Only library-owned code regions are searched; fixup bytes can break exact runs.",
                           "Libraries are read in place and are neither copied nor included in output.",
                           "A matching member may be common runtime code or coincidental; review context before attribution."],
        },
        "targets": {t: {"path": f"work/oracles/{t}/image.bin", "sha256": sha256(ROOT / "work" / "oracles" / t / "image.bin"), "manifest_sha256": expected_images[t], "size": len(images[t])} for t in TARGETS},
        "releases": release_out,
    }
    out = args.output
    if args.check:
        locked = json.loads((ROOT / "analysis/runtime_libraries.json").read_text(encoding="utf-8"))
        if locked != output:
            raise ValueError("runtime-library evidence differs (tracked report not updated)")
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    if args.check:
        print("verified runtime fingerprints: five pinned targets, three Microsoft C runtime releases")
        return
    print(f"wrote {out}")
    for release, item in release_out.items():
        print(release)
        for lib, lm in item["libraries"].items():
            if "error" in lm:
                print(f"  {lib}: {lm['error']}")
                continue
            print(f"  {lib}: {lm['module_count']} members, {lm['code_module_count']} code members")
            for target, rows in lm.get("targets", {}).items():
                if rows["shortlist"]:
                    print(f"    {target}: " + ", ".join(f"{r['member']}({r['matching_32b_windows']}w/{r['longest_exact_run_bytes']}b)" for r in rows["shortlist"][:5]))


if __name__ == "__main__":
    main()
