"""Every tracked binding must be a well-formed address and respect DGROUP evidence."""
import json
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from tools.matching import pipeline  # noqa: E402


class BindingFileTests(unittest.TestCase):
    def test_all_bindings_parse_and_fit_images(self):
        for target in pipeline.TARGETS:
            symbols = pipeline.binding_file(target)  # also checks DGROUP members
            size = len((ROOT / "work/oracles" / target / "image.bin").read_bytes()) \
                if (ROOT / "work/oracles" / target / "image.bin").is_file() else None
            for name, row in symbols.items():
                with self.subTest(target=target, symbol=name):
                    linear, _ = pipeline.address(row)
                    self.assertGreaterEqual(linear, 0)
                    if size is not None:
                        # Uninitialized DGROUP data (BSS) lies beyond the load image.
                        dgroup = json.loads((ROOT / "analysis/inventory" / f"{target}.json")
                                            .read_text(encoding="utf-8"))["dgroup_base"]
                        self.assertLess(linear, max(size, dgroup + 0x10000))

    def test_out_of_range_segment_offset_rejected(self):
        for bad in ("15990:070C", "0000:14CE6"):
            with self.assertRaises(ValueError):
                pipeline.address(bad)


if __name__ == "__main__":
    unittest.main()
