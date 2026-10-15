"""Checks for inventory provenance, anchor boundaries, and reproducibility."""
from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from tools.inventory import TARGETS, binding_evidence, decoder, direct  # noqa: E402


class InventoryTests(unittest.TestCase):
    def test_far_transfer_uses_relocated_segment_word(self):
        image = bytes.fromhex("9a34127856")
        ins = next(decoder().disasm(image, 0))
        self.assertEqual(direct(ins, 0, image, {3}), (0x5678 * 16 + 0x1234, "far", 3))
        self.assertIsNone(direct(ins, 0, image, set()))
        code, _, _ = binding_evidence(image + b"\0" * 400000, [3, 3], decoder())
        self.assertEqual([x["segment_word_relocation_ordinal"] for x in code[0x56780]], [0, 1])

    def test_decimal_anchor_and_group(self):
        anchors = dict(zip(TARGETS, (0x5704, 0x55BA, 0x1D68, 0x1C46, 0x1C3C)))
        for target, at in anchors.items():
            doc = json.loads((ROOT / "analysis/inventory" / f"{target}.json").read_text())
            rows = [r for r in doc["functions"] if r["start"] == at]
            self.assertEqual(len(rows), 1)
            self.assertEqual((rows[0]["end"], rows[0]["return_kind"], rows[0]["confidence"]),
                             (at + 36, "near", "high"))
            self.assertGreaterEqual(doc["relocation_count_ordered"], doc["relocation_count_distinct"])
            self.assertIsNotNone(doc["dgroup_base"])
        groups = json.loads((ROOT / "analysis/inventory/groups.json").read_text())["groups"]
        group = next(g for g in groups if g["id"] == "format_u8_decimal3")
        self.assertEqual(len(group["members"]), 5)
        self.assertEqual(group["kind"], "exact")

    def test_groups_have_unique_targets(self):
        groups = json.loads((ROOT / "analysis/inventory/groups.json").read_text())["groups"]
        for group in groups:
            targets = [next(t for t in TARGETS if m.startswith(t + "_")) for m in group["members"]]
            self.assertEqual(len(targets), len(set(targets)), group["id"])

    def test_deterministic_regeneration(self):
        with tempfile.TemporaryDirectory(dir=ROOT / "work") as scratch:
            out = Path(scratch)
            for run in range(2):
                dest = out / str(run)
                subprocess.run([sys.executable, str(ROOT / "tools/inventory.py"), "--output", str(dest)],
                               cwd=ROOT, check=True, capture_output=True)
            for file in (out / "0").iterdir():
                self.assertEqual(file.read_bytes(), (out / "1" / file.name).read_bytes())


if __name__ == "__main__":
    unittest.main()
