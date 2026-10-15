import hashlib
import json
from pathlib import Path
import shutil
import tempfile
import unittest

from tools.omf import OmfReader, MatchError
from tools.matching import atlas, pipeline


def record(kind, body):
    header = bytes([kind]) + (len(body) + 1).to_bytes(2, "little")
    return header + body + bytes([(-sum(header + body)) & 255])


def fixture_object(threaded=False):
    names = b"\x05_TEXT\x04CODE\x06DGROUP"
    data = b"\xe8\x00\x00\xc3"
    fix = (b"\x40\x01\x08\x01" if threaded else b"") + b"\x84\x01" + (b"\x8c" if threaded else b"\x02\x01\x02\x01")
    return b"".join((record(0x80, b"\x01X"), record(0x96, names),
                     record(0x98, b"\x48\x04\x00\x01\x02\x00"),
                     record(0x9a, b"\x03\xff\x01"),
                     record(0x8c, b"\x02_g\x00"),
                     record(0x90, b"\x00\x01\x02_f\x00\x00\x00"),
                     record(0xa0, b"\x01\x00\x00" + data),
                     record(0x9c, fix), record(0x8a, b"\x00")))


class OmfTests(unittest.TestCase):
    def test_threaded_fixup(self):
        obj = OmfReader().read(fixture_object(True))
        self.assertEqual(b"\xe8\x00\x00\xc3", obj.segment_bytes("_TEXT"))
        self.assertEqual("_g", obj.linker_fixups[0]["target"])
        self.assertEqual("_TEXT", obj.linker_fixups[0]["frame"])
        self.assertTrue(obj.linker_fixups[0]["self_relative"])

    def test_bad_checksum_and_unknown_record_fail(self):
        raw = bytearray(fixture_object())
        raw[7] ^= 1
        with self.assertRaises(MatchError):
            OmfReader().read(bytes(raw))
        with self.assertRaises(MatchError):
            OmfReader().read(record(0xf1, b""))

    def test_lidata_expansion(self):
        raw = b"".join((record(0x96, b"\x05_TEXT\x04CODE"),
                        record(0x98, b"\x48\x04\x00\x01\x02\x00"),
                        record(0xa2, b"\x01\x00\x00\x02\x00\x00\x00\x02AB"),
                        record(0x8a, b"\x00")))
        self.assertEqual(b"ABAB", OmfReader().read(raw).segment_bytes("_TEXT"))


class BindingTests(unittest.TestCase):
    def test_relative_positive_and_wrong_binding(self):
        obj = OmfReader().read(fixture_object(True))
        code, fixes, pub = pipeline.extract(obj, "_f", 4)
        result = pipeline.verify(code, fixes, b"\xe8\x03\x00\xc3", 0x100, [],
                                 {"_g": {"address": "0010:0006"}}, pub)
        self.assertTrue(result["strict"], result)
        wrong = pipeline.verify(code, fixes, b"\xe8\x03\x00\xc3", 0x100, [],
                                {"_g": {"address": "0010:0007"}}, pub)
        self.assertFalse(wrong["strict"])
        self.assertFalse(pipeline.verify(code, fixes, b"\xe8\x03\x00\xc3", 0x100, [], {}, pub)["strict"])

    def test_relocation_positive_missing_extra_and_duplicate(self):
        fix = {"offset": 1, "width": 2, "loc": "base16", "self_relative": False,
               "target": "_seg", "frame": "_seg", "frame_kind": "target",
               "encoded_addend": "0000", "displacement": 0}
        code = b"\xb8\x00\x00\xc3"
        original = b"\xb8\x34\x12\xc3"
        bindings = {"_seg": {"address": "1234:0000", "provenance": "fixture", "confidence": "high"}}
        self.assertTrue(pipeline.verify(code, [fix], original, 0x100, [0x101], bindings)["strict"])
        for relocs in ([], [0x101, 0x102], [0x101, 0x101]):
            self.assertFalse(pipeline.verify(code, [fix], original, 0x100, relocs, bindings)["strict"])


class RecipeTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=atlas.ROOT / "work")
        self.root = Path(self.temp.name)
        for directory in ("analysis/recipes", "analysis/bindings", "src", "work/search"):
            (self.root / directory).mkdir(parents=True, exist_ok=True)
        self.source = self.root / "src/unit.c"
        self.source.write_text("unsigned plus_one(unsigned x) { return x + 1; }\n")
        self.recipe = self.root / "analysis/recipes/plus_one.json"
        self.data = {"schema": 1, "id": "plus_one", "source": "src/unit.c",
                     "source_sha256": hashlib.sha256(self.source.read_bytes()).hexdigest(),
                     "profile": "msc510-small-o_gs", "public": "_plus_one",
                     "expected_fixups": [], "targets": {"circuit_ega": {"start": 6, "end": 16}}}
        self.recipe.write_text(json.dumps(self.data))

    def tearDown(self):
        self.temp.cleanup()

    def test_recipe_source_pin_and_scope(self):
        self.assertEqual("plus_one", atlas.load_recipe(self.recipe, root=self.root)["id"])
        self.source.write_text("changed")
        with self.assertRaises(ValueError):
            atlas.load_recipe(self.recipe, root=self.root)

    def test_real_c_compiler_to_synthetic_promotion(self):
        shutil.copyfile(atlas.ROOT / "analysis/toolchain.json", self.root / "analysis/toolchain.json")
        obj, built = pipeline.build(self.source, "msc510-small-o_gs", self.root)
        self.assertEqual("built", built["status"])
        code, fixes, _ = pipeline.extract(obj, "_plus_one", 10)
        self.assertEqual([], fixes)
        image = b"prefix" + code + b"suffix"
        image_path = self.root / "work/image.bin"
        image_path.write_bytes(image)
        packed = self.root / "work/packed.exe"
        packed.write_bytes(b"fixture packed")
        (self.root / "analysis/bindings/circuit_ega.json").write_text(json.dumps({"symbols": {}}))
        db_path = self.root / "work/atlas.sqlite"
        atlas.initialize(db_path)
        db = atlas.connect(db_path)
        try:
            db.execute("INSERT INTO binary_variant(variant_id,game,label,provenance,packed_path,packed_sha256,"
                       "image_path,image_sha256,image_size) VALUES(?,?,?,?,?,?,?,?,?)",
                       ("v", "circuit", "fixture", "synthetic", str(packed), atlas.sha256_file(packed),
                        str(image_path), atlas.sha256_file(image_path), len(image)))
            db.execute("INSERT INTO target(target_id,game,video,oracle_variant_id) VALUES(?,?,?,?)",
                       ("circuit_ega", "circuit", "ega", "v"))
            result = atlas.promote_recipe(db, self.recipe, root=self.root)
            self.assertTrue(result["accepted"], result)
            self.assertEqual(1, db.execute("SELECT count(*) FROM target_verification WHERE exact=1").fetchone()[0])
        finally:
            db.close()


if __name__ == "__main__":
    unittest.main()
