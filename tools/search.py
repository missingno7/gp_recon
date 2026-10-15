#!/usr/bin/env python3
"""Fresh Microsoft C/MASM candidate search against independent DOS targets."""
from __future__ import annotations
import argparse
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
if (ROOT / "work/python").is_dir():
    sys.path.insert(0, str(ROOT / "work/python"))
from tools.matching import pipeline


def number(value: str) -> int:
    return int(value, 16) if value.lower().startswith("0x") else int(value, 10)


def instruction_diff(code: bytes, oracle: bytes, start: int, fixes: list[dict]) -> list[dict]:
    from capstone import Cs, CS_ARCH_X86, CS_MODE_16
    decoder = Cs(CS_ARCH_X86, CS_MODE_16)
    slots = {i for f in fixes for i in range(f["offset"], f["offset"] + f["width"])}
    left = list(decoder.disasm(code, start))
    right = {i.address: i for i in decoder.disasm(oracle, start)}
    out = []
    for ins in left:
        a = ins.address - start
        if any(a + j not in slots and a + j < len(oracle) and code[a + j] != oracle[a + j]
               for j in range(ins.size)):
            other = right.get(ins.address)
            out.append({"at": f"0x{ins.address:x}", "candidate": f"{ins.mnemonic} {ins.op_str}",
                        "oracle": f"{other.mnemonic} {other.op_str}" if other else "decode diverged"})
            if len(out) == 5:
                break
    return out


def canonical_source(candidate: Path) -> str:
    """Repository path the source will occupy: the part after a worker's stage/ directory."""
    parts = candidate.resolve().parts
    if "stage" in parts:
        return Path(*parts[len(parts) - parts[::-1].index("stage"):]).as_posix()
    return candidate.resolve().relative_to(ROOT).as_posix()


def write_recipe(args, profile: str, fixes: list[dict], report: dict) -> None:
    lf = args.candidate.read_bytes().replace(bytes([13, 10]), bytes([10]))
    keys = ("offset", "loc", "width", "self_relative", "target", "frame")
    recipe = {
        "schema": 1,
        "id": args.id or args.write_recipe.stem,
        "source": canonical_source(args.candidate),
        "source_sha256": pipeline.digest(lf),
        "profile": profile,
        "public": args.public,
        "expected_fixups": [{k: f[k] for k in keys} for f in fixes],
        "targets": {t["target"]: {"start": int(t["range"].split(":")[0], 16),
                                  "end": int(t["range"].split(":")[1], 16)}
                    for t in report["targets"]},
    }
    args.write_recipe.parent.mkdir(parents=True, exist_ok=True)
    args.write_recipe.write_bytes(json.dumps(recipe, indent=2).encode("utf-8") + bytes([10]))
    print(f"search: wrote {args.write_recipe}", file=sys.stderr)


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("candidate", type=Path)
    p.add_argument("--target", action="append", required=True)
    p.add_argument("--range", dest="ranges", action="append", required=True)
    p.add_argument("--public", required=True)
    p.add_argument("--profile")
    p.add_argument("--bindings", type=Path,
                   help="scratch JSON {target: {symbol: address}} merged over the tracked bindings")
    p.add_argument("--write-recipe", type=Path, metavar="JSON",
                   help="when every target is strict, write a reviewable recipe here")
    p.add_argument("--id", help="recipe id for --write-recipe (default: file stem)")
    args = p.parse_args()
    if len(args.target) != len(args.ranges):
        p.error("each --target needs a corresponding --range")
    profile = args.profile or ("masm510" if args.candidate.suffix.lower() == ".asm" else "msc510-small-o_gs")
    extra = json.loads(args.bindings.read_text(encoding="utf-8")) if args.bindings else {}
    try:
        obj, build = pipeline.build(args.candidate, profile)
        report = {"build": build, "targets": [],
                  "scratch_bindings": str(args.bindings) if args.bindings else None}
        if obj is not None:
            for target, extent in zip(args.target, args.ranges):
                a, b = extent.split(":", 1)
                start, end = number(a), number(b)
                image, relocs, meta = pipeline.oracle(target)
                if not 0 <= start < end <= len(image):
                    raise ValueError(f"invalid range for {target}: {extent}")
                code, fixes, public = pipeline.extract(obj, args.public, end - start)
                original = image[start:end]
                comparison = pipeline.verify(code, fixes, original, start, relocs,
                                             {**pipeline.binding_file(target), **extra.get(target, {})},
                                             public)
                comparison.update({"target": target, "range": f"0x{start:x}:0x{end:x}",
                                   "image_sha256": meta["image_sha256"],
                                   "instruction_diff": instruction_diff(code, original, start, fixes)})
                report["targets"].append(comparison)
        scratch = Path(build["scratch"])
        (scratch / "report.json").write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        print(json.dumps(report, indent=2, sort_keys=True))
        if args.write_recipe:
            if obj is None or not all(t["strict"] for t in report["targets"]):
                print("search: not every target is strict; no recipe written", file=sys.stderr)
                return 1
            write_recipe(args, profile, fixes, report)
        return 0 if obj is not None else 1
    except Exception as exc:
        print(f"search: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
