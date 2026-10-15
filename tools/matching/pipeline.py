"""Fresh candidate builds and strict, per-target OMF fixup comparisons."""
from __future__ import annotations

from collections import Counter
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import uuid

from tools.omf import OmfReader, MatchError

ROOT = Path(__file__).resolve().parents[2]
TARGETS = ("circuit_ega", "circuit_cga", "cycles_ega", "cycles_cga", "cycles_tandy")


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_profile(name: str, root: Path = ROOT) -> tuple[dict, dict]:
    lock = json.loads((root / "analysis/toolchain.json").read_text(encoding="utf-8"))
    profile = lock["profiles"][name]
    for item in [lock["runner"], *lock["tools"][profile["tool"]].values()]:
        path = Path(item["path"])
        if not path.is_file() or digest(path.read_bytes()) != item["sha256"]:
            raise ValueError(f"toolchain file missing or hash changed: {path}")
    if Path(lock["runner"]["path"]).as_posix().lower() != "c:/tools/nmlgcdos/msdos.exe":
        raise ValueError("only the pinned nmlgcdos MS-DOS Player is allowed")
    return profile, lock


def build(source: Path, profile_name: str, root: Path = ROOT) -> tuple[object, dict]:
    """Build in a unique ignored directory; a failed compiler is a result."""
    source = source.resolve()
    if source.suffix.lower() not in (".c", ".asm"):
        raise ValueError("candidate must be .c or .asm")
    profile, lock = load_profile(profile_name, root)
    if profile["kind"] != ("c" if source.suffix.lower() == ".c" else "asm"):
        raise ValueError("candidate suffix and profile kind disagree")
    scratch = root / "work/search" / uuid.uuid4().hex
    scratch.mkdir(parents=True)
    staged = scratch / ("UNIT.C" if profile["kind"] == "c" else "UNIT.ASM")
    shutil.copyfile(source, staged)
    obj_path = scratch / "UNIT.OBJ"
    executable = lock["tools"][profile["tool"]]["CL.EXE" if profile["kind"] == "c" else "MASM.EXE"]["path"]
    if profile["kind"] == "c":
        command = [lock["runner"]["path"], "-e", "-v5.00", executable, *profile["flags"], staged.name]
    else:
        command = [lock["runner"]["path"], executable, f"{staged.name},{obj_path.name},NUL,NUL;"]
    environment = os.environ.copy()
    if profile["kind"] == "c":
        tool_directory = str(Path(executable).parent)
        environment.update({"PATH": tool_directory, "MSDOS_PATH": tool_directory,
                            "TEMP": ".", "TMP": ".", "MSDOS_TEMP": "."})
    try:
        result = subprocess.run(command, cwd=scratch, capture_output=True, text=True, timeout=30,
                                env=environment)
        transcript = (result.stdout + result.stderr).strip()
        returncode = result.returncode
    except subprocess.TimeoutExpired as exc:
        transcript = f"compiler timed out after 30 seconds: {exc}"
        returncode = -1
    report = {"profile": profile_name, "source_sha256": digest(source.read_bytes()),
              "scratch": str(scratch), "command": command, "returncode": returncode,
              "transcript": transcript[-4000:]}
    if returncode or not obj_path.is_file() or (profile["kind"] == "asm" and "0 Severe  Errors" not in transcript):
        report["status"] = "compiler_error"
        return None, report
    raw = obj_path.read_bytes()
    report["object_sha256"] = digest(raw)
    report["object_path"] = str(obj_path)
    try:
        obj = OmfReader().read(raw, obj_path.name)
    except (ValueError, IndexError, KeyError) as exc:
        report["status"] = "unsupported_object"
        report["error"] = str(exc)
        return None, report
    report["status"] = "built"
    return obj, report


def extract(obj, public: str, length: int) -> tuple[bytes, list[dict], dict]:
    matches = [p for p in obj.publics if p["name"].lower() == public.lower()]
    if len(matches) != 1:
        raise MatchError(f"expected exactly one public {public}, found {len(matches)}")
    pub = matches[0]
    segment = pub["segment"]
    definitions = [s for s in obj.segment_defs if s["name"] == segment]
    if len(definitions) != 1 or definitions[0]["class"].upper() != "CODE":
        raise MatchError(f"public {public} must be in one CODE segment")
    start = pub["offset"]
    data = obj.segment_bytes(segment)
    if start + length > len(data) or length <= 0:
        raise MatchError("public range is not fully initialized in the object")
    fixes = []
    for fix in obj.linker_fixups:
        if fix["segment"] != segment:
            continue
        offset = fix["offset"] - start
        if 0 <= offset < length:
            if offset + fix["width"] > length:
                raise MatchError("fixup crosses the candidate range boundary")
            fixes.append({**fix, "offset": offset})
    return data[start:start + length], fixes, pub


def oracle(target: str, root: Path = ROOT) -> tuple[bytes, list[int], dict]:
    if target not in TARGETS:
        raise ValueError(f"unknown preferred target {target}")
    directory = root / "work/oracles" / target
    metadata = json.loads((directory / "metadata.json").read_text(encoding="utf-8"))
    image = (directory / "image.bin").read_bytes()
    if digest(image) != metadata["image_sha256"]:
        raise ValueError(f"oracle image hash changed for {target}")
    relocations = metadata["relocations"]
    return image, relocations, metadata


def binding_file(target: str, root: Path = ROOT) -> dict:
    if target not in TARGETS:
        raise ValueError(target)
    return json.loads((root / "analysis/bindings" / f"{target}.json").read_text(encoding="utf-8"))["symbols"]


def address(binding) -> tuple[int, int | None]:
    if isinstance(binding, dict):
        binding = binding["address"]
    if isinstance(binding, int):
        return binding, None
    if isinstance(binding, str) and ":" in binding:
        seg, off = binding.split(":", 1)
        segment, offset = int(seg, 16), int(off, 16)
        return segment * 16 + offset, segment
    return int(binding, 0), None


def verify(code: bytes, fixes: list[dict], original: bytes, start: int,
           relocations: list[int], bindings: dict, public: dict | None = None) -> dict:
    """Compare every fixed byte and prove the complete ordered relocation slice."""
    problems = []
    unbound = []
    slots = set()
    explained = []
    reports = []
    if len(code) != len(original):
        problems.append("candidate and oracle range lengths differ")
    own_segment = public["segment"] if public else None
    own_offset = public["offset"] if public else 0
    local_base = start - own_offset
    for f in fixes:
        at, width = f["offset"], f["width"]
        if at < 0 or at + width > len(code):
            problems.append("fixup lies outside candidate")
            continue
        if any(i in slots for i in range(at, at + width)):
            problems.append(f"overlapping fixups at {at:#x}")
        slots.update(range(at, at + width))
        loc = f["loc"]
        target = f["target"]
        kind = ("self-relative near/far call" if f["self_relative"] else
                "segment base" if loc == "base16" else
                "far pointer" if loc == "pointer32" else "offset in DGROUP/segment")
        row = {"offset": at, "image_offset": start + at, "width": width,
               "kind": kind, "target": target, "frame": f.get("frame"), "loc": loc}
        reports.append(row)
        if loc not in ("offset16", "base16", "pointer32", "lobyte", "hibyte"):
            problems.append(f"unsupported strict fixup location {loc}")
            continue
        if target == own_segment or target == (public or {}).get("name"):
            target_linear, target_segment = local_base, local_base // 16 if local_base % 16 == 0 else None
        elif target in bindings:
            target_linear, target_segment = address(bindings[target])
        else:
            unbound.append(target)
            continue
        frame = f.get("frame")
        if frame in (own_segment, (public or {}).get("name")):
            frame_linear = local_base
        elif frame == target or f.get("frame_kind") == "target":
            if target_segment is None:
                unbound.append(f"segment of {target}")
                continue
            frame_linear = target_segment * 16
        elif frame in bindings:
            frame_linear, _ = address(bindings[frame])
        elif frame is None and f.get("frame_kind") == "none":
            frame_linear = 0
        else:
            unbound.append(str(frame))
            continue
        addend = int.from_bytes(bytes.fromhex(f["encoded_addend"]), "little")
        addend += f.get("displacement", 0)
        if loc == "pointer32":
            if target_segment is None:
                if target_linear % 16:
                    problems.append(f"far pointer target {target} lacks segment:offset binding")
                    continue
                target_segment = target_linear // 16
            value = ((target_linear - frame_linear + addend) & 0xffff).to_bytes(2, "little") + (target_segment & 0xffff).to_bytes(2, "little")
            explained.append(start + at + 2)
        elif loc == "base16":
            if target_segment is None:
                if target_linear % 16:
                    problems.append(f"segment base {target} is not paragraph aligned")
                    continue
                target_segment = target_linear // 16
            value = ((target_segment + addend) & 0xffff).to_bytes(2, "little")
            explained.append(start + at)
        else:
            if f["self_relative"]:
                computed = target_linear + addend - (start + at + width)
            else:
                computed = target_linear - frame_linear + addend
            value = (computed & ((1 << (width * 8)) - 1)).to_bytes(width, "little")
        row["linked_hex"] = value.hex()
        if original[at:at + width] != value:
            problems.append(f"fixup {target} at {start + at:#x}: linked {value.hex()} != oracle {original[at:at + width].hex()}")
    for i in range(min(len(code), len(original))):
        if i not in slots and code[i] != original[i]:
            problems.append(f"non-fixup byte differs at {start + i:#x}")
            if len(problems) > 12:
                break
    actual = [r for r in relocations if start <= r < start + len(original)]
    if Counter(actual) != Counter(explained):
        problems.append(f"relocations differ: oracle ordered={actual}, explained={explained}")
    return {"strict": not problems and not unbound, "byte_equal_outside_fixups":
            all(code[i] == original[i] for i in range(min(len(code), len(original))) if i not in slots),
            "problems": problems, "unbound": sorted(set(unbound)), "fixups": reports,
            "oracle_relocations_ordered": actual, "explained_relocations": explained}
