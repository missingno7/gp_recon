# Shared decimal field formatter

`src/engine/format/decimal_ascii4.asm` reconstructs the 36-byte near routine
at these load-image offsets:

| Target | Offset | Call references |
| --- | ---: | --- |
| Circuit EGA | `0x5704` | `0x5ABD` |
| Circuit CGA | `0x55BA` | `0x5973` |
| Cycles EGA | `0x1D68` | `0x1E0E`, `0x1E57` |
| Cycles CGA | `0x1C46` | `0x1CEC`, `0x1D35` |
| Cycles Tandy | `0x1C3C` | `0x1CE2`, `0x1D2B` |

The candidate has the same 36 bytes in all five pinned images. Its start is an
incoming near-call target in each image, and linear decoding reaches a near
`RET` at byte 36. The inventory also identifies a 36-byte function at these
addresses. This supports a callable leaf boundary independently of the
byte-window match.

The routine receives the value in `AL` and the output offset in `BX`, using
`DS` for memory. It writes three decimal ASCII digits with leading zeroes,
then a NUL byte. It leaves `BX` unchanged and changes `AX`, `CL`, and flags.
Each `DIV CL` divides the current unsigned `AX` by ten and takes the remainder
from `AH`; the initial `XOR AH,AH` makes the input exactly the unsigned byte in
`AL`. Thus `AX=255` produces `255\0`, `AX=256` produces `000\0`, and
`AX=10000` produces `016\0`. Values above 255 use their low byte, including
values above 9999. This is the observed behavior, even though the candidate
name `decimal_ascii4` can be read as “four digits”; it refers to a four-byte
field.

The nearby callers contain direct near calls to the candidate. At Circuit EGA
`0x5AB5`, the caller sets `BX=0x0A0A`, clears `AH`, loads `AL` from
`DS:[0x5EEF]` and calls `0x5704` directly, with no stack arguments. The earlier
two pushes and stack cleanup belong to a separate call to `0x8C84`.
The same function bytes and independent
call references appear in both games. This is strong evidence for a shared
game-code leaf, while original source-file and toolchain provenance remain
unproven.

## Fresh strict build

`tools/compiler/build_decimal.py` copies the maintained assembly to the 8.3
name `DEC4.ASM`, assembles it with the pinned Microsoft MASM 5.10 executable
through `C:/tools/nmlgcdos/msdos.exe`, extracts the public OMF code, and checks
all five complete 36-byte image ranges. It also checks each full image against
`analysis/manifest.json`. The compiler output is `work/compiler/DEC4.OBJ`; the
default generated receipt is under `work/compiler/`.

The tracked receipt records the source, assembler and player hashes, OMF
object and function bytes, each oracle image hash, and each exact match. It is
independent of source-binary provenance: MASM 5.10 is the verified assembler
for this reconstruction, not a claim about the original build system.

After an intentional first build, `--record` writes
`analysis/compiler/decimal_proof.json` and pins the builder script in
`analysis/compiler/decimal_build.sha256`. Routine checks use `--check`, which
performs a fresh assembly and compares the complete receipt without updating
tracked evidence:

```powershell
python tools/compiler/build_decimal.py --check
```

The semantic test executes the receipt's extracted instruction bytes in a
small 8086 subset interpreter and checks all 256 possible `AL` inputs at
several `AH` values. It covers values above 9999 and verifies the NUL byte and
register behavior.
