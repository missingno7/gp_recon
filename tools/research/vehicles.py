"""Verify external vehicle-layout leads against supplied data, without copying it.

The optional CyclesMod checkout is evidence input, never an oracle. Field meaning
comes from that reference and remains a hypothesis until code usage is traced.
"""
from __future__ import annotations

import argparse
import base64
import hashlib
import json
import re
import subprocess
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
REFERENCE_COMMIT = "e544c88e5247efb1d5f61cf19bfa038e63b192fb"
MODEL = "src/main/java/io/github/albertus82/cyclesmod/common/model"
DATA = "src/main/java/io/github/albertus82/cyclesmod/common/data"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def occurrences(image, needle):
    found, pos = [], 0
    while (pos := image.find(needle, pos)) >= 0:
        found.append(pos)
        pos += 1
    return found


def generate(reference: Path):
    commit = subprocess.check_output(["git", "-C", str(reference), "rev-parse", "HEAD"], text=True).strip()
    if commit != REFERENCE_COMMIT:
        raise ValueError("CyclesMod reference revision is not pinned revision")
    sources = [f"{DATA}/DefaultCars.java", f"{DATA}/DefaultBikes.java",
               *[f"{MODEL}/{name}.java" for name in ("Vehicle", "VehiclesInf", "Settings", "Gearbox", "Torque")]]
    hashes = {p: sha((reference / p).read_bytes()) for p in sources}
    records = []
    for kind in ("Cars", "Bikes"):
        text = (reference / DATA / f"Default{kind}.java").read_text()
        encoded = re.search(r'DEFLATED_BASE64 = "([^"]+)"', text).group(1)
        payload = zlib.decompress(base64.b64decode(encoded))
        if len(payload) != 444:
            raise ValueError("unexpected reference vehicle array size")
        entry = dict(id=f"vehicle_array_{kind.lower()}", total_size=444, record_count=3,
                     record_size=148, reference_array_sha256=sha(payload), observations=[])
        if kind == "Cars":
            for target in ("circuit_ega", "circuit_cga"):
                image = (ROOT / f"work/oracles/{target}/image.bin").read_bytes()
                locations = occurrences(image, payload)
                entry["observations"].append(dict(target=target, image_offsets=locations,
                                                   array_bytes_equal_reference=bool(locations)))
        else:
            binary = (ROOT / "assets/Cycles/BIKES.INF").read_bytes()
            entry["observations"].append(dict(path="assets/Cycles/BIKES.INF", sha256=sha(binary),
                                              array_bytes_equal_reference=binary == payload,
                                              executable_loading_usage="untraced"))
        records.append(entry)
    return dict(schema_version=1,
                reference=dict(url="https://github.com/albertus82/cyclesmod", commit=commit, source_sha256=hashes),
                layout_status="reference layout; byte identity independently verified; runtime field semantics unverified",
                fields=[dict(offset=0, size=22, proposed_type="11 little-endian uint16 settings", status="reference_hypothesis"),
                        dict(offset=22, size=20, proposed_type="10 little-endian uint16 gear ratios", status="reference_hypothesis"),
                        dict(offset=42, size=106, proposed_type="106 uint8 torque values", status="reference_hypothesis")],
                arrays=records)


def verify(lock):
    for record in lock["arrays"]:
        for obs in record["observations"]:
            if "image_offsets" in obs:
                image = (ROOT / f'work/oracles/{obs["target"]}/image.bin').read_bytes()
                for offset in obs["image_offsets"]:
                    if sha(image[offset:offset + record["total_size"]]) != record["reference_array_sha256"]:
                        raise ValueError("vehicle array hash mismatch")
            elif "path" in obs:
                data = (ROOT / obs["path"]).read_bytes()
                if sha(data) != obs["sha256"]:
                    raise ValueError("vehicle file hash mismatch")
                if obs["array_bytes_equal_reference"] and sha(data) != record["reference_array_sha256"]:
                    raise ValueError("reference data hash mismatch")


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--reference", type=Path, default=ROOT / "work/references/cyclesmod")
    p.add_argument("--lock", type=Path, default=ROOT / "analysis/structures.json")
    p.add_argument("--check", action="store_true")
    args = p.parse_args()
    if args.check:
        result = json.loads(args.lock.read_text())
    else:
        result = generate(args.reference)
        args.lock.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    verify(result)
    print(json.dumps(result["arrays"], indent=2))


if __name__ == "__main__":
    main()
