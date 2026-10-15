# Cross-game census

The census is a first-pass atlas of executable-image relationships. It consumes
the canonical unpacked images and relocation lists under
`work/oracles/<target>/image.bin` and `metadata.json` and writes reproducible
summaries under `analysis/census/`.

Run it with the workspace Python and the Capstone package from `C:\tools`:

```powershell
& 'C:\Users\jiriv\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools/census/analyze.py
```

The script hashes each image, records its image size, runtime boundary, and
relocation count, then compares these target pairs:

* `circuit_ega` / `cycles_ega`
* `circuit_cga` / `cycles_cga`
* `circuit_ega` / `circuit_cga`
* `cycles_ega` / `cycles_cga`
* `cycles_ega` / `cycles_tandy`
* `cycles_cga` / `cycles_tandy`

Each side is limited independently to bytes before its runtime marker or
metadata-supplied `runtime_start`; a later runtime boundary in one executable
does not truncate the other executable's game-code range. A strict match compares image bytes as supplied. A
relocation-masked match zeroes each listed 16-bit relocation word before the
comparison. The reports use non-overlapping exact runs of at least 32 bytes
and retain runs containing at least ten distinct byte values and three bits
of Shannon entropy per byte. Exact runs are greedily selected by
longest length from shared high-variation 32-byte anchors, with overlaps
excluded on either image. These settings make the result a deterministic
reproduction of exploratory high-variation-byte coverage; it is not a function
match, a source-similarity percentage, or an exhaustive maximum
common-substring calculation.

`function_candidates.json` and `.csv` contain a conservative reachable-code
walk seeded from the executable entry point and direct near/far call targets.
Near transfers retain the current segment, and immediate far transfers use
their encoded segment:IP, normalized to offsets in the unrelocated load image.
Indirect calls/jumps, overlays, and code reached only through tables are not
resolved. A candidate follows reachable branches until decoded returns or
another known call target. This heuristic misses indirect transfers, overlays,
code reached through tables, and unusual control flow. It can also decode
embedded data as instructions. Therefore all
boundaries are explicitly marked heuristic and low confidence. Promote a
region to a function only after checking its incoming calls, outgoing calls,
return behavior, data references, and disassembly in context.

Match labels in `census.json` have distinct meanings:

* `SHARED_EXACT` means only that the reported byte ranges match exactly.
* A relocation-masked byte match is separately counted and does not imply
  instruction equivalence if relocation words overlap instruction operands.
* Source sharing, semantic equivalence, and function boundaries remain
  unproven until supported by disassembly and cross-variant control/data-flow
  evidence.
* Runtime-library attribution must be backed by runtime signatures or
  independent library identification; the pre-runtime boundary is a heuristic
  scope limit, not an attribution proof.

The known 697-byte EGA region at Circuit image `0xD347` and Cycles image
`0xB225` is specifically tracked in
`analysis/census/known_regions.json`. The byte count alone does not establish a
single function or shared source routine. Its entry/exit boundaries and
semantics must be verified against the generated disassembly and call sites.
Three reconstruction leads with target offsets, hashes, boundary evidence,
confidence, and follow-up actions are recorded in
`analysis/census/reconstruction_shortlist.json`. The 36-byte decimal formatter
is the strongest cross-game callable candidate; the two longer EGA matches
are graphics regions whose enclosing function boundaries still need work.
