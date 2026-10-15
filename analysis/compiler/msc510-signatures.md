# Microsoft C compiler signature probe

This records a toolchain experiment, not an attribution of the games' compiler.

## Reproduction

The installed `C:\tools\nmlgcdos\msdos.exe` MS-DOS Player launches 16-bit compiler tools. From the repository root, `tools/compiler/run_pilot.py --record` freshly builds three profiles in separate ignored work directories and writes the tracked receipt only because `--record` was explicit. Run `tools/compiler/run_pilot.py --check` to rebuild and compare with `analysis/compiler/c_pilot.json`; it writes its fresh receipt under `work/compiler/`. The workspace sandbox rejects the Player's process start, so run either command with the approved elevated process launch.

The compiler banner reports `Microsoft (R) C Optimizing Compiler Version 5.10`. The probe source SHA-256 is `8da4bb3d201f62577276e2050eba9d2d3487472d4bb0ecba0356ba18c1d83ef7`. The runner records hashes for CL.EXE and passes C1/C2/C3.EXE, plus the Player, in the receipt.

| Profile | Flags | OMF code bytes | Code SHA-256 | Procedure / return |
|---|---|---:|---|---|
| `msc510_od_as` | `/c /Fa /Od /AS` | 54 | `d9bee17116d48d47998199c4cc682712a5e579e34cf43d6f235004dbb5ecc648` | NEAR / `C3` |
| `msc510_ox_gs_as` | `/c /Fa /Ox /Gs /AS` | 32 | `7a301c8d272e4c8efad7e4c823d44b35e7f11484b19f5f13e471edf3ad1ba3c1` | NEAR / three `C3` returns |
| `msc510_ox_gs_am` | `/c /Fa /Ox /Gs /AM` | 32 | `8a1220d9ead0a66cc194bfc8311d41aec356266803e8d2a2f3963c07f2e6a14e` | FAR / three `CB` returns |

The full instruction listings, extracted object-code hex, symbol offsets, OMF/object hashes, compiler pass hashes, and return-opcode counts are in [the recorded C pilot](c_pilot.json). `/Ox /Gs` removes the `__chkstk` call and yields a compact BP-framed function with conditional returns. `/Od /AS` emits a longer BP/SI/DI-framed routine with a `__chkstk` call and jump-to-epilogue sequences. `/O1` is rejected by this compiler; `/Ox` is accepted.

The small-model `PROC NEAR` listing reads its first argument at `[bp+4]`; medium-model `PROC FAR` reads it at `[bp+6]`. The corresponding OMF code has `C3` near returns and `CB` far returns, respectively.

This verifies that the installed MSC 5.10 compiler runs and that model/optimization switches materially alter emitted code. The tiny probe is not a game routine and is not evidence that either game was built by MSC 5.10.

## Tool hashes

SHA-256 of the files used for the MSC 5.10 probe:

| File | SHA-256 |
|---|---|
| `CL.EXE` | `CAD40CEF732BEEA3455225FBD62286C664166DB7C3F87E2402E22B2E3F107771` |
| `C1.EXE` | `8D33C6D87AA74B042B7D7CB01A23241C4CC3B1B8B446B8F1548BD167E3C7BF62` |
| `C2.EXE` | `A513C98BC2CE11BD00901B560252B5727AB9B6BACD9319B9EABA08F9E314B99B` |
| `C3.EXE` | `C1269628534D5DEB48171BA9E42F761DCB1C28A0087C73780DB0EE2E4352E6FA` |
| `LINK.EXE` | `124A3C800EDC16B60F696D35A9DFEC798B68B78FE2CA90C5988EA76BDEAB1A8A` |
| `SLIBCR.LIB` | `CE2DC6D740AE477135E2D9F11802C2357914994835E82A165423B43CCD30728F` |
| `MLIBCR.LIB` | `A8C6BF65551559A795F3BDCEF3F70178086BF944296413716E48CBA95814B9CB` |
| `CLIBCR.LIB` | `ADEDEF4EA1DEEF051C56D9CF4863FCDC2A3722EDDC3602D0D73DF03B96D4ED0D` |
| `LLIBCR.LIB` | `7961EAFCE689DBF17ACC3FD6FE34BE6BC000F60D0F02FB1AF2602B09112F3D2E` |

The compiler's assembly listing and OMF object were kept under ignored `work/compiler/`; no game or compiler binaries are added to the repository.

## Current attribution status

MSC 5.10 is an experimentally verified candidate toolchain, not a proven match. We still need to compare a complete, game-developed routine against the original load images at object or function level, then check memory model, calling convention, optimization flags, and linker/runtime behavior. No compiler version or memory model has yet been established for either game.

Separately, [the MASM proof receipt](proof.json) records a fresh MASM 5.10 build of the 106-byte `_ega_copy_planes` routine in `src/engine/graphics/ega_copy_planes.asm`. Its extracted OMF public code is byte-exact at Cycles EGA `0x123E`, CGA `0x113E`, and Tandy `0x1133`; the identical function ends in `RETF`. The recipe rejects OMF fixups, pins the assembler and MS-DOS Player hashes, checks each canonical image against `analysis/manifest.json`, and runs with a DOS 8.3 scratch filename. Byte-level source equivalence is verified. Its identification as an in-use Cycles display helper remains provisional: no incoming far-call or far-pointer reference has been confirmed, so copied or unused support code remains possible. This assembly proof does not identify the game's C compiler.

The 697-byte EGA span at Circuit offset `0xD347` and Cycles offset `0xB225` is exactly identical (SHA-256 `ead77adc082043140bb26e7dc0d2a00d0b2062766d2a3799a58eceaab7515484`), but it is an internal raster-code region. It begins at an internal control-flow target, its final matched bytes branch backward, and the surrounding routines have differing structure/calling convention. It is evidence of shared EGA code, but is not a complete strict-C function candidate.
