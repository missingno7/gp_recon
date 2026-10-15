#!/usr/bin/env python3
"""Build deterministic MSC 5.10 function-signature profiles for signature_probe.c."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys


ROOT = Path(__file__).resolve().parents[2]
SOURCE = Path("tools/compiler/signature_probe.c")
PLAYER = Path(r"C:\tools\nmlgcdos\msdos.exe")
TOOL_DIR = Path(r"C:\tools\msc-5.10")
COMPILER = TOOL_DIR / "CL.EXE"
PASSES = ("CL.EXE", "C1.EXE", "C2.EXE", "C3.EXE")
PROFILES = (
    ("msc510_od_as", ("/c", "/Fa", "/Od", "/AS")),
    ("msc510_ox_gs_as", ("/c", "/Fa", "/Ox", "/Gs", "/AS")),
    ("msc510_ox_gs_am", ("/c", "/Fa", "/Ox", "/Gs", "/AM")),
)
SYMBOL = "_clamp8"


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def pascal(data: bytes, pos: int) -> tuple[str, int]:
    n = data[pos]
    end = pos + n + 1
    if end > len(data):
        raise ValueError("truncated OMF name")
    return data[pos + 1 : end].decode("ascii"), end


def extract_public(path: Path, wanted: str) -> tuple[str, int, bytes, int]:
    data = path.read_bytes()
    pos = 0
    lnames = [""]
    segs: dict[int, tuple[str, str, int]] = {}
    publics: list[tuple[str, int, int]] = []
    ledatas: dict[int, list[tuple[int, bytes]]] = {}
    seg_index = 0
    fixup_records = 0
    while pos < len(data):
        if pos + 3 > len(data):
            raise ValueError("truncated OMF record header")
        kind = data[pos]
        n = int.from_bytes(data[pos + 1 : pos + 3], "little")
        end = pos + 3 + n
        if n < 1 or end > len(data):
            raise ValueError("invalid OMF record length")
        rec = data[pos + 3 : end - 1]
        if sum(data[pos:end]) & 0xFF:
            raise ValueError(f"bad OMF checksum at {pos:#x}")
        if kind == 0x96:  # LNAMES
            i = 0
            while i < len(rec):
                name, i = pascal(rec, i)
                lnames.append(name)
        elif kind == 0x98:  # SEGDEF
            seg_index += 1
            attr = rec[0]
            seglen = int.from_bytes(rec[1:3], "little")
            if attr & 2:
                raise ValueError("unexpected 64 KiB code segment")
            ni, ci = rec[3], rec[4]
            if max(ni, ci) >= len(lnames):
                raise ValueError("SEGDEF references a missing LNAMES entry")
            segs[seg_index] = (lnames[ni], lnames[ci], seglen)
        elif kind in (0x90, 0x91):  # PUBDEF / PUBDEF32
            i = 2
            seg = rec[1]
            if seg == 0:
                i += 2
            while i < len(rec):
                name, i = pascal(rec, i)
                width = 4 if kind == 0x91 else 2
                off = int.from_bytes(rec[i : i + width], "little")
                i += width
                if i >= len(rec):
                    raise ValueError("truncated PUBDEF type index")
                i += 1
                publics.append((name, seg, off))
        elif kind in (0xA0, 0xA1):  # LEDATA / LEDATA32
            seg = rec[0]
            width = 4 if kind == 0xA1 else 2
            off = int.from_bytes(rec[1 : 1 + width], "little")
            ledatas.setdefault(seg, []).append((off, rec[1 + width :]))
        elif kind in (0x9C, 0x9D):  # FIXUPP / FIXUPP32
            fixup_records += 1
        pos = end

    found = [(seg, off) for name, seg, off in publics if name.lower() == wanted.lower()]
    if len(found) != 1:
        raise ValueError(f"expected one PUBDEF {wanted}, found {len(found)}")
    seg, start = found[0]
    if seg not in segs:
        raise ValueError("public function refers to missing SEGDEF")
    segname, segclass, seglen = segs[seg]
    if segclass.upper() != "CODE":
        raise ValueError(f"public function is in non-code segment class {segclass!r}")
    chunks = sorted(ledatas.get(seg, []))
    if not chunks:
        raise ValueError("no LEDATA in public function segment")
    base = chunks[0][0]
    image = bytearray()
    for off, block in chunks:
        if off != base + len(image):
            raise ValueError("noncontiguous code LEDATA")
        image.extend(block)
    later = [off for name, s, off in publics if s == seg and off > start]
    stop = min(later) if later else min(base + len(image), seglen)
    if start < base or stop <= start or stop > base + len(image):
        raise ValueError("invalid public function code bounds")
    return segname, start, bytes(image[start - base : stop - base]), fixup_records


def listing_function(path: Path, symbol: str) -> tuple[str, str, int, int]:
    lines = path.read_text(encoding="cp437", errors="replace").splitlines()
    needle = symbol.upper()
    start = next((i for i, line in enumerate(lines) if f"{needle}\tPROC " in line.upper()), None)
    if start is None:
        start = next((i for i, line in enumerate(lines) if f"{needle} PROC " in line.upper()), None)
    if start is None:
        raise ValueError(f"assembly listing lacks {symbol} PROC")
    line = lines[start].upper()
    distance = "FAR" if "PROC FAR" in line else "NEAR" if "PROC NEAR" in line else "UNKNOWN"
    end = next((i for i in range(start + 1, len(lines)) if f"{needle}\tENDP" in lines[i].upper() or f"{needle} ENDP" in lines[i].upper()), None)
    if end is None:
        raise ValueError(f"assembly listing lacks {symbol} ENDP")
    body = lines[start : end + 1]
    instructions = []
    for item in body[1:-1]:
        stripped = item.strip()
        if not stripped or stripped.startswith((";", "$") ) or stripped.endswith(":"):
            continue
        if stripped.startswith("PUBLIC") or "PROC " in stripped or "ENDP" in stripped:
            continue
        if stripped.startswith("ASSUME"):
            continue
        if ";" in stripped:
            stripped = stripped.split(";", 1)[0].rstrip()
        if stripped and not stripped.startswith("."):
            instructions.append(stripped)
    returns = sum(1 for instruction in instructions if instruction.split(None, 1)[0].lower() in ("ret", "retf", "retn"))
    return distance, "\n".join(body), len(instructions), returns


def build() -> dict:
    if not PLAYER.is_file() or not COMPILER.is_file():
        raise FileNotFoundError("pinned MS-DOS Player or MSC 5.10 compiler is missing")
    for name in PASSES:
        if not (TOOL_DIR / name).is_file():
            raise FileNotFoundError(f"missing compiler pass {name}")
    src = (ROOT / SOURCE).read_bytes()
    parent = ROOT / "work/compiler/cpilot"
    parent.mkdir(parents=True, exist_ok=True)
    tool_hashes = {name: sha((TOOL_DIR / name).read_bytes()) for name in PASSES}
    results = []
    common_transcripts = []
    for profile, flags in PROFILES:
        wd = parent / profile
        wd.mkdir(parents=True, exist_ok=True)
        for stale in ("PROBE.C", "PROBE.ASM", "PROBE.OBJ"):
            (wd / stale).unlink(missing_ok=True)
        (wd / "PROBE.C").write_bytes(src)
        command = [str(PLAYER), str(COMPILER), *flags, "PROBE.C"]
        proc = subprocess.run(command, cwd=wd, capture_output=True, text=True, timeout=60)
        transcript = (proc.stdout + proc.stderr).strip()
        common_transcripts.append(transcript)
        if proc.returncode != 0 or "Microsoft (R) C Optimizing Compiler Version 5.10" not in transcript:
            raise RuntimeError(f"{profile}: compiler failed or banner mismatched: {transcript}")
        asm, obj = wd / "PROBE.ASM", wd / "PROBE.OBJ"
        if not asm.is_file() or not obj.is_file():
            raise RuntimeError(f"{profile}: expected fresh PROBE.ASM and PROBE.OBJ")
        segment, offset, code, fixup_records = extract_public(obj, SYMBOL)
        distance, listing, insn_count, ret_count = listing_function(asm, SYMBOL)
        expected_op = 0xCB if distance == "FAR" else 0xC3 if distance == "NEAR" else None
        if expected_op is None or ret_count == 0:
            raise ValueError(f"{profile}: missing near/far PROC or RET evidence")
        ophex = f"{expected_op:02x}"
        observed_returns = code.count(expected_op)
        if observed_returns != ret_count:
            raise ValueError(f"{profile}: OMF RET opcode count {observed_returns} differs from assembly count {ret_count}")
        code_hex = code.hex()
        results.append({
            "id": profile,
            "flags": list(flags),
            "command": command,
            "omf": {
                "path": f"work/compiler/cpilot/{profile}/PROBE.OBJ",
                "sha256": sha(obj.read_bytes()),
                "segment": segment,
                "symbol": SYMBOL,
                "offset": offset,
                "code_size": len(code),
                "code_sha256": sha(code),
                "code_hex": code_hex,
                "fixup_record_count": fixup_records,
                "return_opcode": ophex,
                "return_opcode_count": observed_returns,
            },
            "assembly": {
                "path": f"work/compiler/cpilot/{profile}/PROBE.ASM",
                "sha256": sha(asm.read_bytes()),
                "procedure_distance": distance,
                "instruction_count": insn_count,
                "return_instruction_count": ret_count,
                "expected_return_opcode": ophex,
                "listing": listing,
            },
        })
    banner = "Microsoft (R) C Optimizing Compiler Version 5.10"
    return {
        "schema": "gp-recon-c-compiler-pilot-v1",
        "source_path": SOURCE.as_posix(),
        "source_sha256": sha(src),
        "compiler": {
            "name": banner,
            "path": str(COMPILER),
            "msdos_player_path": str(PLAYER),
            "msdos_player_sha256": sha(PLAYER.read_bytes()),
            "pass_sha256": tool_hashes,
            "banner": banner,
        },
        "profiles": results,
        "attribution": "unresolved: this compiler probe does not identify either game's compiler",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="fresh-build and compare with analysis/compiler/c_pilot.json")
    parser.add_argument("--record", action="store_true", help="explicitly write analysis/compiler/c_pilot.json")
    parser.add_argument("--output", default="work/compiler/c-pilot-receipt.json", help="receipt path restricted to work/compiler/")
    args = parser.parse_args()
    if args.check and args.record:
        parser.error("--check and --record cannot be combined")
    try:
        receipt = build()
        if args.check:
            expected = json.loads((ROOT / "analysis/compiler/c_pilot.json").read_text(encoding="utf-8"))
            if receipt != expected:
                raise ValueError("fresh pilot differs from analysis/compiler/c_pilot.json")
        if args.record:
            out = ROOT / "analysis/compiler/c_pilot.json"
        else:
            out = (ROOT / args.output).resolve()
            out.relative_to((ROOT / "work/compiler").resolve())
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        print(f"built {len(receipt['profiles'])} MSC 5.10 profiles for {SYMBOL}")
        print(f"receipt: {out.relative_to(ROOT)}")
        return 0
    except Exception as exc:
        print(f"run_pilot: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
