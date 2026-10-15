"""Explicitly seed and record the strict shared decimal-field formatter proof."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from tools.matching import atlas
from tools.matching.seed_proof import record_profile


FUNCTION_ID = "format_u8_decimal3"
CANDIDATE_ID = "initial:format_u8_decimal3"
GROUP_ID = "eq_format_u8_decimal3"
PROOF_PATH = Path("analysis/compiler/decimal_proof.json")
RECEIPT_PATH = ROOT / "analysis/matching/decimal_promotion.json"
BOUNDARY_NOTE = (
    "The independent 36-byte Ghidra extent ends at a near RET, and direct near-call references "
    "are present in every covered image; semantics are AL-to-three-decimal-digits with NUL at BX+3."
)


def record(db_path: Path = atlas.DB_PATH, root: Path = atlas.ROOT) -> dict:
    return record_profile(
        proof_path=PROOF_PATH,
        function_id=FUNCTION_ID,
        candidate_id=CANDIDATE_ID,
        group_id=GROUP_ID,
        classification="SHARED_EXACT",
        group_relation="SHARED_EXACT",
        label="Circuit and Cycles decimal-field formatter",
        boundary_status="confirmed_direct_callers",
        boundary_note=BOUNDARY_NOTE,
        region_kind="function",
        db_path=db_path,
        root=root,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--record", action="store_true",
                        help="explicitly seed/promote this source and write its tracked receipt")
    parser.add_argument("--replace-receipt", action="store_true",
                        help="replace an earlier tracked receipt after reviewed evidence changes")
    parser.add_argument("--db", type=Path, default=atlas.DB_PATH)
    args = parser.parse_args()
    if not args.record:
        parser.error("--record is required; this command intentionally has no implicit write mode")
    try:
        receipt = record(args.db)
        if not receipt["accepted"]:
            print(json.dumps(receipt, indent=2, sort_keys=True))
            return 1
        serialized = json.dumps(receipt, indent=2, sort_keys=True) + "\n"
        if RECEIPT_PATH.exists():
            existing = json.loads(RECEIPT_PATH.read_text(encoding="utf-8"))
            if existing != receipt:
                if not args.replace_receipt:
                    print(f"refusing to replace immutable receipt without --replace-receipt: {RECEIPT_PATH}",
                          file=sys.stderr)
                    return 1
                RECEIPT_PATH.write_text(serialized, encoding="utf-8", newline="\n")
        else:
            RECEIPT_PATH.parent.mkdir(parents=True, exist_ok=True)
            RECEIPT_PATH.write_text(serialized, encoding="utf-8", newline="\n")
        print(f"accepted {FUNCTION_ID}; receipt: {RECEIPT_PATH.relative_to(ROOT)}")
        return 0
    except Exception as exc:
        print(f"decimal promotion: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
