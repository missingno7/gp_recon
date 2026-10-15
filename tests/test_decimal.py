import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]


def execute_decimal(code: bytes, ax: int, bx: int = 0x3000, cx: int = 0xA55A):
    """Execute the emitted routine's small documented 8086 instruction set."""
    original_bx = bx
    memory: dict[int, int] = {}
    pc = 0
    while pc < len(code):
        op = code[pc]
        pc += 1
        if op == 0xC6:  # MOV byte ptr [BX+disp8],imm8
            if code[pc] != 0x47:
                raise AssertionError("unsupported C6 addressing mode")
            disp, value = code[pc + 1], code[pc + 2]
            pc += 3
            memory[(bx + disp) & 0xFFFF] = value
        elif op == 0xB1:  # MOV CL,imm8
            cx = (cx & 0xFF00) | code[pc]
            pc += 1
        elif op == 0x32:  # XOR AH,AH
            if code[pc] != 0xE4:
                raise AssertionError("unsupported XOR form")
            ax &= 0x00FF
            pc += 1
        elif op == 0xF6:  # DIV CL
            if code[pc] != 0xF1:
                raise AssertionError("unsupported F6 group operation")
            divisor = cx & 0xFF
            quotient, remainder = divmod(ax, divisor)
            if quotient > 0xFF:
                raise AssertionError("8086 divide overflow")
            ax = (remainder << 8) | quotient
            pc += 1
        elif op == 0x80:  # ADD AH,imm8
            if code[pc] != 0xC4:
                raise AssertionError("unsupported 80 group operation")
            ah = ((ax >> 8) + code[pc + 1]) & 0xFF
            ax = (ah << 8) | (ax & 0xFF)
            pc += 2
        elif op == 0x88:  # MOV [BX+disp8],AH or MOV [BX],AH
            modrm = code[pc]
            pc += 1
            if modrm == 0x67:
                disp = code[pc]
                pc += 1
            elif modrm == 0x27:
                disp = 0
            else:
                raise AssertionError("unsupported MOV addressing mode")
            memory[(bx + disp) & 0xFFFF] = ax >> 8
        elif op == 0xC3:  # RET
            if pc != len(code):
                raise AssertionError("bytes follow near RET")
            break
        else:
            raise AssertionError(f"unsupported opcode {op:#04x} at {pc - 1:#x}")
    else:
        raise AssertionError("routine has no near RET")
    output = bytes(memory.get((original_bx + i) & 0xFFFF, 0xCC) for i in range(4))
    return output, ax, cx, bx


class DecimalFormatterTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        receipt = json.loads((ROOT / "analysis/compiler/decimal_proof.json").read_text(encoding="utf-8"))
        cls.code = bytes.fromhex(receipt["object"]["function_bytes_hex"])

    def test_all_byte_inputs_ignore_ax_high_byte_and_nul_terminate(self) -> None:
        for value in range(256):
            for high in (0x00, 0x01, 0x7F, 0xFF):
                with self.subTest(value=value, high=high):
                    output, _, cx, bx = execute_decimal(self.code, (high << 8) | value)
                    self.assertEqual(output, f"{value:03d}".encode("ascii") + b"\0")
                    self.assertEqual(cx, 0xA50A)
                    self.assertEqual(bx, 0x3000)

    def test_values_above_9999_use_only_low_byte(self) -> None:
        for value in (9999, 10000, 0xFFFF):
            with self.subTest(value=value):
                output, _, _, _ = execute_decimal(self.code, value)
                low_byte = value & 0xFF
                self.assertEqual(output, f"{low_byte:03d}".encode("ascii") + b"\0")


if __name__ == "__main__":
    unittest.main()
