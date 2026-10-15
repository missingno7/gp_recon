"""Record the first freshly built, byte-exact Cycles graphics helper in the atlas."""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from tools.matching import atlas


FUNCTION_ID = "cycles_ega_copy_planes"
CANDIDATE_ID = "initial:cycles_ega_copy_planes"
GROUP_ID = "eq_cycles_ega_copy_planes"
CLASSIFICATION = "VIDEO_SPECIFIC"
BOUNDARY_STATUS = "provisional"
BOUNDARY_NOTE = (
    "Public OMF symbol and 106-byte far-return extent are reproduced, but direct and relocated "
    "incoming-reference evidence is not yet established; source-boundary confidence remains provisional."
)


def _json(value: object) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def _same(row: object, expected: tuple[object, ...], fields: tuple[str, ...], label: str) -> None:
    if row is None or tuple(row[field] for field in fields) != expected:  # type: ignore[index]
        raise ValueError(f"existing atlas row conflicts with initial seed: {label}")


def record(db_path: Path = atlas.DB_PATH, root: Path = atlas.ROOT) -> dict:
    proof_path = root / "analysis" / "compiler" / "proof.json"
    proof = json.loads(proof_path.read_text(encoding="utf-8"))
    source_path = str(proof["source_path"])
    source_hash = atlas.sha256_file(root / source_path)
    if source_hash != proof["source_sha256"]:
        raise ValueError("maintained assembly source differs from the tracked compiler proof")
    obj = proof["object"]
    function_bytes = bytes.fromhex(obj["function_bytes_hex"])
    function_hash = hashlib.sha256(function_bytes).hexdigest()
    if function_hash != obj["function_sha256"] or len(function_bytes) != obj["length"]:
        raise ValueError("tracked compiler proof contains invalid function bytes")
    targets = proof["targets"]
    target_ids = {row["id"] for row in targets}
    if target_ids != {"cycles_ega", "cycles_cga", "cycles_tandy"}:
        raise ValueError("initial helper proof does not cover precisely the three Cycles video targets")

    db = atlas.connect(db_path)
    try:
        atlas.initialize(db_path)
        with atlas.transaction(db):
            prior = db.execute("SELECT * FROM function_item WHERE function_id=?", (FUNCTION_ID,)).fetchone()
            if prior is None:
                db.execute(
                    "INSERT INTO function_item(function_id,name,classification,confidence,status,notes) "
                    "VALUES(?,?,?,?,?,?)",
                    (FUNCTION_ID, "ega_copy_planes", CLASSIFICATION, 1.0,
                     "strict_source_exact_boundary_provisional", BOUNDARY_NOTE),
                )
            else:
                _same(prior, ("ega_copy_planes", CLASSIFICATION, 1.0,
                              "strict_source_exact_boundary_provisional", BOUNDARY_NOTE),
                      ("name", "classification", "confidence", "status", "notes"), FUNCTION_ID)

            for target_proof in targets:
                tid = target_proof["id"]
                target = db.execute(
                    "SELECT t.oracle_variant_id,bv.image_path,bv.image_sha256,bv.image_size "
                    "FROM target t JOIN binary_variant bv ON bv.variant_id=t.oracle_variant_id "
                    "WHERE t.target_id=?", (tid,),
                ).fetchone()
                if target is None:
                    raise ValueError(f"target {tid} is not imported into atlas")
                image_path = atlas._absolute(root, target["image_path"])
                image_hash = atlas.sha256_file(image_path)
                start, length = target_proof["offset"], target_proof["length"]
                if (image_hash != target["image_sha256"] or image_hash != target_proof["image_sha256"]
                        or length != len(function_bytes)
                        or hashlib.sha256(image_path.read_bytes()[start:start + length]).hexdigest() != function_hash):
                    raise ValueError(f"pinned image or function range differs for {tid}")

                region_id = f"{FUNCTION_ID}:{tid}"
                evidence = {
                    "source_sha256": source_hash,
                    "builder_proof_sha256": atlas.sha256_file(proof_path),
                    "function_sha256": function_hash,
                    "function_symbol": obj["symbol"],
                    "boundary_status": BOUNDARY_STATUS,
                    "boundary_note": BOUNDARY_NOTE,
                    "source_bytes_exact": True,
                }
                region_values = (tid, start, start + length, "function_candidate",
                                 "Cycles EGA plane-copy helper", _json(evidence))
                region = db.execute("SELECT * FROM region WHERE region_id=?", (region_id,)).fetchone()
                if region is None:
                    db.execute(
                        "INSERT INTO region(region_id,target_id,start_offset,end_offset,kind,label,evidence) "
                        "VALUES(?,?,?,?,?,?,?)", (region_id, *region_values),
                    )
                else:
                    _same(region, region_values,
                          ("target_id", "start_offset", "end_offset", "kind", "label", "evidence"), region_id)
                function_target = db.execute(
                    "SELECT * FROM function_target WHERE function_id=? AND target_id=?",
                    (FUNCTION_ID, tid),
                ).fetchone()
                range_values = (region_id, start, length)
                if function_target is None:
                    db.execute(
                        "INSERT INTO function_target(function_id,target_id,region_id,image_offset,byte_length) "
                        "VALUES(?,?,?,?,?)", (FUNCTION_ID, tid, *range_values),
                    )
                else:
                    _same(function_target, range_values,
                          ("region_id", "image_offset", "byte_length"), f"{FUNCTION_ID}:{tid}")

            group_evidence = (
                "Fresh MASM source proof yields identical exact bytes across all three Cycles video targets; "
                "the matched bytes are established, while incoming-reference boundary confidence remains provisional."
            )
            group = db.execute("SELECT * FROM equivalence_group WHERE group_id=?", (GROUP_ID,)).fetchone()
            group_values = ("Cycles EGA plane-copy helper", "SHARED_EXACT", 1.0, group_evidence)
            if group is None:
                db.execute(
                    "INSERT INTO equivalence_group(group_id,label,relation,confidence,evidence) VALUES(?,?,?,?,?)",
                    (GROUP_ID, *group_values),
                )
            else:
                _same(group, group_values, ("label", "relation", "confidence", "evidence"), GROUP_ID)
            for tid in sorted(target_ids):
                member = db.execute(
                    "SELECT 1 FROM equivalence_member WHERE group_id=? AND function_id=? AND target_id=?",
                    (GROUP_ID, FUNCTION_ID, tid),
                ).fetchone()
                if member is None:
                    db.execute(
                        "INSERT INTO equivalence_member(group_id,function_id,target_id) VALUES(?,?,?)",
                        (GROUP_ID, FUNCTION_ID, tid),
                    )

        artifact_dir = root / "work" / "candidates" / FUNCTION_ID
        artifact_dir.mkdir(parents=True, exist_ok=True)
        for tid in sorted(target_ids):
            artifact_path = artifact_dir / f"{tid}.bin"
            if artifact_path.exists() and artifact_path.read_bytes() != function_bytes:
                raise ValueError(f"existing candidate artifact differs: {artifact_path}")
            artifact_path.write_bytes(function_bytes)

        db_candidate = db.execute("SELECT * FROM candidate WHERE candidate_id=?", (CANDIDATE_ID,)).fetchone()
        if db_candidate is None:
            atlas.record_candidate(db, candidate_id=CANDIDATE_ID, function_id=FUNCTION_ID,
                                  source_path=source_path, worker="initial-seed",
                                  notes="Fresh MASM proof required at promotion", root=root)
        else:
            _same(db_candidate, (FUNCTION_ID, source_path, source_hash),
                  ("function_id", "source_path", "source_sha256"), CANDIDATE_ID)
        for tid in sorted(target_ids):
            path = root / "work" / "candidates" / FUNCTION_ID / f"{tid}.bin"
            output = db.execute("SELECT * FROM candidate_output WHERE candidate_id=? AND target_id=?",
                                (CANDIDATE_ID, tid)).fetchone()
            relpath = path.relative_to(root).as_posix()
            if output is None:
                atlas.record_output(db, CANDIDATE_ID, tid, relpath, root=root)
            else:
                _same(output, (relpath, function_hash), ("artifact_path", "artifact_sha256"), f"{CANDIDATE_ID}:{tid}")

        result = atlas.promote(db, CANDIDATE_ID, root=root)
        receipt = db.execute(
            "SELECT build_proof_json FROM promotion_receipt WHERE receipt_id=?", (result["receipt_id"],)
        ).fetchone()
        output = {
            "schema_version": 1,
            "candidate_id": CANDIDATE_ID,
            "function_id": FUNCTION_ID,
            "equivalence_group": GROUP_ID,
            "equivalence_relation": "SHARED_EXACT",
            "classification": CLASSIFICATION,
            "boundary_status": BOUNDARY_STATUS,
            "boundary_note": BOUNDARY_NOTE,
            "source_path": source_path,
            "source_sha256": source_hash,
            "function_sha256": function_hash,
            "function_length": len(function_bytes),
            "accepted": result["accepted"],
            "summary": result["summary"],
            "build_proof": json.loads(receipt["build_proof_json"]),
            "targets": result["targets"],
        }
        return output
    finally:
        db.close()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--record", action="store_true",
                        help="explicitly seed/promote the initial helper and write its tracked receipt")
    parser.add_argument("--replace-receipt", action="store_true",
                        help="replace an earlier tracked initial receipt after an explicit evidence update")
    parser.add_argument("--db", type=Path, default=atlas.DB_PATH)
    args = parser.parse_args()
    if not args.record:
        parser.error("--record is required; this command intentionally has no implicit write mode")
    try:
        receipt = record(args.db)
        if not receipt["accepted"]:
            print(json.dumps(receipt, indent=2, sort_keys=True))
            return 1
        destination = atlas.ROOT / "analysis" / "matching" / "initial_promotion.json"
        destination.parent.mkdir(parents=True, exist_ok=True)
        serialized = json.dumps(receipt, indent=2, sort_keys=True) + "\n"
        if destination.exists():
            existing = json.loads(destination.read_text(encoding="utf-8"))
            if existing != receipt:
                if not args.replace_receipt:
                    print(f"refusing to replace immutable receipt without --replace-receipt: {destination}", file=sys.stderr)
                    return 1
                destination.write_text(serialized, encoding="utf-8", newline="\n")
        else:
            destination.write_text(serialized, encoding="utf-8", newline="\n")
        print(f"accepted {FUNCTION_ID}; receipt: {destination.relative_to(atlas.ROOT)}")
        return 0
    except Exception as exc:
        print(f"initial promotion: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
