# Initial reconstruction milestone — 15 October 2026

The verified binary baseline is established. The repository now has five target
identities, deterministic EXEPACK recovery, original-stub verification, an initial
cross-game atlas, historical compiler experiments and a transactional SQLite
promotion ledger. It does not yet produce a complete game from maintained source.

## What is proven

The manifest records 125 supplied files, 17 MZ executables and 12 game-executable
variants. The preferred Cycles EGA/CGA packed hashes match the user's canonical
identifiers. Every packed game variant independently reproduces its decoded
image, ordered relocation writes, original entry and stack when its original
EXEPACK code runs at two load addresses. Supplied unpacked EGA/Tandy files confirm
the recovered relocation locations. Analytical MZ containers are relocatable
derived artifacts; their headers are not claimed original linker output.

The observed EGA image patch counts are 12 bytes for `GPEGA.OLD`, 57 for
`GPEGA.EXE`, and five for each of `GP1.EXE` and `GPEGA.EX_`. The last two have
identical images but different relocation behavior: GP1 has a duplicated
relocation at linear offset 37008. CGA alternatives change 11 and four image
bytes; unpacked Tandy changes 11. Every changed image byte and small packed-file
change is recorded in [the patch ledger](../analysis/patches.json).

The supplied directories are merged extracted material. The original archive
containers and separate copies of common assets were absent, so claims about
archive membership, timestamps and identical assets between releases remain
unverified. Tandy's packed file is the provisional supplied baseline, not a
publisher-authenticity determination.

## Matching results

The census compares each image up to its own Microsoft runtime copyright marker.
These are deterministic byte-window measurements, including any runtime code
before that marker. They are not percentages of game source sharing. Different
anchor/variation thresholds explain differences from the preliminary figures.

| Pair | Exact high-variation bytes | Relocation-masked bytes |
|---|---:|---:|
| Circuit EGA / Cycles EGA | 12603 | 12678 |
| Circuit CGA / Cycles CGA | 5889 | 5965 |
| Circuit EGA / Circuit CGA | 12393 | 12495 |
| Cycles EGA / Cycles CGA | 24990 | 26037 |
| Cycles EGA / Cycles Tandy | 25243 | 26979 |
| Cycles CGA / Cycles Tandy | 29700 | 29960 |

The current atlas records 4460 heuristic segment-aware function candidates across
all 12 variants, including 1758 in the five preferred images. Direct near and
far transfers are followed; indirect dispatch, copied code and embedded data
still need manual analysis. These counts are candidates, not recovered functions.
The optional Ghidra pass also produced inventories for all five preferred targets
under ignored `work/census/ghidra/`; it is an independent analysis aid, not an
acceptance oracle.

The 697-byte EGA span at Circuit `0xD347` and Cycles `0xB225` is exact. Its
instructions and adjacent port operations support an EGA raster interpretation.
It begins inside a larger path; the surrounding functions continue differently
and return near versus far. It is not promoted as a standalone function.

A complete 36-byte shared leaf is now reconstructed from maintained assembly
and strictly matches **all five targets**. It formats `AL` into three decimal
digits plus NUL, including leading zeroes; it discards the high byte of `AX`.
Direct call references establish its entry independently in each game. The
public name `_format_u8_decimal3` is a descriptive reconstruction name, not a
recovered original symbol. See [behavior and caller evidence](decimal.md),
[fresh build evidence](../analysis/compiler/decimal_proof.json), and
[five-target promotion](../analysis/matching/decimal_promotion.json).

The first display-source proof freshly assembles 106 bytes from maintained
instruction-level source into all three Cycles display images: EGA `0x123E`,
CGA `0x113E`, and Tandy `0x1133`. Byte equality is verified; incoming references
and in-use helper attribution remain provisional. MASM 5.10 is a pinned
reproduction tool, not an attribution of DSI's original assembler. See the
[source receipt](../analysis/compiler/proof.json) and independent per-target
[promotion receipt](../analysis/matching/initial_promotion.json).

| Target | Strict maintained-source coverage | Contributions |
|---|---:|---|
| circuit_ega | 36 bytes | Decimal leaf |
| circuit_cga | 36 bytes | Decimal leaf |
| cycles_ega | 142 bytes | Decimal leaf + display region |
| cycles_cga | 142 bytes | Decimal leaf + display region |
| cycles_tandy | 142 bytes | Decimal leaf + display region |

These are independently verified, non-overlapping byte ranges, not source
percentages or a claim that their surrounding modules are reconstructed.

## Toolchain and structures

Fresh Microsoft C 5.10 probes under `C:/tools/nmlgcdos/msdos.exe` demonstrate
54-byte unoptimized near code, 32-byte optimized near code, and 32-byte optimized
far code for the same C input. Exact pass hashes, flags, instructions and objects
are recorded in [the C experiment](../analysis/compiler/c_pilot.json).

Runtime-library comparisons give MSC 5.00/5.10 stronger shared `STDARGV`
fingerprints than the tested 6.00 libraries. Additional Cycles `fseek`, `_open`
and `fread` matches favor the 5.10 runtime family. Circuit's strongest evidence
leaves 5.00 and 5.10 tied. A program can use library code without proving which
compiler built every module; exact compiler versions, flags, memory models and
mixed-version use remain unresolved. [Runtime evidence](runtime.md) is kept
separate from game-developed source coverage.

The complete 444-byte default vehicle arrays from a pinned CyclesMod reference
match both Circuit image locations and Cycles' `BIKES.INF`. Record boundaries
and field semantics remain hypotheses until executable usage is traced; no
speculative shared C structures were introduced.

## Acceptance and remaining work

`tools/validate.py` regenerates private images without changing the manifest,
executes the original unpacker, checks all tests and metadata, reruns compiler
experiments, rebuilds a fresh SQLite ledger, and invokes pinned fresh-source
builders through promotion. A registered oracle-extracted blob or worker Boolean
cannot count as a source promotion. Leases use transactions and fencing tokens;
ordered relocation multiplicity, receipts and regression history are preserved.

Strict function/region bytes and their local relocation conditions are the
current acceptance scope. Original object-file equality, natural linker layout,
linked load-image equality, whole-executable equality and exact repacking remain
unachieved independent gates. No gameplay or SDL implementation was added.

The final validation passed from a clean Git index export under ignored
`work/CLEAN/`, with private supplied assets copied in and all oracles, objects
and the validation ledger generated from scratch. All 26 tests passed. The
check repeated 18 original-stub executions, the runtime-library comparison,
three fresh Microsoft C profiles, six census comparisons and both fresh MASM
source promotions. Both source recipes have zero original relocation words
intersecting their verified ranges. Every validated historical build used
`C:/tools/nmlgcdos/msdos.exe`.

Next work should focus on these bounded clusters:

1. Trace and reconstruct complete callers and sibling routines around the small
   decimal formatter, preserving its observed byte input and terminated output.
2. Map the enclosing EGA raster routines around the 697- and 654-byte exact
   regions, their stack locals, near/far wrappers and stride state. Shared source
   boundaries must come from those callers and modules, not match-window limits.
3. Identify resource-loader/decompressor entry points using the now-verified
   images and PES research, then triangulate the same operation in Circuit and
   Cycles. Keep library I/O wrappers separate from resource-format logic.
4. Compile bounded C candidates with the now-reproducible 5.00/5.10 hypotheses,
   test runtime and calling conventions, and expand per-target strict coverage.

The baseline and initial source contributions are concrete. Full function
classification, original C recovery and shared historical module architecture
remain the main reconstruction work.
