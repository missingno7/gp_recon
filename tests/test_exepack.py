import json
import struct
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from exepack.mz import parse_mz, unpack, analytical_mz, sha256, relocations_hash


class ExecutableTests(unittest.TestCase):
    def test_all_pinned_oracles_and_analytical_containers(self):
        manifest = json.loads((ROOT / "analysis/manifest.json").read_text())
        for v in manifest["variants"]:
            with self.subTest(variant=v["id"]):
                raw = (ROOT / v["path"]).read_bytes()
                self.assertEqual(sha256(raw), v["source_sha256"])
                mz = parse_mz(raw)
                if v["compression"] == "EXEPACK":
                    img, relocs, _ = unpack(mz)
                else:
                    img, relocs = mz.image, mz.relocations
                self.assertEqual(sha256(img), v["image_sha256"])
                self.assertEqual(relocations_hash(relocs), v["relocations_sha256"])
                rebuilt = analytical_mz(img, relocs, v["entry"], v["stack"],
                                         dict(mz.header, packed_image_size=len(mz.image)))
                parsed = parse_mz(rebuilt)
                self.assertEqual(parsed.image, img)
                self.assertEqual(parsed.relocations, relocs)

    def test_page_aligned_mz_and_overlays(self):
        header = struct.pack("<14H", 0x5A4D, 0, 1, 0, 2, 0, 0xFFFF, 0, 0, 0, 0, 0, 28, 0)
        data = header + bytes(512 - len(header))
        mz = parse_mz(data + b"overlay")
        self.assertEqual(len(mz.image), 480)
        self.assertEqual(mz.overlay, b"overlay")

    def test_truncation_and_illegal_relocations_rejected(self):
        data = (ROOT / "assets/Cycles/CPC2001.DAT").read_bytes()
        for cut in (0, 27, 511, len(data) - 1):
            with self.assertRaises(ValueError):
                parse_mz(data[:cut])
        changed = bytearray(data)
        mz = parse_mz(data)
        # Unknown final command, after skipping paragraph padding.
        at = mz.header["cparhdr"] * 16 + mz.header["cs"] * 16 - 1
        while changed[at] == 0xFF:
            at -= 1
        changed[at] = 0x90
        with self.assertRaises(ValueError):
            unpack(parse_mz(changed))

    def test_gp1_relocation_multiplicity_is_not_normalized(self):
        m = json.loads((ROOT / "analysis/manifest.json").read_text())
        gp1 = next(v for v in m["variants"] if v["id"] == "cycles_ega_gp1")
        ex_ = next(v for v in m["variants"] if v["id"] == "cycles_ega_ex_")
        self.assertEqual(gp1["image_sha256"], ex_["image_sha256"])
        self.assertNotEqual(gp1["relocations_sha256"], ex_["relocations_sha256"])
        self.assertEqual(gp1["relocation_duplicate_count"], 1)


if __name__ == "__main__":
    unittest.main()
