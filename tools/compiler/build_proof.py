#!/usr/bin/env python3
"""Freshly assemble and verify the shared Cycles EGA display helper."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys


ROOT = Path(__file__).resolve().parents[2]
SOURCE = Path("src/engine/graphics/ega_copy_planes.asm")
SOURCE_SHORT = "EGACOPY.ASM"
OBJECT_SHORT = "EGACOPY.OBJ"
PLAYER = Path(r"C:\tools\nmlgcdos\msdos.exe")
ASSEMBLER = Path(r"C:\tools\masm-5.10\files\MASM.EXE")
ASSEMBLER_SHA256 = "233120302473749eafe9a54a30f8bda0127140c44346e5bcc047d113828a741e"
PLAYER_SHA256 = "f7f6cb0a3e816c5edb13112d327c1bddbf7463fe7bf9a005ca1eb5317751bd02"
EXPECTED = {
    "cycles_ega": (0x123E, "work/oracles/cycles_ega/image.bin"),
    "cycles_cga": (0x113E, "work/oracles/cycles_cga/image.bin"),
    "cycles_tandy": (0x1133, "work/oracles/cycles_tandy/image.bin"),
}
SYMBOL = "_ega_copy_planes"
LENGTH = 106


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def pascal_name(data: bytes, pos: int) -> tuple[str, int]:
    n = data[pos]
    end = pos + n + 1
    if end > len(data):
        raise ValueError("truncated OMF name")
    return data[pos + 1 : end].decode("ascii"), end


def omf_public_code(path: Path, wanted: str) -> tuple[str, int, bytes]:
    """Read PUBDEF and LEDATA records and recover one public code symbol."""
    data = path.read_bytes()
    pos = 0
    seg_names: dict[int, tuple[str, str]] = {}
    names: list[str] = [""]
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
        if rectype in (0x9C, 0x9D):  # FIXUPP / FIXUPP32
            raise ValueError("unexpected OMF fixup record in relocation-free source")
        if rectype == 0x96:  # LNAMES
            i = 0
            while i < len(rec):
                name, i = pascal_name(rec, i)
                names.append(name)
        elif rectype == 0x98:  # SEGDEF
            seg_count += 1
            attr = rec[0]
            length = int.from_bytes(rec[1:3], "little")
            if attr & 2:  # BIG flag denotes a full 64 KiB segment
                raise ValueError("unexpected 64 KiB OMF segment")
            ni, ci = rec[3], rec[4]
            seg_names[seg_count] = (names[ni], names[ci])
            if length != LENGTH:
                raise ValueError(f"expected {LENGTH}-byte segment, got {length}")
        elif rectype in (0x90, 0x91):  # PUBDEF / PUBDEF32
            i = 0
            group = rec[i]
            i += 1
            seg = rec[i]
            i += 1
            if seg == 0:
                i += 2  # absolute frame number
            while i < len(rec):
                name, i = pascal_name(rec, i)
                width = 4 if rectype == 0x91 else 2
                off = int.from_bytes(rec[i : i + width], "little")
                i += width
                if i >= len(rec):
                    raise ValueError("truncated PUBDEF type index")
                i += 1  # type index
                publics.append((name, seg, off))
        elif rectype in (0xA0, 0xA1):  # LEDATA / LEDATA32
            seg = rec[0]
            width = 4 if rectype == 0xA1 else 2
            off = int.from_bytes(rec[1 : 1 + width], "little")
            ledatas.setdefault(seg, []).append((off, rec[1 + width :]))
        pos = end

    matches = [(seg, off) for name, seg, off in publics if name.lower() == wanted.lower()]
    if len(matches) != 1:
        raise ValueError(f"expected one PUBDEF {wanted}, found {len(matches)}")
    seg, start = matches[0]
    if seg not in seg_names:
        raise ValueError("public symbol references missing SEGDEF")
    segment_name, class_name = seg_names[seg]
    if class_name.upper() != "CODE":
        raise ValueError(f"symbol is in non-code class {class_name!r}")
    chunks = sorted(ledatas.get(seg, []))
    image = bytearray()
    base = None
    for off, chunk in chunks:
        if base is None:
            base = off
        if off != base + len(image):
            raise ValueError("noncontiguous LEDATA for public code segment")
        image.extend(chunk)
    if base is None or start < base or start + LENGTH > base + len(image):
        raise ValueError("public function bytes not fully present in LEDATA")
    return segment_name, start, bytes(image[start - base : start - base + LENGTH])


def build() -> dict:
    source_path = ROOT / SOURCE
    source_bytes = source_path.read_bytes()
    if not PLAYER.is_file() or not ASSEMBLER.is_file():
        raise FileNotFoundError("pinned MS-DOS Player or MASM 5.10 executable is missing")
    if sha(PLAYER.read_bytes()) != PLAYER_SHA256 or sha(ASSEMBLER.read_bytes()) != ASSEMBLER_SHA256:
        raise ValueError("pinned MS-DOS Player or MASM executable hash changed")
    wd = ROOT / "work/compiler"
    wd.mkdir(parents=True, exist_ok=True)
    asm = wd / SOURCE_SHORT
    obj = wd / OBJECT_SHORT
    if obj.exists():
        obj.unlink()
    shutil.copyfile(source_path, asm)
    cmd = [str(PLAYER), str(ASSEMBLER), f"{SOURCE_SHORT},{OBJECT_SHORT},NUL,NUL;"]
    proc = subprocess.run(cmd, cwd=wd, capture_output=True, text=True, timeout=60)
    transcript = (proc.stdout + proc.stderr).strip()
    if proc.returncode != 0 or not obj.is_file() or "0 Severe  Errors" not in transcript:
        raise RuntimeError(f"MASM build failed (exit {proc.returncode}): {transcript}")
    segment, offset, code = omf_public_code(obj, SYMBOL)
    if len(code) != LENGTH or code[-1] != 0xCB:
        raise ValueError("function length or far-return opcode did not match expected signature")
    manifest = json.loads((ROOT / "analysis/manifest.json").read_text(encoding="utf-8"))
    manifest_variants = {v["id"]: v for v in manifest["variants"]}
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
    if not all(t["exact"] for t in targets):
        raise ValueError("fresh MASM function bytes do not match all expected oracle ranges")
    return {
        "schema": "gp-recon-compiler-proof-v1",
        "source_path": SOURCE.as_posix(),
        "source_sha256": sha(source_bytes),
        "assembler": {
            "name": "Microsoft Macro Assembler 5.10",
            "path": str(ASSEMBLER),
            "sha256": sha(ASSEMBLER.read_bytes()),
            "player_path": str(PLAYER),
            "player_sha256": sha(PLAYER.read_bytes()),
            "command": [str(PLAYER), str(ASSEMBLER), f"{SOURCE_SHORT},{OBJECT_SHORT},NUL,NUL;"],
            "banner": "Microsoft (R) Macro Assembler Version 5.10",
            "transcript_sha256": sha(transcript.encode()),
        },
        "object": {
            "path": "work/compiler/EGACOPY.OBJ",
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


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", default="work/compiler/proof-receipt.json")
    parser.add_argument("--check", action="store_true", help="compare fresh stable evidence with analysis/compiler/proof.json")
    args = parser.parse_args()
    try:
        receipt = build()
        if args.check:
            expected = json.loads((ROOT / "analysis/compiler/proof.json").read_text(encoding="utf-8"))
            if receipt != expected:
                raise ValueError("fresh proof metadata differs from analysis/compiler/proof.json")
        out = (ROOT / args.output).resolve()
        out.relative_to((ROOT / "work/compiler").resolve())
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        print(f"verified fresh {SYMBOL}: {receipt['object']['function_sha256']} ({LENGTH} bytes)")
        print(f"receipt: {out.relative_to(ROOT)}")
        return 0
    except Exception as exc:  # keep CLI diagnostics concise for the validator
        print(f"build_proof: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
