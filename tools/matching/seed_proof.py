"""Seed a pinned fresh-build proof as per-target atlas evidence."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

from tools.matching import atlas


def _same(row: object, expected: tuple[object, ...], fields: tuple[str, ...], label: str) -> None:
    if row is None or tuple(row[field] for field in fields) != expected:  # type: ignore[index]
        raise ValueError(f"existing atlas row conflicts with proof seed: {label}")


def record_profile(
    *,
    proof_path: Path,
    function_id: str,
    candidate_id: str,
    group_id: str,
    classification: str,
    group_relation: str,
    label: str,
    boundary_status: str,
    boundary_note: str,
    confidence: float = 1.0,
    region_kind: str = "function",
    db_path: Path = atlas.DB_PATH,
    root: Path = atlas.ROOT,
) -> dict:
    proof_path = proof_path if proof_path.is_absolute() else root / proof_path
    proof = json.loads(proof_path.read_text(encoding="utf-8"))
    source_path = str(proof["source_path"])
    source_hash = atlas.sha256_file(root / source_path)
    if source_hash != proof["source_sha256"]:
        raise ValueError("maintained source differs from its tracked compiler proof")
    obj = proof["object"]
    function_bytes = bytes.fromhex(obj["function_bytes_hex"])
    function_hash = hashlib.sha256(function_bytes).hexdigest()
    if function_hash != obj["function_sha256"] or len(function_bytes) != obj["length"]:
        raise ValueError("tracked compiler proof contains invalid function bytes")
    target_rows = proof["targets"]
    target_ids = {row["id"] for row in target_rows}
    if len(target_ids) != len(target_rows) or not target_ids:
        raise ValueError("compiler proof has missing or duplicate target entries")

    group_evidence = (
        f"Fresh source proof yields identical exact bytes across the proof's {len(target_ids)} targets; "
        f"source classification is {classification}, while boundary status is {boundary_status}: {boundary_note}"
    )
    db = atlas.connect(db_path)
    try:
        atlas.initialize(db_path)
        with atlas.transaction(db):
            existing_function = db.execute(
                "SELECT * FROM function_item WHERE function_id=?", (function_id,)
            ).fetchone()
            function_values = (obj["symbol"].lstrip("_"), classification, confidence,
                               "strict_source_exact", boundary_note)
            if existing_function is None:
                db.execute(
                    "INSERT INTO function_item(function_id,name,classification,confidence,status,notes) "
                    "VALUES(?,?,?,?,?,?)", (function_id, *function_values),
                )
            else:
                _same(existing_function, function_values,
                      ("name", "classification", "confidence", "status", "notes"), function_id)

            for proof_target in target_rows:
                tid = proof_target["id"]
                target = db.execute(
                    "SELECT t.oracle_variant_id,bv.image_path,bv.image_sha256,bv.image_size "
                    "FROM target t JOIN binary_variant bv ON bv.variant_id=t.oracle_variant_id "
                    "WHERE t.target_id=?", (tid,),
                ).fetchone()
                if target is None:
                    raise ValueError(f"target {tid} is not imported into atlas")
                image_path = atlas._absolute(root, target["image_path"])
                image = image_path.read_bytes()
                image_hash = hashlib.sha256(image).hexdigest()
                start, length = proof_target["offset"], proof_target["length"]
                extracted = image[start : start + length]
                if (image_hash != target["image_sha256"] or image_hash != proof_target["image_sha256"]
                        or length != len(function_bytes) or extracted != function_bytes
                        or hashlib.sha256(extracted).hexdigest() != function_hash):
                    raise ValueError(f"pinned image/function range differs for {tid}")

                region_id = f"{function_id}:{tid}"
                evidence = {
                    "source_sha256": source_hash,
                    "builder_proof_sha256": atlas.sha256_file(proof_path),
                    "function_sha256": function_hash,
                    "function_symbol": obj["symbol"],
                    "boundary_status": boundary_status,
                    "boundary_note": boundary_note,
                    "source_bytes_exact": True,
                }
                region_values = (tid, start, start + length, region_kind, label,
                                 json.dumps(evidence, sort_keys=True, separators=(",", ":")))
                region = db.execute("SELECT * FROM region WHERE region_id=?", (region_id,)).fetchone()
                if region is None:
                    db.execute(
                        "INSERT INTO region(region_id,target_id,start_offset,end_offset,kind,label,evidence) "
                        "VALUES(?,?,?,?,?,?,?)", (region_id, *region_values),
                    )
                else:
                    _same(region, region_values,
                          ("target_id", "start_offset", "end_offset", "kind", "label", "evidence"), region_id)
                link = db.execute(
                    "SELECT * FROM function_target WHERE function_id=? AND target_id=?",
                    (function_id, tid),
                ).fetchone()
                link_values = (region_id, start, length)
                if link is None:
                    db.execute(
                        "INSERT INTO function_target(function_id,target_id,region_id,image_offset,byte_length) "
                        "VALUES(?,?,?,?,?)", (function_id, tid, *link_values),
                    )
                else:
                    _same(link, link_values, ("region_id", "image_offset", "byte_length"), f"{function_id}:{tid}")

            group = db.execute("SELECT * FROM equivalence_group WHERE group_id=?", (group_id,)).fetchone()
            group_values = (label, group_relation, confidence, group_evidence)
            if group is None:
                db.execute(
                    "INSERT INTO equivalence_group(group_id,label,relation,confidence,evidence) VALUES(?,?,?,?,?)",
                    (group_id, *group_values),
                )
            else:
                _same(group, group_values,
                      ("label", "relation", "confidence", "evidence"), group_id)
            for tid in sorted(target_ids):
                member = db.execute(
                    "SELECT 1 FROM equivalence_member WHERE group_id=? AND function_id=? AND target_id=?",
                    (group_id, function_id, tid),
                ).fetchone()
                if member is None:
                    db.execute(
                        "INSERT INTO equivalence_member(group_id,function_id,target_id) VALUES(?,?,?)",
                        (group_id, function_id, tid),
                    )

        artifact_dir = root / "work" / "candidates" / function_id
        artifact_dir.mkdir(parents=True, exist_ok=True)
        for tid in sorted(target_ids):
            artifact_path = artifact_dir / f"{tid}.bin"
            if artifact_path.exists() and artifact_path.read_bytes() != function_bytes:
                raise ValueError(f"existing candidate artifact differs: {artifact_path}")
            artifact_path.write_bytes(function_bytes)

        candidate = db.execute(
            "SELECT * FROM candidate WHERE candidate_id=?", (candidate_id,)
        ).fetchone()
        if candidate is None:
            atlas.record_candidate(db, candidate_id=candidate_id, function_id=function_id,
                                   source_path=source_path, worker="proof-seed",
                                   notes="Strict promotion invokes the pinned fresh-build recipe", root=root)
        else:
            _same(candidate, (function_id, source_path, source_hash),
                  ("function_id", "source_path", "source_sha256"), candidate_id)
        for tid in sorted(target_ids):
            artifact = root / "work" / "candidates" / function_id / f"{tid}.bin"
            artifact_rel = artifact.relative_to(root).as_posix()
            output = db.execute(
                "SELECT * FROM candidate_output WHERE candidate_id=? AND target_id=?",
                (candidate_id, tid),
            ).fetchone()
            if output is None:
                atlas.record_output(db, candidate_id, tid, artifact_rel, root=root)
            else:
                _same(output, (artifact_rel, function_hash),
                      ("artifact_path", "artifact_sha256"), f"{candidate_id}:{tid}")

        result = atlas.promote(db, candidate_id, root=root)
        proof_row = db.execute(
            "SELECT build_proof_json FROM promotion_receipt WHERE receipt_id=?",
            (result["receipt_id"],),
        ).fetchone()
        return {
            "schema_version": 1,
            "candidate_id": candidate_id,
            "function_id": function_id,
            "equivalence_group": group_id,
            "equivalence_relation": group_relation,
            "classification": classification,
            "boundary_status": boundary_status,
            "boundary_note": boundary_note,
            "source_path": source_path,
            "source_sha256": source_hash,
            "function_sha256": function_hash,
            "function_length": len(function_bytes),
            "accepted": result["accepted"],
            "summary": result["summary"],
            "build_proof": json.loads(proof_row["build_proof_json"]),
            "targets": result["targets"],
        }
    finally:
        db.close()
