import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools/compiler"))
from build_proof import omf_public_code  # noqa: E402


def record(kind: int, payload: bytes) -> bytes:
    length = len(payload) + 1
    header = bytes((kind, length & 0xFF, length >> 8))
    checksum = (-sum(header + payload)) & 0xFF
    return header + payload + bytes((checksum,))


def object_bytes(*, gap: bool = False, fixup: bool = False) -> bytes:
    code = bytes([0x90]) * 105 + bytes([0xCB])
    records = [
        record(0x80, b"\x08EGACOPY.ASM"),
        record(0x96, b"\x05_TEXT\x04CODE"),
        record(0x98, b"\x48\x6a\x00\x01\x02"),
        record(0x90, b"\x00\x01\x10_ega_copy_planes\x00\x00\x00"),
    ]
    if gap:
        records.extend((
            record(0xA0, b"\x01\x00\x00" + code[:53]),
            record(0xA0, b"\x01\x36\x00" + code[53:]),
        ))
    else:
        records.append(record(0xA0, b"\x01\x00\x00" + code))
    if fixup:
        records.append(record(0x9C, b"\x00"))
    records.append(record(0x8A, b"\x00"))
    return b"".join(records)


class OmfProofTests(unittest.TestCase):
    def parse(self, data: bytes) -> tuple[str, int, bytes]:
        path = Path(__file__).resolve().parents[1] / "work/compiler/omf-test.obj"
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        try:
            return omf_public_code(path, "_ega_copy_planes")
        finally:
            path.unlink(missing_ok=True)

    def test_extracts_public_far_function(self) -> None:
        segment, offset, code = self.parse(object_bytes())
        self.assertEqual((segment, offset, len(code)), ("_TEXT", 0, 106))
        self.assertEqual(code[-1], 0xCB)

    def test_rejects_corrupt_record_checksum(self) -> None:
        data = bytearray(object_bytes())
        data[10] ^= 1
        with self.assertRaisesRegex(ValueError, "checksum"):
            self.parse(bytes(data))

    def test_rejects_noncontiguous_code(self) -> None:
        with self.assertRaisesRegex(ValueError, "noncontiguous"):
            self.parse(object_bytes(gap=True))

    def test_rejects_fixup_records(self) -> None:
        with self.assertRaisesRegex(ValueError, "fixup"):
            self.parse(object_bytes(fixup=True))


if __name__ == "__main__":
    unittest.main()
