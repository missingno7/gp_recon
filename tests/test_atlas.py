import json
import sqlite3
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from tools.matching import atlas


class AtlasTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=atlas.ROOT)
        self.root = Path(self.temp.name)
        self.db_path = self.root / "atlas.sqlite"
        atlas.initialize(self.db_path)
        self.db = atlas.connect(self.db_path)
        self._seed()

    def tearDown(self):
        self.db.close()
        self.temp.cleanup()

    def _seed(self):
        for tid, vid, byte in (("circuit_ega", "v_ega", b"\x90\xC3"),
                               ("cycles_ega", "v_cycles", b"\x90\xC3")):
            oracle = self.root / f"{vid}.bin"
            oracle.write_bytes(b"prefix" + byte + b"suffix")
            digest = atlas.sha256_file(oracle)
            packed = self.root / f"{vid}.ex_"
            packed.write_bytes(b"packed source " + vid.encode("ascii"))
            self.db.execute(
                "INSERT INTO binary_variant(variant_id,game,label,provenance,packed_path,packed_sha256,"
                "image_path,image_sha256,image_size) VALUES(?,?,?,?,?,?,?,?,?)",
                (vid, "circuit" if tid.startswith("circuit") else "cycles", vid, "fixture",
                 str(packed), atlas.sha256_file(packed), str(oracle), digest, oracle.stat().st_size),
            )
            self.db.execute("INSERT INTO target(target_id,game,video,oracle_variant_id) VALUES(?,?,?,?)",
                            (tid, "circuit" if tid.startswith("circuit") else "cycles", "ega", vid))
        self.db.execute("INSERT INTO function_item(function_id,name) VALUES('f_test','test')")
        for tid in ("circuit_ega", "cycles_ega"):
            self.db.execute("INSERT INTO function_target(function_id,target_id,image_offset,byte_length) "
                            "VALUES('f_test',?,6,2)", (tid,))
        self.db.commit()

    def _candidate(self, candidate_id="c1", output=b"\x90\xC3", targets=None):
        src = self.root / f"{candidate_id}.c"
        src.write_text("void f(void) {}\n", encoding="utf-8")
        atlas.record_candidate(self.db, candidate_id=candidate_id, function_id="f_test",
                               source_path=str(src), root=self.root)
        for tid in (targets or ("circuit_ega", "cycles_ega")):
            artifact = self.root / f"{candidate_id}-{tid}.bin"
            artifact.write_bytes(output)
            atlas.record_output(self.db, candidate_id, tid, str(artifact), root=self.root)

    def _proof(self, candidate_id="c1", function_bytes=b"\x90\xC3"):
        candidate = self.db.execute("SELECT source_sha256 FROM candidate WHERE candidate_id=?",
                                    (candidate_id,)).fetchone()
        matches = []
        for tid in ("circuit_ega", "cycles_ega"):
            image = self.root / f"v_{'ega' if tid.startswith('circuit') else 'cycles'}.bin"
            oracle = image.read_bytes()[6:8]
            matches.append({"id": tid, "image_sha256": atlas.sha256_file(image), "offset": 6,
                            "length": 2, "match_sha256": atlas.hashlib.sha256(oracle).hexdigest(),
                            "exact": oracle == function_bytes})
        return {"source_sha256": candidate["source_sha256"], "object": {
                "path": "proof.obj", "sha256": "0" * 64, "symbol": "_test",
                "function_bytes_hex": function_bytes.hex(),
                "function_sha256": atlas.hashlib.sha256(function_bytes).hexdigest()},
                "targets": matches}

    def test_promotion_rechecks_oracle_bytes_for_each_target(self):
        self._candidate()
        with patch.object(atlas, "_run_fresh_build_proof",
                          return_value=(self._proof(), None)):
            result = atlas.promote(self.db, "c1", root=self.root)
        self.assertTrue(result["accepted"])
        self.assertEqual({"circuit_ega", "cycles_ega"}, {r["target_id"] for r in result["targets"]})
        self.assertTrue(all(row["exact"] for row in result["targets"]))
        self.assertEqual(2, self.db.execute("SELECT count(*) FROM target_verification").fetchone()[0])

    def test_mismatch_writes_rejected_receipt_and_does_not_promote(self):
        self._candidate(output=b"\xCC\xC3")
        with patch.object(atlas, "_run_fresh_build_proof",
                          return_value=(self._proof(function_bytes=b"\xCC\xC3"), None)):
            result = atlas.promote(self.db, "c1", root=self.root)
        self.assertFalse(result["accepted"])
        receipt = self.db.execute("SELECT accepted,summary FROM promotion_receipt").fetchone()
        self.assertEqual(0, receipt["accepted"])
        self.assertIn("strict byte mismatch", receipt["summary"])

    def test_receipt_marks_per_target_regressions_against_prior_exact_candidate(self):
        self._candidate("c1")
        with patch.object(atlas, "_run_fresh_build_proof", return_value=(self._proof("c1"), None)):
            self.assertTrue(atlas.promote(self.db, "c1", root=self.root)["accepted"])
        self._candidate("c2", output=b"\xCC\xC3")
        with patch.object(atlas, "_run_fresh_build_proof",
                          return_value=(self._proof("c2", b"\xCC\xC3"), None)):
            result = atlas.promote(self.db, "c2", root=self.root)
        self.assertFalse(result["accepted"])
        self.assertTrue(all(row["regressed"] for row in result["targets"]))

    def test_missing_fresh_builder_cannot_promote_oracle_extracted_bytes(self):
        self._candidate()
        with patch.object(atlas, "_run_fresh_build_proof",
                          return_value=(None, "trusted fresh-build proof tool is unavailable")):
            result = atlas.promote(self.db, "c1", root=self.root)
        self.assertFalse(result["accepted"])
        self.assertIn("trusted fresh-build proof tool is unavailable", result["summary"])
        self.assertEqual(0, self.db.execute("SELECT accepted FROM promotion_receipt").fetchone()[0])

    def test_promotion_rejects_packed_source_mutated_after_import(self):
        self._candidate()
        packed = self.root / "v_ega.ex_"
        packed.write_bytes(packed.read_bytes() + b"changed")
        with patch.object(atlas, "_run_fresh_build_proof", return_value=(self._proof(), None)):
            result = atlas.promote(self.db, "c1", root=self.root)
        self.assertFalse(result["accepted"])
        self.assertIn("pinned packed source hash changed for circuit_ega", result["summary"])

    def test_fresh_builder_dispatch_rejects_unreviewed_source_paths(self):
        proof, error = atlas._run_fresh_build_proof("some/other.c", "0" * 64, root=self.root)
        self.assertIsNone(proof)
        self.assertIn("no reviewed fresh-build recipe", error)

    def test_relocation_inside_source_function_range_blocks_promotion(self):
        self._candidate()
        self.db.execute("INSERT INTO binary_relocation(variant_id,ordinal,linear_offset) VALUES('v_ega',0,6)")
        with patch.object(atlas, "_run_fresh_build_proof", return_value=(self._proof(), None)):
            result = atlas.promote(self.db, "c1", root=self.root)
        self.assertFalse(result["accepted"])
        self.assertIn("relocation entries for circuit_ega", result["summary"])
        circuit = next(row for row in result["targets"] if row["target_id"] == "circuit_ega")
        self.assertEqual(1, circuit["oracle_range_relocation_intersections"])
        self.assertFalse(circuit["gates"]["oracle_range_relocation_free"])

    def test_missing_output_blocks_promotion(self):
        self._candidate(targets=("circuit_ega",))
        result = atlas.promote(self.db, "c1", root=self.root)
        self.assertFalse(result["accepted"])
        self.assertIn("missing output for cycles_ega", result["summary"])

    def test_binary_evidence_is_immutable(self):
        with self.assertRaises(sqlite3.IntegrityError):
            self.db.execute("UPDATE binary_variant SET image_sha256=? WHERE variant_id='v_ega'", ("0" * 64,))

    def test_target_oracle_and_function_ranges_are_immutable(self):
        with self.assertRaises(sqlite3.IntegrityError):
            self.db.execute("UPDATE target SET oracle_variant_id='v_cycles' WHERE target_id='circuit_ega'")
        with self.assertRaises(sqlite3.IntegrityError):
            self.db.execute("DELETE FROM function_target WHERE function_id='f_test' AND target_id='circuit_ega'")

    def test_manifest_import_pins_targets_and_keeps_variant_metadata(self):
        metadata_path = self.root / "work" / "oracles" / "cycles_tandy" / "metadata.json"
        metadata_path.parent.mkdir(parents=True)
        relocations = [3, 4, 3]
        ordered_sha = atlas._packed_u32_digest(relocations)
        sorted_sha = atlas._packed_u32_digest(sorted(relocations))
        metadata_path.write_text(json.dumps({
            "relocations": relocations, "relocation_count": 3, "relocation_duplicate_count": 1,
            "relocations_sha256": ordered_sha, "relocations_set_sha256": sorted_sha,
        }), encoding="utf-8")
        packed_path = self.root / "assets" / "Cycles" / "GPTDY.EX_"
        packed_path.parent.mkdir(parents=True, exist_ok=True)
        packed_path.write_bytes(b"packed fixture")
        image_path = self.root / "work" / "oracles" / "cycles_tandy" / "image.bin"
        image_path.write_bytes(b"0123456789")
        manifest_path = self.root / "manifest.json"
        manifest_path.write_text(json.dumps({
            "schema_version": 1,
            "targets": [{"id": "cycles_tandy", "canonical_variant": "cycles_tandy"}],
            "variants": [{"id": "cycles_tandy", "target": "cycles_tandy",
                          "path": "assets/Cycles/GPTDY.EX_",
                          "source_sha256": atlas.sha256_file(packed_path),
                          "image_sha256": atlas.sha256_file(image_path), "image_size": 10,
                          "relocation_count": 3, "relocation_duplicate_count": 1,
                          "relocations_sha256": ordered_sha, "relocations_set_sha256": sorted_sha}],
        }), encoding="utf-8")
        atlas.import_manifest(self.db, manifest_path, root=self.root)
        row = self.db.execute(
            "SELECT oracle_variant_id FROM target WHERE target_id='cycles_tandy'"
        ).fetchone()
        self.assertEqual("cycles_tandy", row["oracle_variant_id"])
        metadata = self.db.execute(
            "SELECT variant_metadata_json FROM binary_variant WHERE variant_id='cycles_tandy'"
        ).fetchone()["variant_metadata_json"]
        self.assertEqual(3, json.loads(metadata)["manifest"]["relocation_count"])
        variant = self.db.execute(
            "SELECT relocation_count,relocation_unique_count,relocation_order_sha256,"
            "relocation_multiset_sha256,relocation_set_sha256 FROM binary_variant "
            "WHERE variant_id='cycles_tandy'"
        ).fetchone()
        self.assertEqual((3, 2), (variant["relocation_count"], variant["relocation_unique_count"]))
        self.assertNotEqual(variant["relocation_order_sha256"], variant["relocation_multiset_sha256"])
        self.assertNotEqual(variant["relocation_multiset_sha256"], variant["relocation_set_sha256"])
        self.assertEqual([3, 4, 3], [row[0] for row in self.db.execute(
            "SELECT linear_offset FROM binary_relocation WHERE variant_id='cycles_tandy' ORDER BY ordinal"
        )])

    def test_relocation_hashes_keep_order_multiplicity_and_set_separate(self):
        ordered, multi, unique = atlas._relocation_digest([3, 4, 3])
        reordered, reordered_multi, reordered_unique = atlas._relocation_digest([4, 3, 3])
        self.assertNotEqual(ordered, reordered)
        self.assertEqual(multi, reordered_multi)
        self.assertEqual(unique, reordered_unique)

    def test_manifest_import_rejects_changed_relocation_bytes_with_same_count(self):
        manifest_path = self.root / "manifest.json"
        metadata_path = self.root / "work" / "oracles" / "cycles_tandy" / "metadata.json"
        metadata_path.parent.mkdir(parents=True)
        expected = [3, 4, 3]
        expected_hash = atlas._packed_u32_digest(expected)
        expected_set_hash = atlas._packed_u32_digest(sorted(expected))
        metadata_path.write_text(json.dumps({"relocations": expected, "relocation_count": 3,
                                             "relocations_sha256": expected_hash,
                                             "relocations_set_sha256": expected_set_hash}), encoding="utf-8")
        packed_path = self.root / "x"
        packed_path.write_bytes(b"packed fixture")
        image_path = self.root / "work" / "oracles" / "cycles_tandy" / "image.bin"
        image_path.write_bytes(b"0123456789")
        manifest_path.write_text(json.dumps({
            "targets": [{"id": "cycles_tandy", "canonical_variant": "cycles_tandy"}],
            "variants": [{"id": "cycles_tandy", "target": "cycles_tandy", "path": "x",
                          "source_sha256": atlas.sha256_file(packed_path),
                          "image_sha256": atlas.sha256_file(image_path), "image_size": 10,
                          "relocation_count": 3, "relocations_sha256": expected_hash,
                          "relocations_set_sha256": expected_set_hash}],
        }), encoding="utf-8")
        atlas.import_manifest(self.db, manifest_path, root=self.root)
        metadata_path.write_text(json.dumps({"relocations": [3, 4, 5], "relocation_count": 3,
                                             "relocations_sha256": atlas._packed_u32_digest([3, 4, 5]),
                                             "relocations_set_sha256": atlas._packed_u32_digest([3, 4, 5])}),
                                 encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "manifest ordered relocation SHA-256 mismatch"):
            atlas.import_manifest(self.db, manifest_path, root=self.root)

    def test_manifest_import_rejects_packed_source_hash_mismatch(self):
        packed = self.root / "source.EX_"
        packed.write_bytes(b"actual source bytes")
        image = self.root / "oracle.bin"
        image.write_bytes(b"oracle")
        manifest_path = self.root / "manifest.json"
        manifest_path.write_text(json.dumps({
            "targets": [{"id": "cycles_tandy", "canonical_variant": "cycles_tandy"}],
            "variants": [{"id": "cycles_tandy", "target": "cycles_tandy",
                          "path": packed.name, "source_sha256": "0" * 64,
                          "image_path": image.name, "image_sha256": atlas.sha256_file(image)}],
        }), encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "manifest packed source SHA-256 mismatch"):
            atlas.import_manifest(self.db, manifest_path, root=self.root)

    def test_census_import_is_repeatable_and_keeps_candidates_and_regions_separate(self):
        census_path = self.root / "census.json"
        candidates_path = self.root / "function_candidates.json"
        known_path = self.root / "known_regions.json"
        census_path.write_text(json.dumps({
            "variants": [],
            "pairs": [{"a": "v_ega", "b": "v_cycles", "scope_end": 8,
                       "strict_exact_high_variation_bytes": 2, "strict_block_count": 1,
                       "relocation_masked_high_variation_bytes": 3, "relocation_masked_block_count": 1,
                       "interpretation": "exploratory"}],
            "regions": [
                {"a": "v_ega", "b": "v_cycles", "a_start": 1, "b_start": 2,
                 "size": 2, "match_type": "SHARED_EXACT", "common_bytes_sha256": "1" * 64,
                 "confidence": "high", "classification": "UNKNOWN", "source_level_status": "unproven"},
                {"a": "v_ega", "b": "v_cycles", "a_start": 4, "b_start": 5,
                 "size": 2, "match_type": "RELOCATION_MASKED", "common_bytes_sha256": "2" * 64,
                 "confidence": "medium", "classification": "UNKNOWN", "source_level_status": "unproven"},
            ],
        }), encoding="utf-8")
        candidates_path.write_text(json.dumps({"functions": [{
            "variant_id": "v_ega", "target": "circuit_ega", "start": 1, "end": 4, "size": 3,
            "boundary_status": "heuristic_reachable_call_target_until_ret", "confidence": "low",
            "classification": "UNKNOWN", "runtime_attribution": "unproven",
            "decoded_instruction_count": 2,
        }]}), encoding="utf-8")
        known_path.write_text(json.dumps({"regions": [{
            "label": "reported", "a": {"target": "v_ega", "start": "0x1", "reported_size": 2},
            "b": {"target": "v_cycles", "start": "0x2", "reported_size": 2},
            "boundary_status": "verified_internal_slice_only", "match_status": "SHARED_EXACT_REGION",
        }]}), encoding="utf-8")
        args = (census_path, candidates_path, known_path)
        first = atlas.import_census(self.db, *args, root=self.root)
        second = atlas.import_census(self.db, *args, root=self.root)
        self.assertEqual({"function_candidates": 1, "region_matches": 2, "known_regions": 1, "pairs": 1}, first)
        self.assertEqual({"function_candidates": 0, "region_matches": 0, "known_regions": 0, "pairs": 0}, second)
        candidate = self.db.execute("SELECT boundary_status,boundary_confidence FROM function_candidate").fetchone()
        self.assertEqual(("heuristic_reachable_call_target_until_ret", "low"), tuple(candidate))
        exact = self.db.execute("SELECT count(*) FROM region_match WHERE match_type='SHARED_EXACT'").fetchone()[0]
        masked = self.db.execute("SELECT count(*) FROM region_match WHERE match_type='RELOCATION_MASKED'").fetchone()[0]
        self.assertEqual((1, 1), (exact, masked))
        prior_pair = self.db.execute("SELECT pair_id FROM census_pair").fetchone()["pair_id"]
        revised = json.loads(census_path.read_text(encoding="utf-8"))
        revised["pairs"][0]["interpretation"] = "revised analysis"
        census_path.write_text(json.dumps(revised), encoding="utf-8")
        appended = atlas.import_census(self.db, *args, root=self.root)
        self.assertEqual(1, appended["pairs"])
        pair_rows = self.db.execute(
            "SELECT pair_id,interpretation FROM census_pair ORDER BY interpretation"
        ).fetchall()
        self.assertEqual(2, len(pair_rows))
        self.assertIn((prior_pair, "exploratory"), [tuple(row) for row in pair_rows])
        self.assertIn("revised analysis", [row["interpretation"] for row in pair_rows])

    def test_lease_is_exclusive_and_token_fenced(self):
        token = atlas.claim(self.db, "cluster:test", "worker-a", ttl_seconds=60)
        self.assertIsNotNone(token)
        self.assertIsNone(atlas.claim(self.db, "cluster:test", "worker-b", ttl_seconds=60))
        self.assertFalse(atlas.release_lease(self.db, "wrong-token"))
        self.assertTrue(atlas.renew_lease(self.db, token, ttl_seconds=60))
        self.assertTrue(atlas.release_lease(self.db, token))
        self.assertIsNotNone(atlas.claim(self.db, "cluster:test", "worker-b", ttl_seconds=60))


if __name__ == "__main__":
    unittest.main()
