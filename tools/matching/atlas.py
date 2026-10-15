"""Minimal SQLite ledger for immutable binary evidence and mutable matching work.

Source promotion requires a fresh run of the pinned build proof and direct byte
comparisons against every applicable pinned load-image oracle. Caller claims are
never accepted as proof.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import sqlite3
import struct
import sys
import uuid
from contextlib import contextmanager
from datetime import datetime, timedelta, timezone
from pathlib import Path
from typing import Any, Iterator, Mapping


ROOT = Path(__file__).resolve().parents[2]
SCHEMA = Path(__file__).with_name("schema.sql")
DB_PATH = ROOT / "work" / "atlas-v2.sqlite"

# Legacy source-path allow-list for the two immutable initial MASM receipts.
# New build routes use tracked analysis/recipes/*.json and promote_recipe().
TRUSTED_BUILD_RECIPES: dict[str, dict[str, str]] = {
    "src/engine/graphics/ega_copy_planes.asm": {
        "source_sha256": "7b8cd63f3be4bbe4576a13a939d4764bd2aa6552acaee88d6e1125224edd9a63",
        "script": "tools/compiler/build_proof.py",
        "script_pin": "analysis/compiler/build_proof.sha256",
        "stable_proof": "analysis/compiler/proof.json",
    },
    # The short decimal-formatting leaf has direct callers in both games and
    # is promoted only after its independent MASM recipe and source SHA are pinned.
    "src/engine/format/decimal_ascii4.asm": {
        "source_sha256": "1303d188499538aba8e9a3b04147cf98e1bd402e94dc6d7651f5c5a25c0b94e8",
        "script": "tools/compiler/build_decimal.py",
        "script_pin": "analysis/compiler/decimal_build.sha256",
        "stable_proof": "analysis/compiler/decimal_proof.json",
    },
}


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def connect(path: Path | str = DB_PATH) -> sqlite3.Connection:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    db = sqlite3.connect(path, timeout=30, isolation_level=None)
    db.row_factory = sqlite3.Row
    db.execute("PRAGMA foreign_keys=ON")
    db.execute("PRAGMA busy_timeout=30000")
    db.execute("PRAGMA journal_mode=WAL")
    return db


def initialize(path: Path | str = DB_PATH) -> None:
    db = connect(path)
    try:
        db.executescript(SCHEMA.read_text(encoding="utf-8"))
    finally:
        db.close()


@contextmanager
def transaction(db: sqlite3.Connection, immediate: bool = True) -> Iterator[sqlite3.Connection]:
    db.execute("BEGIN IMMEDIATE" if immediate else "BEGIN")
    try:
        yield db
    except BaseException:
        db.rollback()
        raise
    else:
        db.commit()


def _absolute(root: Path, stored: str) -> Path:
    path = Path(stored)
    return path if path.is_absolute() else root / path


def record_candidate(
    db: sqlite3.Connection,
    *,
    candidate_id: str,
    function_id: str,
    source_path: str,
    revision: str = "",
    worker: str = "",
    notes: str = "",
    root: Path = ROOT,
) -> str:
    """Snapshot source identity into a candidate row and return its computed digest."""
    source = _absolute(root, source_path)
    digest = sha256_file(source)
    with transaction(db):
        db.execute(
            "INSERT INTO candidate(candidate_id,function_id,source_path,source_sha256,revision,worker,notes) "
            "VALUES(?,?,?,?,?,?,?)",
            (candidate_id, function_id, source_path, digest, revision, worker, notes),
        )
    return digest


def record_output(
    db: sqlite3.Connection, candidate_id: str, target_id: str, artifact_path: str,
    *, root: Path = ROOT,
) -> str:
    """Register bytes for one applicable target; the content hash is calculated here."""
    digest = sha256_file(_absolute(root, artifact_path))
    with transaction(db):
        db.execute(
            "INSERT INTO candidate_output(candidate_id,target_id,artifact_path,artifact_sha256) VALUES(?,?,?,?)",
            (candidate_id, target_id, artifact_path, digest),
        )
    return digest


def claim(db: sqlite3.Connection, scope: str, owner: str, ttl_seconds: int = 1800) -> str | None:
    """Atomically claim an unowned or expired scope. Claims use a fencing token."""
    if ttl_seconds <= 0:
        raise ValueError("ttl_seconds must be positive")
    now = datetime.now(timezone.utc)
    now_s = now.isoformat(timespec="microseconds")
    expires_s = (now + timedelta(seconds=ttl_seconds)).isoformat(timespec="microseconds")
    token = uuid.uuid4().hex
    with transaction(db):
        db.execute(
            "UPDATE worker_lease SET state='expired' WHERE scope=? AND state='active' AND expires_at<=?",
            (scope, now_s),
        )
        live = db.execute(
            "SELECT 1 FROM worker_lease WHERE scope=? AND state='active' AND expires_at>? LIMIT 1",
            (scope, now_s),
        ).fetchone()
        if live:
            return None
        db.execute(
            "INSERT INTO worker_lease(lease_id,scope,owner,token,acquired_at,expires_at,state) "
            "VALUES(?,?,?,?,?,?,'active')",
            (uuid.uuid4().hex, scope, owner, token, now_s, expires_s),
        )
    return token


def renew_lease(db: sqlite3.Connection, token: str, ttl_seconds: int = 1800) -> bool:
    now = datetime.now(timezone.utc)
    expires = (now + timedelta(seconds=ttl_seconds)).isoformat(timespec="microseconds")
    with transaction(db):
        cursor = db.execute(
            "UPDATE worker_lease SET expires_at=? WHERE token=? AND state='active' AND expires_at>?",
            (expires, token, now.isoformat(timespec="microseconds")),
        )
        return cursor.rowcount == 1


def release_lease(db: sqlite3.Connection, token: str) -> bool:
    now = datetime.now(timezone.utc).isoformat(timespec="microseconds")
    with transaction(db):
        cursor = db.execute(
            "UPDATE worker_lease SET state='released' WHERE token=? AND state='active' AND expires_at>?",
            (token, now),
        )
        return cursor.rowcount == 1


def _json(value: Mapping[str, Any] | None) -> str:
    return json.dumps(value or {}, sort_keys=True, separators=(",", ":"))


def _relocation_digest(entries: list[int]) -> tuple[str, str, str]:
    """Return distinct digests for stream order, duplicate-preserving multiset, and set."""
    def digest(values: list[int]) -> str:
        payload = json.dumps(values, separators=(",", ":")).encode("ascii")
        return hashlib.sha256(payload).hexdigest()
    return digest(entries), digest(sorted(entries)), digest(sorted(set(entries)))


def _packed_u32_digest(entries: list[int]) -> str:
    if any(value > 0xFFFFFFFF for value in entries):
        raise ValueError("relocation offset exceeds unsigned 32-bit range")
    payload = struct.pack(f"<{len(entries)}I", *entries)
    return hashlib.sha256(payload).hexdigest()


def _run_fresh_build_proof(
    source_path: str, source_sha256: str, *, root: Path
) -> tuple[dict[str, Any] | None, str | None]:
    """Run the reviewed MASM recipe registered for this exact source path/hash.

    A registered binary blob is not a source promotion. Only the builder can
    produce a promotion proof, and it is invoked here rather than accepting a
    caller-supplied receipt. The caller still rechecks all returned hashes and
    compares extracted function bytes against each oracle range below.
    """
    source = Path(source_path)
    try:
        if source.is_absolute():
            source_rel = source.resolve().relative_to(root.resolve()).as_posix()
        else:
            source_rel = source.as_posix()
    except ValueError:
        return None, "candidate source path is outside the trusted workspace"
    recipe = TRUSTED_BUILD_RECIPES.get(source_rel)
    if recipe is None or not recipe["source_sha256"]:
        return None, f"no reviewed fresh-build recipe is pinned for {source_rel}"
    if source_sha256 != recipe["source_sha256"]:
        return None, f"candidate source hash differs from the reviewed recipe for {source_rel}"
    script = root / recipe["script"]
    if not script.is_file():
        return None, "trusted fresh-build proof tool is unavailable"
    pin_path = root / recipe["script_pin"]
    try:
        pinned_script_sha = pin_path.read_text(encoding="ascii").strip().split()[0].lower()
    except (OSError, IndexError, UnicodeError):
        return None, "trusted fresh-build proof tool has no tracked SHA-256 pin"
    if len(pinned_script_sha) != 64 or sha256_file(script) != pinned_script_sha:
        return None, "fresh-build proof tool differs from its tracked SHA-256 pin"
    proof_dir = root / "work" / "compiler" / "atlas-proofs"
    proof_dir.mkdir(parents=True, exist_ok=True)
    proof_path = proof_dir / f"{uuid.uuid4().hex}.json"
    command = [sys.executable, str(script), "--check", "--output", str(proof_path)]
    # The legacy tracked receipts include MASM's free-symbol-space line in a
    # transcript hash. Pin the DOS process environment size so that line is
    # reproducible despite the desktop host's changing environment variables.
    # This is an input to a fresh build, not a rewritten proof or image byte.
    dos_environment = {"SystemRoot": os.environ.get("SystemRoot", r"C:\Windows"),
                       "PATH": "C:/Windows/System32", "TEMP": ".", "TMP": ".",
                       "GP_DOS_ENV_PAD": "x" * 6288}
    try:
        result = subprocess.run(command, cwd=root, capture_output=True, text=True,
                                timeout=120, check=False, env=dos_environment)
        if result.returncode != 0:
            detail = (result.stderr or result.stdout).strip()[-1200:]
            return None, f"fresh source build failed ({result.returncode}): {detail}"
        if not proof_path.is_file():
            return None, "fresh source builder did not write its proof receipt"
        proof = json.loads(proof_path.read_text(encoding="utf-8"))
        if not isinstance(proof, dict):
            return None, "fresh source builder returned a non-object proof"
        if proof.get("source_sha256") != source_sha256 or proof.get("source_path") != source_rel:
            return proof, "fresh build source hash does not match registered candidate"
        # The object must be a newly produced, extant file with the exact bytes
        # named by the proof. This also detects stale or edited build outputs.
        obj = proof.get("object", {})
        object_name = obj.get("path") if isinstance(obj, dict) else None
        object_hash = obj.get("sha256") if isinstance(obj, dict) else None
        if not isinstance(object_name, str) or not isinstance(object_hash, str):
            return proof, "fresh build proof omits its object path or digest"
        object_path = _absolute(root, object_name)
        compiler_root = (root / "work" / "compiler").resolve()
        if not object_path.resolve().is_relative_to(compiler_root):
            return proof, "fresh build object path is outside work/compiler"
        if not object_path.is_file() or sha256_file(object_path) != object_hash:
            return proof, "fresh build object is missing or its digest changed"
        return proof, None
    except (OSError, ValueError, subprocess.TimeoutExpired, json.JSONDecodeError) as exc:
        return None, f"fresh source build proof unavailable: {exc}"
    finally:
        # The immutable proof is stored in SQLite; retain its object, remove the
        # one-off transport file so work/compiler does not become a receipt dump.
        proof_path.unlink(missing_ok=True)


def promote(
    db: sqlite3.Connection,
    candidate_id: str,
    *,
    root: Path = ROOT,
    required_gates: tuple[str, ...] = (),
    gates_by_target: Mapping[str, Mapping[str, bool]] | None = None,
) -> dict[str, Any]:
    """Freshly rebuild the registered source and byte-compare all scoped targets.

    The pinned builder proof supplies extracted function bytes, which are checked
    against the registered outputs and immutable oracle slices. Caller claims do
    not control the accepted result.
    """
    gates_by_target = gates_by_target or {}
    receipt_id = uuid.uuid4().hex
    reports: list[dict[str, Any]] = []
    problems: list[str] = []
    with transaction(db):
        candidate = db.execute("SELECT * FROM candidate WHERE candidate_id=?", (candidate_id,)).fetchone()
        if candidate is None:
            raise KeyError(f"unknown candidate {candidate_id}")
        source_path = _absolute(root, candidate["source_path"])
        if not source_path.is_file() or sha256_file(source_path) != candidate["source_sha256"]:
            problems.append("candidate source changed after registration")

        # A candidate is promotable only if the pinned reconstruction recipe is
        # freshly invoked for these exact source bytes. Registered blobs alone
        # can prove artifact equality, not that the source builds that artifact.
        proof, proof_error = _run_fresh_build_proof(
            candidate["source_path"], candidate["source_sha256"], root=root
        )
        if proof_error:
            problems.append(proof_error)
        function_bytes: bytes | None = None
        builder_matches: dict[str, Mapping[str, Any]] = {}
        if proof is not None:
            try:
                obj = proof.get("object", {})
                raw_hex = obj.get("function_bytes_hex") if isinstance(obj, dict) else None
                if not isinstance(raw_hex, str):
                    raise ValueError("fresh build proof omits extracted function bytes")
                function_bytes = bytes.fromhex(raw_hex)
                if not function_bytes or hashlib.sha256(function_bytes).hexdigest() != obj.get("function_sha256"):
                    raise ValueError("fresh build function bytes fail their digest")
                function_row = db.execute(
                    "SELECT name FROM function_item WHERE function_id=?", (candidate["function_id"],)
                ).fetchone()
                symbol = str(obj.get("symbol", "")).lstrip("_")
                if function_row is None or symbol.lower() != function_row["name"].lstrip("_").lower():
                    raise ValueError("fresh build function symbol does not match candidate function")
                matches = proof.get("targets")
                if not isinstance(matches, list):
                    raise ValueError("fresh build proof omits per-target matches")
                builder_matches = {str(row.get("id")): row
                                   for row in matches if isinstance(row, dict)}
            except (TypeError, ValueError) as exc:
                function_bytes = None
                problems.append(str(exc))

        expected = db.execute(
            "SELECT ft.function_id,ft.target_id,ft.image_offset,ft.byte_length,t.oracle_variant_id,"
            "bv.packed_path,bv.packed_sha256,bv.image_path,bv.image_sha256,"
            "bv.relocation_count,bv.relocation_unique_count,"
            "bv.relocation_order_sha256,bv.relocation_multiset_sha256,bv.relocation_set_sha256 "
            "FROM function_target ft JOIN target t ON t.target_id=ft.target_id "
            "JOIN binary_variant bv ON bv.variant_id=t.oracle_variant_id "
            "WHERE ft.function_id=? ORDER BY ft.target_id",
            (candidate["function_id"],),
        ).fetchall()
        outputs = {r["target_id"]: r for r in db.execute(
            "SELECT * FROM candidate_output WHERE candidate_id=?", (candidate_id,)
        ).fetchall()}
        if not expected:
            problems.append("candidate function has no target coverage rows")

        for item in expected:
            tid = item["target_id"]
            output = outputs.get(tid)
            if output is None:
                problems.append(f"missing output for {tid}")
                continue
            oracle_path = _absolute(root, item["image_path"])
            artifact_path = _absolute(root, output["artifact_path"])
            gate_data = dict(gates_by_target.get(tid, {}))
            try:
                if (item["packed_path"] is None) != (item["packed_sha256"] is None):
                    raise ValueError(f"pinned packed source identity is incomplete for {tid}")
                if item["packed_path"] is not None:
                    packed_path = _absolute(root, item["packed_path"])
                    if (not packed_path.is_file()
                            or sha256_file(packed_path) != item["packed_sha256"]):
                        raise ValueError(f"pinned packed source hash changed for {tid}")
                oracle = oracle_path.read_bytes()
                oracle_hash = hashlib.sha256(oracle).hexdigest()
                if oracle_hash != item["image_sha256"]:
                    raise ValueError(f"pinned oracle image hash changed for {tid}")
                start = item["image_offset"]
                end = start + item["byte_length"]
                if end > len(oracle):
                    raise ValueError(f"function range exceeds oracle image for {tid}")
                oracle_bytes = oracle[start:end]
                candidate_bytes = artifact_path.read_bytes()
                output_hash = hashlib.sha256(candidate_bytes).hexdigest()
                if output_hash != output["artifact_sha256"]:
                    raise ValueError(f"candidate output changed after registration for {tid}")
                relocation_count = db.execute(
                    "SELECT count(*) FROM binary_relocation WHERE variant_id=? "
                    "AND linear_offset>=? AND linear_offset<?",
                    (item["oracle_variant_id"], start, end),
                ).fetchone()[0]
                relocation_free = relocation_count == 0
                gate_data.update({
                    "oracle_range_relocation_free": relocation_free,
                    "oracle_range_relocation_intersections": relocation_count,
                    "fresh_object_format_omf": bool(
                        isinstance(proof.get("object"), dict)
                        and proof["object"].get("format") == "OMF"
                    ) if proof is not None else False,
                    # Both allow-listed OMF parsers reject FIXUPP records before
                    # returning success; this records that fresh parser gate.
                    "fresh_object_fixup_free": proof is not None,
                })
                if not relocation_free:
                    problems.append(f"oracle range has {relocation_count} relocation entries for {tid}")
                proof_target = builder_matches.get(tid)
                target_build_exact = bool(
                    function_bytes is not None
                    and proof_target is not None
                    and proof_target.get("image_sha256") == item["image_sha256"]
                    and proof_target.get("offset") == start
                    and proof_target.get("length") == item["byte_length"]
                    and proof_target.get("match_sha256") == hashlib.sha256(oracle_bytes).hexdigest()
                    and proof_target.get("exact") is True
                    and function_bytes == oracle_bytes
                )
                exact = candidate_bytes == oracle_bytes and function_bytes == candidate_bytes and target_build_exact
                prior = db.execute(
                    "SELECT 1 FROM target_verification tv JOIN promotion_receipt pr USING(receipt_id) "
                    "WHERE tv.function_id=? AND tv.target_id=? AND tv.exact=1 AND pr.accepted=1 LIMIT 1",
                    (candidate["function_id"], tid),
                ).fetchone()
                regressed = bool(prior and not exact)
                if not exact:
                    problems.append(f"strict byte mismatch for {tid}")
                if regressed:
                    problems.append(f"regression for previously exact {tid}")
                for gate in required_gates:
                    # A Boolean supplied by a worker is descriptive only. Until
                    # a named check is emitted by the trusted builder, it cannot
                    # satisfy a promotion requirement.
                    problems.append(f"required gate {gate} has no trusted fresh-build evidence for {tid}")
                reports.append({
                    "function_id": candidate["function_id"], "target_id": tid,
                    "oracle_sha256": hashlib.sha256(oracle_bytes).hexdigest(),
                    "candidate_sha256": output_hash, "byte_length": len(oracle_bytes),
                    "exact": exact, "regressed": regressed, "gates": gate_data,
                    "oracle_relocation_entries": item["relocation_count"],
                    "oracle_relocation_unique": item["relocation_unique_count"],
                    "oracle_range_relocation_intersections": relocation_count,
                    "oracle_relocation_order_sha256": item["relocation_order_sha256"],
                    "oracle_relocation_multiset_sha256": item["relocation_multiset_sha256"],
                    "oracle_relocation_set_sha256": item["relocation_set_sha256"],
                })
            except (OSError, ValueError) as exc:
                problems.append(str(exc))

        accepted = not problems and proof is not None and function_bytes is not None and len(reports) == len(expected)
        summary = "; ".join(problems) if problems else "all scoped target bytes exactly match pinned oracles"
        db.execute(
            "INSERT INTO promotion_receipt(receipt_id,candidate_id,accepted,summary,build_proof_json) "
            "VALUES(?,?,?,?,?)",
            (receipt_id, candidate_id, int(accepted), summary, _json(proof)),
        )
        for report in reports:
            db.execute(
                "INSERT INTO target_verification(receipt_id,function_id,target_id,oracle_sha256,"
                "candidate_sha256,byte_length,exact,regressed,gates_json,oracle_relocation_entries,"
                "oracle_relocation_unique,oracle_relocation_order_sha256,"
                "oracle_relocation_multiset_sha256,oracle_relocation_set_sha256) "
                "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                (receipt_id, report["function_id"], report["target_id"], report["oracle_sha256"],
                 report["candidate_sha256"], report["byte_length"], int(report["exact"]),
                 int(report["regressed"]), _json(report["gates"]),
                 report["oracle_relocation_entries"], report["oracle_relocation_unique"],
                 report["oracle_relocation_order_sha256"],
                 report["oracle_relocation_multiset_sha256"], report["oracle_relocation_set_sha256"]),
            )
    return {"receipt_id": receipt_id, "accepted": accepted, "summary": summary, "targets": reports}


def load_recipe(path: Path | str, *, root: Path = ROOT) -> dict[str, Any]:
    """Load a reviewed recipe, with its source and target scope pinned."""
    path = Path(path)
    path = path if path.is_absolute() else root / path
    if not path.resolve().is_relative_to((root / "analysis/recipes").resolve()) or path.suffix != ".json":
        raise ValueError("recipe must be a JSON file under analysis/recipes")
    recipe = json.loads(path.read_text(encoding="utf-8"))
    if recipe.get("schema") != 1 or not recipe.get("id") or not recipe.get("source_sha256"):
        raise ValueError("recipe has no schema, ID or source SHA-256")
    source = (root / recipe["source"]).resolve()
    if not source.is_relative_to(root.resolve()) or not source.is_file():
        raise ValueError("recipe source is outside the workspace or missing")
    if sha256_file(source) != recipe["source_sha256"]:
        raise ValueError("recipe source SHA-256 differs")
    if recipe.get("builder") != "legacy" and (not recipe.get("profile") or not recipe.get("public")
                                                  or not recipe.get("targets") or "expected_fixups" not in recipe):
        raise ValueError("C/MASM recipe lacks profile, public, target ranges or expected fixups")
    if recipe.get("builder") == "legacy":
        proof_name = {"initial": "proof.json", "decimal": "decimal_proof.json"}.get(path.stem)
        if proof_name is None:
            raise ValueError("unknown legacy recipe builder")
        proof = json.loads((root / "analysis/compiler" / proof_name).read_text(encoding="utf-8"))
        expected_targets = {t["id"]: {"start": t["offset"], "end": t["offset"] + t["length"]}
                            for t in proof["targets"]}
        if (recipe["source"] != proof["source_path"] or recipe["source_sha256"] != proof["source_sha256"]
                or recipe.get("public") != proof["object"]["symbol"] or recipe.get("profile") != "masm510"
                or recipe.get("targets") != expected_targets or recipe.get("expected_fixups") != []):
            raise ValueError("legacy recipe disagrees with tracked source proof")
    from tools.matching.pipeline import TARGETS
    for tid, extent in recipe.get("targets", {}).items():
        if tid not in TARGETS or not isinstance(extent, dict) or "start" not in extent or "end" not in extent:
            raise ValueError(f"invalid recipe target {tid}")
        start = int(extent["start"], 0) if isinstance(extent["start"], str) else extent["start"]
        end = int(extent["end"], 0) if isinstance(extent["end"], str) else extent["end"]
        if not isinstance(start, int) or not isinstance(end, int) or not 0 <= start < end:
            raise ValueError(f"invalid recipe extent for {tid}")
    return recipe


def promote_recipe(db: sqlite3.Connection, recipe_path: Path | str, *, root: Path = ROOT) -> dict[str, Any]:
    """Freshly compile a tracked recipe and record one strict result per target.

    Legacy MASM receipts retain their existing builders and byte-for-byte
    receipt format. General recipes use the full OMF/fixup path here.
    """
    from tools.matching import pipeline
    recipe = load_recipe(recipe_path, root=root)
    if recipe.get("builder") == "legacy":
        raise ValueError("legacy recipes are replayed by their existing receipt builders")
    source = root / recipe["source"]
    obj, build = pipeline.build(source, recipe["profile"], root)
    if obj is None:
        raise ValueError(f"fresh compiler failed: {build}")
    if build.get("source_sha256") != recipe["source_sha256"]:
        raise ValueError("source changed during fresh build")
    projection = lambda f: {k: f[k] for k in ("offset", "loc", "width", "self_relative", "target", "frame")}
    target_rows = []
    for tid, extent in recipe["targets"].items():
        start = int(extent["start"], 0) if isinstance(extent["start"], str) else extent["start"]
        end = int(extent["end"], 0) if isinstance(extent["end"], str) else extent["end"]
        pinned = db.execute("SELECT bv.* FROM target t JOIN binary_variant bv ON bv.variant_id=t.oracle_variant_id "
                            "WHERE t.target_id=?", (tid,)).fetchone()
        if pinned is None:
            raise ValueError(f"target {tid} is absent from pinned atlas")
        if pinned["packed_path"] and sha256_file(_absolute(root, pinned["packed_path"])) != pinned["packed_sha256"]:
            raise ValueError(f"packed source changed for {tid}")
        image = _absolute(root, pinned["image_path"]).read_bytes()
        if hashlib.sha256(image).hexdigest() != pinned["image_sha256"] or end > len(image):
            raise ValueError(f"pinned image changed or range invalid for {tid}")
        code, fixes, public = pipeline.extract(obj, recipe["public"], end - start)
        if [projection(f) for f in fixes] != recipe["expected_fixups"]:
            raise ValueError(f"object fixups differ from reviewed recipe for {tid}")
        relocation_rows = db.execute("SELECT linear_offset FROM binary_relocation WHERE variant_id=? "
                                     "ORDER BY ordinal", (pinned["variant_id"],)).fetchall()
        ordered = [r[0] for r in relocation_rows]
        if "expected_relocations" in recipe and [r for r in ordered if start <= r < end] != recipe["expected_relocations"].get(tid, []):
            raise ValueError(f"oracle relocations differ from reviewed recipe for {tid}")
        comparison = pipeline.verify(code, fixes, image[start:end], start, ordered,
                                     pipeline.binding_file(tid, root), public)
        target_rows.append((tid, start, end, pinned, code, comparison))
    candidate_id = f"recipe:{recipe['id']}:{uuid.uuid4().hex}"
    function_id = recipe["id"]
    existing_targets = {row[0] for row in db.execute(
        "SELECT target_id FROM function_target WHERE function_id=?", (function_id,)).fetchall()}
    if existing_targets and existing_targets != set(recipe["targets"]):
        raise ValueError("recipe does not cover every applicable function target")
    receipt_id = uuid.uuid4().hex
    accepted = all(row[5]["strict"] for row in target_rows)
    summary = "all scoped target bytes and fixups exactly match pinned oracles" if accepted else "; ".join(
        f"{tid}: {', '.join(result['problems'] + ['unbound ' + ','.join(result['unbound'])] if result['unbound'] else result['problems'])}"
        for tid, _, _, _, _, result in target_rows if not result["strict"])
    reports = []
    with transaction(db):
        db.execute("INSERT OR IGNORE INTO function_item(function_id,name,classification,status,notes) "
                   "VALUES(?,?,'SHARED_SOURCE_CANDIDATE','candidate',?)",
                   (function_id, recipe["public"].lstrip("_"), f"Tracked recipe {recipe['id']}; original source attribution unproven"))
        for tid, start, end, pinned, code, result in target_rows:
            old = db.execute("SELECT image_offset,byte_length FROM function_target WHERE function_id=? AND target_id=?",
                             (function_id, tid)).fetchone()
            if old and tuple(old) != (start, end - start):
                raise ValueError(f"immutable function target range differs for {tid}")
            if not old:
                db.execute("INSERT INTO function_target(function_id,target_id,image_offset,byte_length) VALUES(?,?,?,?)",
                           (function_id, tid, start, end - start))
        db.execute("INSERT INTO candidate(candidate_id,function_id,source_path,source_sha256,notes) VALUES(?,?,?,?,?)",
                   (candidate_id, function_id, recipe["source"], recipe["source_sha256"],
                    f"fresh recipe {recipe['id']}"))
        for tid, start, end, pinned, code, result in target_rows:
            artifact = Path(build["scratch"]) / f"{tid}.bin"
            artifact.write_bytes(code)
            db.execute("INSERT INTO candidate_output(candidate_id,target_id,artifact_path,artifact_sha256) VALUES(?,?,?,?)",
                       (candidate_id, tid, str(artifact), hashlib.sha256(code).hexdigest()))
        db.execute("INSERT INTO promotion_receipt(receipt_id,candidate_id,accepted,summary,build_proof_json) VALUES(?,?,?,?,?)",
                   (receipt_id, candidate_id, int(accepted), summary,
                    _json({"recipe": recipe["id"], "recipe_sha256": sha256_file(
                        Path(recipe_path) if Path(recipe_path).is_absolute() else root / recipe_path), "build": build})))
        for tid, start, end, pinned, code, result in target_rows:
            prior = db.execute("SELECT 1 FROM target_verification tv JOIN promotion_receipt pr USING(receipt_id) "
                               "WHERE tv.function_id=? AND tv.target_id=? AND tv.exact=1 AND pr.accepted=1 LIMIT 1",
                               (function_id, tid)).fetchone()
            regressed = bool(prior and not result["strict"])
            oracle_bytes = _absolute(root, pinned["image_path"]).read_bytes()[start:end]
            db.execute("INSERT INTO target_verification(receipt_id,function_id,target_id,oracle_sha256,"
                       "candidate_sha256,byte_length,exact,regressed,gates_json,oracle_relocation_entries,"
                       "oracle_relocation_unique,oracle_relocation_order_sha256,oracle_relocation_multiset_sha256,"
                       "oracle_relocation_set_sha256) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                       (receipt_id, function_id, tid, hashlib.sha256(oracle_bytes).hexdigest(),
                        hashlib.sha256(code).hexdigest(), len(code), int(result["strict"]), int(regressed),
                        _json(result), pinned["relocation_count"], pinned["relocation_unique_count"],
                        pinned["relocation_order_sha256"], pinned["relocation_multiset_sha256"],
                        pinned["relocation_set_sha256"]))
            reports.append({"target_id": tid, "exact": result["strict"], "regressed": regressed,
                            "byte_length": len(code), "fixups": result["fixups"],
                            "oracle_relocations_ordered": result["oracle_relocations_ordered"]})
    return {"receipt_id": receipt_id, "accepted": accepted, "summary": summary, "targets": reports}


def export_json(db: sqlite3.Connection) -> str:
    """Portable deterministic snapshot of ledger contents (excluding volatile lease rows)."""
    tables = (
        "binary_variant", "binary_relocation", "target", "region", "function_item", "function_target",
        "function_candidate", "region_match", "known_region", "census_pair", "analysis_import",
        "equivalence_group", "equivalence_member", "candidate", "candidate_output",
        "dependency", "compiler_experiment", "promotion_receipt", "target_verification",
    )
    snapshot: dict[str, list[dict[str, Any]]] = {}
    for table in tables:
        columns = [r["name"] for r in db.execute(f"PRAGMA table_info({table})")]
        order = ",".join(columns)
        snapshot[table] = [dict(row) for row in db.execute(f"SELECT * FROM {table} ORDER BY {order}")]
    return json.dumps(snapshot, sort_keys=True, indent=2, ensure_ascii=False) + "\n"


def import_manifest(db: sqlite3.Connection, manifest_path: Path, root: Path = ROOT) -> None:
    """Append manifest variants and canonical target pins without rewriting prior evidence."""
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    variants = manifest.get("variants", [])
    canonical = {row["id"]: row["canonical_variant"] for row in manifest.get("targets", [])}
    with transaction(db):
        for item in variants:
            variant_id = item["id"]
            game = "circuit" if variant_id.startswith("circuit_") else "cycles"
            raw_path = item.get("path")
            packed_path = raw_path
            image_path = item.get("image_path") or f"work/oracles/{variant_id}/image.bin"
            packed_hash = item.get("source_sha256")
            image_hash = item.get("image_sha256")
            if (packed_path is None) != (packed_hash is None):
                raise ValueError(f"manifest packed path/hash identity is incomplete for {variant_id}")
            if packed_path is not None:
                raw_file = _absolute(root, packed_path)
                if not raw_file.is_file() or sha256_file(raw_file) != packed_hash:
                    raise ValueError(f"manifest packed source SHA-256 mismatch for {variant_id}")
            if image_hash is not None:
                oracle_file = _absolute(root, image_path)
                if not oracle_file.is_file() or sha256_file(oracle_file) != image_hash:
                    raise ValueError(f"manifest oracle image SHA-256 mismatch for {variant_id}")
            metadata_path = _absolute(
                root, item.get("metadata_path", f"work/oracles/{variant_id}/metadata.json")
            )
            image_metadata: dict[str, Any] = {}
            metadata_hash = None
            entries: list[int] | None = None
            order_hash = multiset_hash = set_hash = None
            if metadata_path.is_file():
                image_metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
                metadata_hash = sha256_file(metadata_path)
                if "relocations" in image_metadata:
                    entries = image_metadata["relocations"]
                    if not isinstance(entries, list) or any(type(value) is not int or value < 0 for value in entries):
                        raise ValueError(f"invalid linear relocation list in {metadata_path}")
                    order_hash, multiset_hash, set_hash = _relocation_digest(entries)
                    if item.get("relocation_count") is not None and item["relocation_count"] != len(entries):
                        raise ValueError(f"manifest relocation count disagrees with {metadata_path}")
                    for field in ("relocation_count",):
                        if image_metadata.get(field) is not None and image_metadata[field] != len(entries):
                            raise ValueError(f"metadata {field} disagrees with its ordered relocation list")
                    ordered_packed_sha = _packed_u32_digest(entries)
                    expected_order_sha = item.get("relocations_sha256")
                    metadata_order_sha = image_metadata.get("relocations_sha256")
                    if not expected_order_sha or ordered_packed_sha != expected_order_sha:
                        raise ValueError(f"manifest ordered relocation SHA-256 mismatch for {variant_id}")
                    if metadata_order_sha and ordered_packed_sha != metadata_order_sha:
                        raise ValueError(f"metadata ordered relocation SHA-256 mismatch for {variant_id}")
                    # The existing manifest's `relocations_set_sha256` is the SHA of sorted
                    # entries including duplicates. Keep validating that legacy field while
                    # separately recording a true unique-location set digest in this atlas.
                    sorted_entries_sha = _packed_u32_digest(sorted(entries))
                    for source, value in (("manifest", item.get("relocations_set_sha256")),
                                          ("metadata", image_metadata.get("relocations_set_sha256"))):
                        if value and value != sorted_entries_sha:
                            raise ValueError(f"{source} sorted relocation SHA-256 mismatch for {variant_id}")
                    duplicates = len(entries) - len(set(entries))
                    for source, value in (("manifest", item.get("relocation_duplicate_count")),
                                          ("metadata", image_metadata.get("relocation_duplicate_count"))):
                        if value is not None and value != duplicates:
                            raise ValueError(f"{source} relocation duplicate count mismatch for {variant_id}")
            relocation_count = len(entries) if entries is not None else item.get("relocation_count")
            relocation_unique = len(set(entries)) if entries is not None else None
            metadata_json = _json({"manifest": item, "image_metadata": image_metadata})
            prior = db.execute(
                "SELECT packed_sha256,image_sha256,metadata_sha256,relocation_count,relocation_unique_count,"
                "relocation_order_sha256,"
                "relocation_multiset_sha256,relocation_set_sha256 FROM binary_variant WHERE variant_id=?",
                (variant_id,),
            ).fetchone()
            if prior:
                incoming = (packed_hash, image_hash, metadata_hash, relocation_count, relocation_unique,
                            order_hash, multiset_hash, set_hash)
                stored = tuple(prior[key] for key in (
                    "packed_sha256", "image_sha256", "metadata_sha256", "relocation_count",
                    "relocation_unique_count", "relocation_order_sha256",
                    "relocation_multiset_sha256", "relocation_set_sha256",
                ))
                if stored != incoming:
                    raise ValueError(f"variant {variant_id} conflicts with previously pinned evidence hashes")
            db.execute(
                "INSERT OR IGNORE INTO binary_variant(variant_id,game,label,provenance,packed_path,"
                "packed_sha256,image_path,image_sha256,image_size,metadata_sha256,relocation_count,"
                "relocation_unique_count,relocation_order_sha256,relocation_multiset_sha256,"
                "relocation_set_sha256,variant_metadata_json,canonical_oracle,notes) "
                "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                (variant_id, game, variant_id, "analysis/manifest.json", packed_path, packed_hash,
                 image_path, image_hash, item.get("image_size"), metadata_hash, relocation_count,
                 relocation_unique, order_hash, multiset_hash, set_hash, metadata_json,
                 int(canonical.get(item.get("target"), "") == variant_id),
                 item.get("oracle_status", "")),
            )
            if entries is not None:
                existing = [row[0] for row in db.execute(
                    "SELECT linear_offset FROM binary_relocation WHERE variant_id=? ORDER BY ordinal",
                    (variant_id,),
                )]
                if existing and existing != entries:
                    raise ValueError(f"variant {variant_id} relocation stream conflicts with pinned evidence")
                if not existing:
                    db.executemany(
                        "INSERT INTO binary_relocation(variant_id,ordinal,linear_offset) VALUES(?,?,?)",
                        [(variant_id, ordinal, offset) for ordinal, offset in enumerate(entries)],
                    )
        for target_id, variant_id in canonical.items():
            game, video = target_id.split("_", 1)
            prior = db.execute("SELECT oracle_variant_id FROM target WHERE target_id=?", (target_id,)).fetchone()
            if prior and prior["oracle_variant_id"] != variant_id:
                raise ValueError(f"target {target_id} already pins {prior['oracle_variant_id']}, not {variant_id}")
            db.execute("INSERT OR IGNORE INTO target(target_id,game,video,oracle_variant_id) VALUES(?,?,?,?)",
                       (target_id, game, video, variant_id))


def _ensure_same(db: sqlite3.Connection, table: str, key_column: str, key: str,
                 values: Mapping[str, Any]) -> bool:
    """Insert an immutable evidence row, or verify an existing row is identical."""
    found = db.execute(f"SELECT * FROM {table} WHERE {key_column}=?", (key,)).fetchone()
    if found is None:
        columns = list(values)
        marks = ",".join("?" for _ in columns)
        db.execute(
            f"INSERT INTO {table}({','.join(columns)}) VALUES({marks})",
            [values[column] for column in columns],
        )
        return True
    for column, value in values.items():
        if found[column] != value:
            raise ValueError(f"immutable census evidence conflict in {table}.{key_column}={key}")
    return False


def import_census(
    db: sqlite3.Connection,
    census_path: Path = ROOT / "analysis" / "census" / "census.json",
    candidates_path: Path = ROOT / "analysis" / "census" / "function_candidates.json",
    known_regions_path: Path = ROOT / "analysis" / "census" / "known_regions.json",
    *,
    root: Path = ROOT,
) -> dict[str, int]:
    """Idempotently import byte regions, comparison summaries, and heuristic candidates.

    Candidate boundary evidence is stored separately from callable function inventory;
    shared byte regions likewise remain independent records.
    """
    paths = {
        "analysis/census/census.json": census_path,
        "analysis/census/function_candidates.json": candidates_path,
        "analysis/census/known_regions.json": known_regions_path,
    }
    docs = {name: json.loads(path.read_text(encoding="utf-8")) for name, path in paths.items()}
    source_hashes = {name: sha256_file(path) for name, path in paths.items()}
    counts = {"function_candidates": 0, "region_matches": 0, "known_regions": 0, "pairs": 0}

    with transaction(db):
        for row in docs["analysis/census/function_candidates.json"]["functions"]:
            variant_id = row["variant_id"]
            target_id = row["target"]
            variant = db.execute(
                "SELECT image_size FROM binary_variant WHERE variant_id=?", (variant_id,)
            ).fetchone()
            if variant is None:
                raise ValueError(f"census candidate references unknown binary variant {variant_id}")
            if db.execute("SELECT 1 FROM target WHERE target_id=?", (target_id,)).fetchone() is None:
                raise ValueError(f"census candidate references unknown target {target_id}")
            start, end = int(row["start"]), int(row["end"])
            if end <= start or (row.get("size") is not None and row["size"] != end - start):
                raise ValueError(f"invalid heuristic candidate range for {variant_id}:{start:x}")
            if variant["image_size"] is not None and end > variant["image_size"]:
                raise ValueError(f"heuristic candidate exceeds image for {variant_id}:{start:x}")
            cid = f"heuristic:{source_hashes['analysis/census/function_candidates.json']}:{variant_id}:{start:08x}:{end:08x}"
            evidence = _json(row)
            candidate_values = {
                "candidate_id": cid, "target_id": target_id, "variant_id": variant_id,
                "image_start": start, "image_end": end,
                "boundary_status": row["boundary_status"],
                "boundary_confidence": row["confidence"],
                "classification": row.get("classification", "UNKNOWN"),
                "runtime_attribution": row.get("runtime_attribution", "unproven"),
                "decoded_instruction_count": row["decoded_instruction_count"],
                "evidence_json": evidence,
                "source_sha256": source_hashes["analysis/census/function_candidates.json"],
            }
            if _ensure_same(db, "function_candidate", "candidate_id", cid, candidate_values):
                counts["function_candidates"] += 1

        census = docs["analysis/census/census.json"]
        for row in census["regions"]:
            va, vb = row["a"], row["b"]
            variant_a, variant_b = va, vb
            size = int(row["size"])
            start_a, start_b = int(row["a_start"]), int(row["b_start"])
            if size <= 0:
                raise ValueError("census region has non-positive byte length")
            for variant_id, end in ((variant_a, start_a + size), (variant_b, start_b + size)):
                variant = db.execute("SELECT image_size FROM binary_variant WHERE variant_id=?", (variant_id,)).fetchone()
                if variant is None or (variant["image_size"] is not None and end > variant["image_size"]):
                    raise ValueError(f"census region range exceeds or lacks variant {variant_id}")
            content = _json(row)
            region_id = hashlib.sha256(
                (source_hashes["analysis/census/census.json"] + ":" + content).encode("utf-8")
            ).hexdigest()
            region_values = {
                "region_match_id": region_id, "variant_a_id": variant_a, "variant_b_id": variant_b,
                "start_a": start_a, "end_a": start_a + size,
                "start_b": start_b, "end_b": start_b + size,
                "match_type": row["match_type"],
                "matched_bytes_sha256": row.get("common_bytes_sha256", row.get("masked_bytes_sha256")),
                "confidence": row["confidence"], "classification": row["classification"],
                "source_level_status": row["source_level_status"],
                "evidence_json": content, "source_sha256": source_hashes["analysis/census/census.json"],
            }
            if _ensure_same(db, "region_match", "region_match_id", region_id, region_values):
                counts["region_matches"] += 1

        for row in census["pairs"]:
            pair_id = hashlib.sha256(
                (source_hashes["analysis/census/census.json"] + ":" + _json(row)).encode("utf-8")
            ).hexdigest()
            pair_values = {
                "pair_id": pair_id, "variant_a_id": row["a"], "variant_b_id": row["b"],
                "a_scope_end": row.get("a_scope_end", row.get("scope_end")),
                "b_scope_end": row.get("b_scope_end", row.get("scope_end")),
                "strict_exact_high_variation_bytes": row["strict_exact_high_variation_bytes"],
                "strict_block_count": row["strict_block_count"],
                "relocation_masked_high_variation_bytes": row["relocation_masked_high_variation_bytes"],
                "relocation_masked_block_count": row["relocation_masked_block_count"],
                "interpretation": row["interpretation"], "evidence_json": _json(row),
                "source_sha256": source_hashes["analysis/census/census.json"],
            }
            if _ensure_same(db, "census_pair", "pair_id", pair_id, pair_values):
                counts["pairs"] += 1

        for row in docs["analysis/census/known_regions.json"]["regions"]:
            region_id = f"known:{source_hashes['analysis/census/known_regions.json']}:{row['label']}"
            left, right = row["a"], row["b"]
            values = {
                "known_region_id": region_id, "label": row["label"],
                "variant_a_id": left["target"], "start_a": int(left["start"], 0),
                "variant_b_id": right["target"], "start_b": int(right["start"], 0),
                "reported_size": row["a"].get("reported_size", right.get("reported_size")),
                "boundary_status": row["boundary_status"], "match_status": row["match_status"],
                "evidence_json": _json(row),
                "source_sha256": source_hashes["analysis/census/known_regions.json"],
            }
            if _ensure_same(db, "known_region", "known_region_id", region_id, values):
                counts["known_regions"] += 1

        row_counts = {
            "analysis/census/census.json": len(census["variants"]) + len(census["pairs"]) + len(census["regions"]),
            "analysis/census/function_candidates.json": len(docs["analysis/census/function_candidates.json"]["functions"]),
            "analysis/census/known_regions.json": len(docs["analysis/census/known_regions.json"]["regions"]),
        }
        for name, digest in source_hashes.items():
            prior = db.execute(
                "SELECT row_count FROM analysis_import WHERE source_file=? AND source_sha256=?",
                (name, digest),
            ).fetchone()
            if prior and prior["row_count"] != row_counts[name]:
                raise ValueError(f"analysis import row count changed for {name}")
            if not prior:
                db.execute(
                    "INSERT INTO analysis_import(source_file,source_sha256,row_count) VALUES(?,?,?)",
                    (name, digest, row_counts[name]),
                )
    return counts


def _main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--db", type=Path, default=DB_PATH)
    sub = parser.add_subparsers(dest="command", required=True)
    sub.add_parser("init")
    exp = sub.add_parser("export")
    exp.add_argument("--output", type=Path)
    imp = sub.add_parser("import-manifest")
    imp.add_argument("manifest", type=Path, nargs="?", default=ROOT / "analysis" / "manifest.json")
    census = sub.add_parser("import-census")
    census.add_argument("census", type=Path, nargs="?", default=ROOT / "analysis" / "census" / "census.json")
    census.add_argument("candidates", type=Path, nargs="?", default=ROOT / "analysis" / "census" / "function_candidates.json")
    census.add_argument("known_regions", type=Path, nargs="?", default=ROOT / "analysis" / "census" / "known_regions.json")
    args = parser.parse_args()
    if args.command == "init":
        initialize(args.db)
    else:
        initialize(args.db)
        db = connect(args.db)
        try:
            if args.command == "import-manifest":
                import_manifest(db, args.manifest)
            elif args.command == "import-census":
                result = import_census(db, args.census, args.candidates, args.known_regions)
                print(json.dumps(result, sort_keys=True))
            else:
                result = export_json(db)
                if args.output:
                    args.output.parent.mkdir(parents=True, exist_ok=True)
                    args.output.write_text(result, encoding="utf-8", newline="\n")
                else:
                    print(result, end="")
        finally:
            db.close()


if __name__ == "__main__":
    _main()
