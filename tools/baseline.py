"""Build private oracle artifacts and public provenance metadata; never edits assets."""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from exepack.mz import (parse_mz, exepack_header, unpack, sha256,
                        relocations_hash, analytical_mz)

VARIANTS = [
    ("circuit_ega", "circuit_ega", "Circuit/GPEGA.EXE", "preferred_supplied"),
    ("circuit_cga", "circuit_cga", "Circuit/GPCGA.EXE", "preferred_supplied"),
    ("cycles_ega", "cycles_ega", "Cycles/CPC2001.DAT", "preferred_hash_pinned"),
    ("cycles_cga", "cycles_cga", "Cycles/CPC2001C.DAT", "preferred_hash_pinned"),
    ("cycles_ega_old", "cycles_ega", "Cycles/GPEGA.OLD", "patched_evidence"),
    ("cycles_ega_exe", "cycles_ega", "Cycles/GPEGA.EXE", "patched_evidence"),
    ("cycles_ega_gp1", "cycles_ega", "Cycles/GP1.EXE", "patched_evidence"),
    ("cycles_ega_ex_", "cycles_ega", "Cycles/GPEGA.EX_", "patched_evidence"),
    ("cycles_cga_exe", "cycles_cga", "Cycles/GPCGA.EXE", "patched_evidence"),
    ("cycles_cga_ex_", "cycles_cga", "Cycles/GPCGA.EX_", "patched_evidence"),
    ("cycles_tandy", "cycles_tandy", "Cycles/GPTDY.EX_", "provisional_packed_supplied"),
    ("cycles_tandy_exe", "cycles_tandy", "Cycles/GPTDY.EXE", "patched_evidence"),
]
PINS = {
    "cycles_ega": "55957c1b364edb45c4e23e381aaa9c1f4eee6ac0a3cdcaf3b9ffa53e6f6b82b6",
    "cycles_cga": "211c467bb04f459500a53ccd212ecdf83282d955309debdf1a426b279ad0ff6d",
}


def dump(path: Path, obj):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def difference(a: bytes, b: bytes) -> dict:
    changes = [{"offset": i, "before": x, "after": y}
               for i, (x, y) in enumerate(zip(a, b)) if x != y]
    return {"different_bytes": len(changes), "changes": changes,
            "left_length": len(a), "right_length": len(b),
            "left_tail_hex": a[len(b):].hex(), "right_tail_hex": b[len(a):].hex()}


def build(assets: Path, output: Path, analysis: Path) -> dict:
    files = []
    for p in sorted(assets.rglob("*")):
        if p.is_file():
            data = p.read_bytes()
            item = {"path": p.relative_to(assets).as_posix(), "size": len(data), "sha256": sha256(data)}
            item["format"] = "DOS_MZ" if data[:2] == b"MZ" else "non_MZ"
            if item["format"] == "DOS_MZ":
                mz_file = parse_mz(data)
                packed = exepack_header(mz_file)
                if packed:
                    img, rloc, packed = unpack(mz_file)
                    entry = {"cs": packed["real_cs"], "ip": packed["real_ip"]}
                    stack = {"ss": packed["real_ss"], "sp": packed["real_sp"]}
                else:
                    img, rloc = mz_file.image, mz_file.relocations
                    entry = {"cs": mz_file.header["cs"], "ip": mz_file.header["ip"]}
                    stack = {"ss": mz_file.header["ss"], "sp": mz_file.header["sp"]}
                item.update(compression="EXEPACK" if packed else "none",
                            image_sha256=sha256(img), image_size=len(img),
                            relocation_count=len(rloc), relocations_sha256=relocations_hash(rloc),
                            entry=entry, stack=stack, mz_header=mz_file.header,
                            overlay_size=len(mz_file.overlay))
            files.append(item)
    variants = []
    images, relocations = {}, {}
    for vid, target, relative, status in VARIANTS:
        data = (assets / relative).read_bytes()
        source_hash = sha256(data)
        if vid in PINS and source_hash != PINS[vid]:
            raise ValueError(f"canonical source hash mismatch: {relative}")
        mz = parse_mz(data)
        eh = exepack_header(mz)
        if eh:
            image, relocs, eh = unpack(mz)
            entry = {"cs": eh["real_cs"], "ip": eh["real_ip"]}
            stack = {"ss": eh["real_ss"], "sp": eh["real_sp"]}
        else:
            image, relocs = mz.image, mz.relocations
            entry = {"cs": mz.header["cs"], "ip": mz.header["ip"]}
            stack = {"ss": mz.header["ss"], "sp": mz.header["sp"]}
        metadata = dict(id=vid, target=target, path="assets/" + relative,
                        source_sha256=source_hash, size=len(data), format="DOS_MZ",
                        compression="EXEPACK" if eh else "none", image_size=len(image),
                        image_sha256=sha256(image), relocation_count=len(relocs),
                        relocations_sha256=relocations_hash(relocs),
                        relocations_set_sha256=relocations_hash(sorted(relocs)),
                        entry=entry, stack=stack, oracle_status=status,
                        mz_header=mz.header, exepack=eh, overlay_size=len(mz.overlay),
                        overlay_sha256=sha256(mz.overlay))
        metadata["relocation_duplicate_count"] = len(relocs) - len(set(relocs))
        dest = output / vid
        dest.mkdir(parents=True, exist_ok=True)
        (dest / "image.bin").write_bytes(image)
        dump(dest / "metadata.json", dict(metadata, relocations=relocs))
        if eh:
            new_mz = analytical_mz(image, relocs, entry, stack,
                                   dict(mz.header, packed_image_size=len(mz.image)))
            roundtrip = parse_mz(new_mz)
            assert roundtrip.image == image and roundtrip.relocations == relocs
            (dest / "analytical.exe").write_bytes(new_mz)
            metadata["analytical_mz_sha256"] = sha256(new_mz)
        variants.append(metadata)
        images[vid], relocations[vid] = image, relocs
    comparisons = []
    for vid, target, _, _ in VARIANTS:
        if vid == target:
            continue
        left, right = relocations[target], relocations[vid]
        canonical = next(v for v in variants if v["id"] == target)
        alternate = next(v for v in variants if v["id"] == vid)
        before_bytes = (assets / canonical["path"].removeprefix("assets/")).read_bytes()
        after_bytes = (assets / alternate["path"].removeprefix("assets/")).read_bytes()
        raw_delta = difference(before_bytes, after_bytes)
        # Large changes caused by container/header shifts are represented by
        # hashes and MZ field differences, rather than dumping whole binaries.
        raw_summary = dict(different_bytes_in_overlap=raw_delta["different_bytes"],
                           left_length=len(before_bytes), right_length=len(after_bytes))
        if raw_delta["different_bytes"] <= 256 and len(before_bytes) == len(after_bytes):
            raw_summary["changes"] = raw_delta["changes"]
        comparisons.append(dict(left=target, right=vid,
                                image=difference(images[target], images[vid]),
                                raw=raw_summary,
                                mz_header_changes={k: {"before": canonical["mz_header"][k], "after": alternate["mz_header"][k]}
                                                   for k in canonical["mz_header"] if canonical["mz_header"][k] != alternate["mz_header"][k]},
                                relocation_order_equal=left == right,
                                relocation_set_equal=set(left) == set(right),
                                relocation_removed=sorted(set(left) - set(right)),
                                relocation_added=sorted(set(right) - set(left))))
    duplicates = {}
    for f in files:
        duplicates.setdefault(f["sha256"], []).append(f["path"])
    result = dict(schema_version=1,
                  provenance_note="Supplied extracted directories only; original archive containers absent. Archive membership assertions beyond filenames are unverified.",
                  targets=[dict(id=t, canonical_variant=t) for t in
                           ("circuit_ega", "circuit_cga", "cycles_ega", "cycles_cga", "cycles_tandy")],
                  variants=variants, files=files, comparisons=comparisons,
                  duplicate_content=[dict(sha256=h, paths=p) for h, p in sorted(duplicates.items()) if len(p) > 1])
    dump(analysis / "manifest.json", result)
    dump(analysis / "patches.json", comparisons)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--assets", type=Path, default=ROOT / "assets")
    parser.add_argument("--output", type=Path, default=ROOT / "work/oracles")
    parser.add_argument("--analysis", type=Path, default=ROOT / "analysis")
    parser.add_argument("--check", action="store_true", help="compare regenerated manifest to tracked lock, without updating it")
    args = parser.parse_args()
    # Once established, the evidence lock can only be changed by a deliberate
    # reviewed edit. Routine baseline generation must never rewrite its pins.
    if args.check or (args.analysis / "manifest.json").exists():
        import tempfile
        with tempfile.TemporaryDirectory() as tmp:
            fresh = build(args.assets, args.output, Path(tmp))
        locked = json.loads((args.analysis / "manifest.json").read_text())
        if fresh != locked:
            raise SystemExit("FAIL: supplied evidence differs from manifest lock (not updated)")
    else:
        fresh = build(args.assets, args.output, args.analysis)
    for v in fresh["variants"]:
        print(f'{v["id"]:20} {v["image_size"]:6} bytes {v["relocation_count"]:4} relocations {v["image_sha256"]}')


if __name__ == "__main__":
    main()
