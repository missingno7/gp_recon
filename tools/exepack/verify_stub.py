"""Independently execute original EXEPACK machine code using Unicorn 2.1.4.

Does not call the Python decompressor or relocation-table decoder. Records the
actual ES:[DI] relocation additions made by the stub, including multiplicity.
"""
from __future__ import annotations

import argparse
import json
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
if Path("C:/tools/gp-recon-python").exists():
    sys.path.insert(0, "C:/tools/gp-recon-python")
import unicorn
from unicorn import Uc, UC_ARCH_X86, UC_MODE_16, UC_HOOK_CODE, UC_HOOK_INTR
from unicorn.x86_const import (UC_X86_REG_CS, UC_X86_REG_IP, UC_X86_REG_SS,
                              UC_X86_REG_SP, UC_X86_REG_DS, UC_X86_REG_ES,
                              UC_X86_REG_DI)
from exepack.mz import parse_mz, sha256, relocations_hash


def execute(data: bytes, meta: dict, expected: bytes, load_segment: int) -> dict:
    mz = parse_mz(data)
    h = mz.header
    cpu = Uc(UC_ARCH_X86, UC_MODE_16)
    cpu.mem_map(0, 2 * 1024 * 1024)
    base = load_segment * 16
    loaded = bytearray(mz.image)
    for loc in mz.relocations:
        struct.pack_into("<H", loaded, loc,
                         (struct.unpack_from("<H", loaded, loc)[0] + load_segment) & 0xFFFF)
    cpu.mem_write(base, bytes(loaded))
    cpu.reg_write(UC_X86_REG_DS, load_segment - 16)
    cpu.reg_write(UC_X86_REG_ES, load_segment - 16)
    cpu.reg_write(UC_X86_REG_CS, load_segment + h["cs"])
    cpu.reg_write(UC_X86_REG_IP, h["ip"])
    cpu.reg_write(UC_X86_REG_SS, load_segment + h["ss"])
    cpu.reg_write(UC_X86_REG_SP, h["sp"])
    endpoint = base + meta["entry"]["cs"] * 16 + meta["entry"]["ip"]
    relocs = []
    reached = []

    def instruction(uc, address, size, _):
        if address == endpoint:
            reached.append(True)
            uc.emu_stop()
            return
        # Both normal and 0xffff wrap paths execute this addition. The address
        # comes from running registers, not the recovered table or manifest.
        if size == 3 and bytes(uc.mem_read(address, 3)) == b"\x26\x01\x1d":
            relocs.append(uc.reg_read(UC_X86_REG_ES) * 16 + uc.reg_read(UC_X86_REG_DI) - base)

    def interrupt(uc, number, _):
        raise ValueError(f"unexpected interrupt {number:02x} during unpacking")

    cpu.hook_add(UC_HOOK_CODE, instruction)
    cpu.hook_add(UC_HOOK_INTR, interrupt)
    cpu.emu_start(base + h["cs"] * 16 + h["ip"], 0x1FFFFF, count=4000000)
    if not reached:
        raise ValueError("stub did not reach original entry within instruction budget")
    actual = bytes(cpu.mem_read(base, len(expected)))
    relocated_expected = bytearray(expected)
    for loc in meta["relocations"]:
        struct.pack_into("<H", relocated_expected, loc,
                         (struct.unpack_from("<H", relocated_expected, loc)[0] + load_segment) & 0xFFFF)
    if actual != relocated_expected:
        mismatches = [i for i, (a, b) in enumerate(zip(actual, relocated_expected)) if a != b]
        raise ValueError(f"stub image mismatch: {len(mismatches)}, first={mismatches[:8]}")
    if relocs != meta["relocations"]:
        raise ValueError("stub relocation sequence differs from decoded table")
    if (cpu.reg_read(UC_X86_REG_SS), cpu.reg_read(UC_X86_REG_SP)) != (
            load_segment + meta["stack"]["ss"], meta["stack"]["sp"]):
        raise ValueError("original stack differs")
    return dict(load_segment=load_segment, relocated_image_sha256=sha256(actual),
                relocation_count=len(relocs), relocation_trace_sha256=relocations_hash(relocs),
                entry_reached=True, image_exact=True, relocation_order_exact=True,
                stack_exact=True)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--manifest", type=Path, default=ROOT / "analysis/manifest.json")
    p.add_argument("--oracles", type=Path, default=ROOT / "work/oracles")
    p.add_argument("--output", type=Path, default=ROOT / "analysis/stub_verification.json")
    args = p.parse_args()
    manifest = json.loads(args.manifest.read_text())
    results = []
    for variant in manifest["variants"]:
        if variant["compression"] != "EXEPACK":
            continue
        vid = variant["id"]
        data = (ROOT / variant["path"]).read_bytes()
        meta = json.loads((args.oracles / vid / "metadata.json").read_text())
        image = (args.oracles / vid / "image.bin").read_bytes()
        if sha256(data) != variant["source_sha256"] or sha256(image) != variant["image_sha256"]:
            raise ValueError("source or oracle identity mismatch")
        runs = [execute(data, meta, image, segment) for segment in (0x1000, 0x2123)]
        results.append(dict(variant=vid, source_sha256=sha256(data), image_sha256=sha256(image), runs=runs))
        print(f"{vid}: original stub exact at both load segments; {meta['relocation_count']} relocation writes", flush=True)
    result = dict(schema_version=1, method="original EXEPACK x86 instructions, no DOS APIs", unicorn_version=unicorn.__version__, variants=results)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")


if __name__ == "__main__":
    main()
