#!/usr/bin/env python3
"""Freshly assemble and verify the shared 36-byte decimal formatter."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys


ROOT = Path(__file__).resolve().parents[2]
SOURCE = Path("src/engine/format/decimal_ascii4.asm")
SOURCE_SHORT = "DEC4.ASM"
OBJECT_SHORT = "DEC4.OBJ"
PLAYER = Path(r"C:\tools\nmlgcdos\msdos.exe")
ASSEMBLER = Path(r"C:\tools\masm-5.10\files\MASM.EXE")
PLAYER_SHA256 = "f7f6cb0a3e816c5edb13112d327c1bddbf7463fe7bf9a005ca1eb5317751bd02"
ASSEMBLER_SHA256 = "233120302473749eafe9a54a30f8bda0127140c44346e5bcc047d113828a741e"
EXPECTED = {
    "circuit_ega": (0x5704, "work/oracles/circuit_ega/image.bin"),
    "circuit_cga": (0x55BA, "work/oracles/circuit_cga/image.bin"),
    "cycles_ega": (0x1D68, "work/oracles/cycles_ega/image.bin"),
    "cycles_cga": (0x1C46, "work/oracles/cycles_cga/image.bin"),
    "cycles_tandy": (0x1C3C, "work/oracles/cycles_tandy/image.bin"),
}
SYMBOL = "_format_u8_decimal3"
LENGTH = 36
MATCH_SHA256 = "f0ff22ad4482e1515056175f4764a3696c2a6ae630538c54a99bd27558acf072"
RECEIPT = Path("analysis/compiler/decimal_proof.json")
BUILDER_PIN = Path("analysis/compiler/decimal_build.sha256")


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def pascal_name(data: bytes, pos: int) -> tuple[str, int]:
    if pos >= len(data):
        raise ValueError("truncated OMF name length")
    n = data[pos]
    end = pos + n + 1
    if end > len(data):
        raise ValueError("truncated OMF name")
    return data[pos + 1 : end].decode("ascii"), end


def omf_public_code(path: Path, wanted: str, expected_length: int) -> tuple[str, int, bytes]:
    """Extract one strict, contiguous, relocation-free OMF public code symbol."""
    data = path.read_bytes()
    pos = 0
    names: list[str] = [""]
    segments: dict[int, tuple[str, str, int]] = {}
    publics: list[tuple[str, int, int]] = []
    ledatas: dict[int, list[tuple[int, bytes]]] = {}
    seg_count = 0
    while pos < len(data):
        if pos + 3 > len(data):
            raise ValueError("truncated OMF record header")
        rectype = data[pos]
        reclen = int.from_bytes(data[pos + 1 : pos + 3], "little")
        end = pos + 3 + reclen
        if reclen < 1 or end > len(data):
            raise ValueError("invalid OMF record length")
        rec = data[pos + 3 : end - 1]
        if sum(data[pos:end]) & 0xFF:
            raise ValueError(f"bad OMF checksum at {pos:#x}")
        if rectype in (0x9C, 0x9D):
            raise ValueError("unexpected OMF fixup record in relocation-free source")
        if rectype == 0x96:  # LNAMES
            i = 0
            while i < len(rec):
                name, i = pascal_name(rec, i)
                names.append(name)
        elif rectype == 0x98:  # SEGDEF
            if len(rec) < 5:
                raise ValueError("truncated SEGDEF")
            seg_count += 1
            attr = rec[0]
            length = int.from_bytes(rec[1:3], "little")
            if attr & 2:
                raise ValueError("unexpected 64 KiB OMF segment")
            ni, ci = rec[3], rec[4]
            if ni >= len(names) or ci >= len(names):
                raise ValueError("SEGDEF references missing LNAMES entry")
            segments[seg_count] = (names[ni], names[ci], length)
        elif rectype in (0x90, 0x91):  # PUBDEF / PUBDEF32
            if len(rec) < 2:
                raise ValueError("truncated PUBDEF")
            i = 1
            seg = rec[i]
            i += 1
            if seg == 0:
                if i + 2 > len(rec):
                    raise ValueError("truncated absolute PUBDEF frame")
                i += 2
            while i < len(rec):
                name, i = pascal_name(rec, i)
                width = 4 if rectype == 0x91 else 2
                if i + width + 1 > len(rec):
                    raise ValueError("truncated PUBDEF offset or type index")
                off = int.from_bytes(rec[i : i + width], "little")
                i += width + 1
                publics.append((name, seg, off))
        elif rectype in (0xA0, 0xA1):  # LEDATA / LEDATA32
            width = 4 if rectype == 0xA1 else 2
            if len(rec) < 1 + width:
                raise ValueError("truncated LEDATA")
            seg = rec[0]
            off = int.from_bytes(rec[1 : 1 + width], "little")
            ledatas.setdefault(seg, []).append((off, rec[1 + width :]))
        pos = end

    matches = [(seg, off) for name, seg, off in publics if name.lower() == wanted.lower()]
    if len(matches) != 1:
        raise ValueError(f"expected one PUBDEF {wanted}, found {len(matches)}")
    seg, start = matches[0]
    if seg not in segments:
        raise ValueError("public symbol references missing SEGDEF")
    segment_name, class_name, seg_length = segments[seg]
    if class_name.upper() != "CODE":
        raise ValueError(f"symbol is in non-code class {class_name!r}")
    if seg_length != expected_length:
        raise ValueError(f"expected {expected_length}-byte code segment, got {seg_length}")
    chunks = sorted(ledatas.get(seg, []))
    image = bytearray()
    base = None
    for off, chunk in chunks:
        if base is None:
            base = off
        if off != base + len(image):
            raise ValueError("noncontiguous LEDATA for public code segment")
        image.extend(chunk)
    if base is None or start < base or start + expected_length > base + len(image):
        raise ValueError("public function bytes not fully present in LEDATA")
    if len(image) != seg_length:
        raise ValueError("LEDATA byte count does not match code segment length")
    return segment_name, start, bytes(image[start - base : start - base + expected_length])


def build() -> dict:
    source_path = ROOT / SOURCE
    source_bytes = source_path.read_bytes()
    if not PLAYER.is_file() or not ASSEMBLER.is_file():
        raise FileNotFoundError("pinned nmlgcdos MS-DOS Player or MASM 5.10 executable is missing")
    player_sha = sha(PLAYER.read_bytes())
    assembler_sha = sha(ASSEMBLER.read_bytes())
    if player_sha != PLAYER_SHA256 or assembler_sha != ASSEMBLER_SHA256:
        raise ValueError("pinned nmlgcdos MS-DOS Player or MASM executable hash changed")

    wd = ROOT / "work/compiler"
    wd.mkdir(parents=True, exist_ok=True)
    asm = wd / SOURCE_SHORT
    obj = wd / OBJECT_SHORT
    if obj.exists():
        obj.unlink()
    shutil.copyfile(source_path, asm)
    command = [str(PLAYER), str(ASSEMBLER), f"{SOURCE_SHORT},{OBJECT_SHORT},NUL,NUL;"]
    proc = subprocess.run(command, cwd=wd, capture_output=True, text=True, timeout=60)
    transcript = (proc.stdout + proc.stderr).strip()
    if proc.returncode != 0 or not obj.is_file() or "0 Severe  Errors" not in transcript:
        raise RuntimeError(f"MASM build failed (exit {proc.returncode}): {transcript}")

    segment, offset, code = omf_public_code(obj, SYMBOL, LENGTH)
    if sha(code) != MATCH_SHA256 or code[-1] != 0xC3:
        raise ValueError("function bytes or near-return opcode differ from census signature")
    manifest = json.loads((ROOT / "analysis/manifest.json").read_text(encoding="utf-8"))
    manifest_variants = {variant["id"]: variant for variant in manifest["variants"]}
    targets = []
    for ident, (image_offset, relpath) in EXPECTED.items():
        image = (ROOT / relpath).read_bytes()
        pinned = manifest_variants.get(ident)
        if pinned is None or pinned.get("image_sha256") != sha(image):
            raise ValueError(f"oracle image {ident} does not match its analysis/manifest.json pin")
        match = image[image_offset : image_offset + LENGTH]
        targets.append({
            "id": ident,
            "image_path": relpath,
            "image_sha256": sha(image),
            "offset": image_offset,
            "length": LENGTH,
            "match_sha256": sha(match),
            "exact": match == code,
        })
    if not all(target["exact"] for target in targets):
        raise ValueError("fresh MASM function bytes do not match all expected oracle ranges")

    return {
        "schema": "gp-recon-compiler-proof-v1",
        "source_path": SOURCE.as_posix(),
        "source_sha256": sha(source_bytes),
        "assembler": {
            "name": "Microsoft Macro Assembler 5.10",
            "path": str(ASSEMBLER),
            "sha256": assembler_sha,
            "player_path": str(PLAYER),
            "player_sha256": player_sha,
            "command": command,
            "banner": "Microsoft (R) Macro Assembler Version 5.10",
            "transcript_sha256": sha(transcript.encode()),
        },
        "object": {
            "path": "work/compiler/DEC4.OBJ",
            "sha256": sha(obj.read_bytes()),
            "format": "OMF",
            "segment": segment,
            "symbol": SYMBOL,
            "offset": offset,
            "length": len(code),
            "function_sha256": sha(code),
            "function_bytes_hex": code.hex(),
        },
        "targets": targets,
    }


def write_work_output(relative: str, receipt: dict) -> Path:
    out = (ROOT / relative).resolve()
    out.relative_to((ROOT / "work/compiler").resolve())
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return out


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", default="work/compiler/decimal-proof-receipt.json")
    parser.add_argument("--check", action="store_true", help="compare fresh evidence with the recorded receipt")
    parser.add_argument("--record", action="store_true", help="explicitly record first tracked proof and builder hash")
    args = parser.parse_args()
    try:
        if args.check and args.record:
            raise ValueError("--check and --record cannot be combined")
        builder_sha = sha(Path(__file__).read_bytes())
        if args.check:
            pin_path = ROOT / BUILDER_PIN
            if not pin_path.is_file() or pin_path.read_text(encoding="ascii").strip() != builder_sha:
                raise ValueError("build_decimal.py SHA-256 differs from analysis/compiler/decimal_build.sha256")
        receipt = build()
        if args.check:
            expected = json.loads((ROOT / RECEIPT).read_text(encoding="utf-8"))
            if receipt != expected:
                raise ValueError("fresh proof metadata differs from analysis/compiler/decimal_proof.json")
        output = write_work_output(args.output, receipt)
        if args.record:
            (ROOT / RECEIPT).write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n", encoding="utf-8")
            (ROOT / BUILDER_PIN).write_text(builder_sha + "\n", encoding="ascii")
        print(f"verified fresh {SYMBOL}: {receipt['object']['function_sha256']} ({LENGTH} bytes)")
        print(f"receipt: {output.relative_to(ROOT)}")
        if args.record:
            print(f"recorded: {RECEIPT.as_posix()} and {BUILDER_PIN.as_posix()}")
        return 0
    except Exception as exc:
        print(f"build_decimal: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
