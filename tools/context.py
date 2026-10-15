#!/usr/bin/env python3
"""Read-only, target-specific code context from the pinned oracle and census."""
from __future__ import annotations
import argparse
import fnmatch
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
if (ROOT / "work/python").is_dir():
    sys.path.insert(0, str(ROOT / "work/python"))
from tools.matching import pipeline


def names() -> list[dict]:
    rows = []
    for path in sorted((ROOT / "analysis/recipes").glob("*.json")):
        item = json.loads(path.read_text(encoding="utf-8"))
        for target, extent in item.get("targets", {}).items():
            rows.append({"name": item.get("public", item["id"]), "target": target,
                         "start": int(extent["start"], 0) if isinstance(extent["start"], str) else extent["start"],
                         "end": int(extent["end"], 0) if isinstance(extent["end"], str) else extent["end"],
                         "source": str(path.relative_to(ROOT))})
    shortlist = json.loads((ROOT / "analysis/census/reconstruction_shortlist.json").read_text(encoding="utf-8"))
    for cluster in shortlist["clusters"]:
        for t in cluster["targets"]:
            rows.append({"name": cluster["id"], "target": t["target"],
                         "start": int(t["start"], 0), "end": int(t["end_exclusive"], 0),
                         "source": "shortlist (may be internal slice)"})
    return rows


def direct_transfer(ins, immediate_type):
    if ins.mnemonic in ("lcall", "ljmp") and len(ins.operands) == 2:
        if all(op.type == immediate_type for op in ins.operands):
            return ins.operands[0].imm * 16 + ins.operands[1].imm, "far"
    if (ins.mnemonic.startswith(("call", "jmp")) and ins.operands
            and ins.operands[0].type == immediate_type):
        return ins.operands[0].imm, "near"
    return None


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("target", nargs="?", choices=pipeline.TARGETS)
    p.add_argument("identifier", nargs="?")
    p.add_argument("--list", metavar="PATTERN")
    args = p.parse_args()
    named = names()
    if args.list is not None:
        print(json.dumps([r for r in named if (args.target is None or r["target"] == args.target)
                          and fnmatch.fnmatch(r["name"].lower(), args.list.lower())], indent=2))
        return 0
    if not args.target or not args.identifier:
        p.error("TARGET and OFFSET or NAME are required unless --list is used")
    image, relocs, meta = pipeline.oracle(args.target)
    matches = [r for r in named if r["target"] == args.target and r["name"].lower() == args.identifier.lower()]
    if matches:
        row = matches[0]
        offset = row["start"]
    else:
        try:
            offset = int(args.identifier, 0)
        except ValueError as exc:
            raise SystemExit(f"unknown name {args.identifier}; use --list '*pattern*'") from exc
        row = next((r for r in named if r["target"] == args.target and r["start"] <= offset < r["end"]), None)
    census = json.loads((ROOT / "analysis/census/function_candidates.json").read_text(encoding="utf-8"))["functions"]
    candidates = [r for r in census if r.get("target") == args.target]
    enclosing = next((r for r in candidates if r["start"] <= offset < r["end"]), None)
    start = row["start"] if row else enclosing["start"] if enclosing else offset
    end = row["end"] if row else enclosing["end"] if enclosing else min(offset + 64, len(image))
    end = min(end, start + 256)  # compact packet
    from capstone import Cs, CS_ARCH_X86, CS_MODE_16
    from capstone.x86_const import X86_OP_IMM, X86_OP_MEM
    dis = Cs(CS_ARCH_X86, CS_MODE_16)
    dis.detail = True
    instruction_rows = []
    calls_out = []
    ds_refs = []
    for ins in dis.disasm(image[start:end], start):
        marks = [r for r in relocs if ins.address <= r < ins.address + ins.size]
        instruction_rows.append({"at": f"0x{ins.address:x}", "bytes": ins.bytes.hex(),
                                 "asm": f"{ins.mnemonic} {ins.op_str}".strip(),
                                 **({"relocation_words": marks} if marks else {})})
        transfer = direct_transfer(ins, X86_OP_IMM)
        if transfer:
            calls_out.append({"from": ins.address, "to": transfer[0],
                              "kind": ins.mnemonic, "distance": transfer[1],
                              "scope": "linear disassembly"})
        for op in ins.operands:
            if op.type == X86_OP_MEM and not op.mem.base and not op.mem.index:
                ds_refs.append({"from": ins.address, "offset": op.mem.disp & 0xffff,
                                "segment": ins.reg_name(op.mem.segment) if op.mem.segment else "default DS (heuristic)"})
    callers = []
    for candidate in candidates:
        if candidate["end"] - candidate["start"] > 4096:
            continue
        for ins in dis.disasm(image[candidate["start"]:candidate["end"]], candidate["start"]):
            if ins.mnemonic in ("call", "lcall"):
                transfer = direct_transfer(ins, X86_OP_IMM)
                if transfer and start <= transfer[0] < end:
                    callers.append({"from": ins.address, "to": transfer[0],
                                    "distance": transfer[1], "candidate_start": candidate["start"]})
    print(json.dumps({"target": args.target, "image_sha256": meta["image_sha256"],
                      "range": [start, end], "name": row["name"] if row else None,
                      "boundary": {k: enclosing.get(k) for k in ("start", "end", "boundary_status", "confidence")}
                      if enclosing else None, "disassembly": instruction_rows,
                      "direct_callers": callers[:30], "direct_callees": calls_out,
                      "absolute_data_references": ds_refs,
                      "scope": "Census boundaries and linear disassembly are heuristic; no shared-source attribution."}, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
