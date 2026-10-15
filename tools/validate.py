"""Fresh baseline, independent stub, census, ledger and historical source gates.

Writes only ignored work artifacts. Run from any directory with Python 3.11+.
Historical compiler execution uses C:/tools/nmlgcdos/msdos.exe.
"""
from __future__ import annotations

import json
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))


def run(*args):
    print("+ " + " ".join(str(x) for x in args), flush=True)
    subprocess.run([sys.executable, *map(str, args)], cwd=ROOT, check=True)


def compare_json(expected: Path, generated: Path):
    left = json.loads(expected.read_text(encoding="utf-8"))
    right = json.loads(generated.read_text(encoding="utf-8"))
    if left != right:
        raise ValueError(f"regenerated evidence differs: {expected.relative_to(ROOT)} (lock not updated)")


def main():
    work = ROOT / "work/validation"
    work.mkdir(parents=True, exist_ok=True)
    run("tools/baseline.py", "--check")
    run("-m", "unittest", "discover", "-s", "tests", "-v")
    run("tools/exepack/verify_stub.py", "--output", work / "stub_verification.json")
    compare_json(ROOT / "analysis/stub_verification.json", work / "stub_verification.json")
    run("tools/research/vehicles.py", "--check")
    run("tools/research/runtime_libraries.py", "--check")
    run("tools/compiler/run_pilot.py", "--check", "--output", "work/compiler/validation-c-pilot.json")
    run("tools/census/analyze.py", "--output", work / "census")
    for name in ("census.json", "function_candidates.json"):
        compare_json(ROOT / "analysis/census" / name, work / "census" / name)
    # Rebuild a ledger from tracked evidence, then let promotion invoke the
    # pinned fresh builder. It runs once for the source shared by three targets.
    from tools.matching import atlas
    from tools.matching.promote_initial import record
    from tools.matching.promote_decimal import record as record_decimal
    with tempfile.TemporaryDirectory(prefix="atlas-check-", dir=work) as scratch:
        ledger = Path(scratch) / "atlas.sqlite"
        atlas.initialize(ledger)
        db = atlas.connect(ledger)
        try:
            atlas.import_manifest(db, ROOT / "analysis/manifest.json")
            counts = atlas.import_census(db)
            print(f"+ rebuilt SQLite census: {counts}", flush=True)
        finally:
            db.close()
        receipt = record(ledger)
        if not receipt["accepted"]:
            raise ValueError(f"fresh source promotion rejected: {receipt['summary']}")
        generated = work / "initial_promotion.json"
        generated.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n")
        compare_json(ROOT / "analysis/matching/initial_promotion.json", generated)
        decimal = record_decimal(ledger)
        if not decimal["accepted"]:
            raise ValueError(f"fresh shared formatter promotion rejected: {decimal['summary']}")
        generated_decimal = work / "decimal_promotion.json"
        generated_decimal.write_text(json.dumps(decimal, indent=2, sort_keys=True) + "\n")
        compare_json(ROOT / "analysis/matching/decimal_promotion.json", generated_decimal)
    print("PASS: verified evidence and fresh scoped source proof. Whole-game linked builds remain unreconstructed.")


if __name__ == "__main__":
    main()
