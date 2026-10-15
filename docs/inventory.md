# Function inventory and correspondence map

`tools/inventory.py` indexes the five preferred, pinned DOS load images into
`analysis/inventory/<target>.json` and `analysis/inventory/groups.json`. It uses
the tracked census, the ignored oracle images and metadata, the optional Ghidra
CSV inventories under `work/census/ghidra/`, and the Stunts cross-reference under
`work/workers/stunts-xref/matches.json`. The latter two are research inputs, not
source oracles. The generator checks every image against its pinned metadata
digest. Run it with the workspace Python:

```powershell
& 'C:\Users\jiriv\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools/inventory.py
```

Each row has a stable target and start-offset ID, an exclusive end, a code
segment base, return kind, classification and confidence. `boundary_evidence`
names the supporting census and Ghidra extents, direct callers, relocation-backed
far transfers and pointers, a linear return, or a low-confidence prologue scan.
The code segment base is a load-image linear location derived from a segment
value, not a DOS runtime load address. The original relocation list is read in
order; duplicate entries remain separate evidence sites with their ordinals.
The per-target metadata records far-call code segment bases and all candidate
startup `mov ax, seg DGROUP` loads. The selected DGROUP base is the most repeated
relocated segment value followed by `mov ds,ax`; this selection remains a
heuristic. An early Cycles AX load uses a different segment, and its evidence is
retained rather than silently folded into DGROUP.

The runtime marker is the first `Microsoft C` byte marker, a census scope
boundary rather than a proven start of CRT code. Runtime classification requires
overlap with an exact member fingerprint from `analysis/runtime_libraries.json`
or a runtime-attributed Stunts match. A pre-marker candidate is classified as
game/engine only heuristically. `hand asm` is inferred from a Stunts recipe
match, and does not establish GP source provenance. The promoted decimal leaf
alone gets high boundary confidence from the independent direct-call, Ghidra,
and strict maintained-source evidence. Other boundaries remain candidates.

The groups use whole-extent exact, relocation-masked, and operand-normalized
instruction signatures. A skeleton may gain a call-graph anchor when a caller
or callee pair already has a stronger byte match. Equal absolute data references
and printable NUL-terminated DGROUP strings reached through absolute offsets
are additional anchors. These string references remain heuristic because a
numeric operand can resemble a data offset. Each group has at most one function per target; `grp_` names
are stable hashes of member IDs. Only `format_u8_decimal3` has a descriptive
reconstruction name backed by strict five-target source promotion. The groups
are correspondence leads, not statements of historical shared source.

| Target | Candidates | Game/engine | MSC runtime | Hand asm | Data/unknown | High / medium / low | Bytes in non-overlapping rows | DGROUP base | Relocated code bases |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Circuit EGA | 372 | 334 | 15 | 0 | 23 | 1 / 166 / 205 | 45,166 | `0x108F0` | 2 |
| Circuit CGA | 360 | 326 | 15 | 0 | 19 | 1 / 175 / 184 | 41,333 | `0xE460` | 2 |
| Cycles EGA | 500 | 411 | 18 | 12 | 59 | 1 / 222 / 277 | 57,866 | `0x15990` | 22 |
| Cycles CGA | 487 | 412 | 18 | 12 | 45 | 1 / 224 / 262 | 57,179 | `0x133B0` | 22 |
| Cycles Tandy | 484 | 412 | 19 | 12 | 41 | 1 / 227 / 256 | 54,265 | `0x12D90` | 23 |

There are 401 groups: 81 exact, 2 relocation-masked, 202 operand-normalized
skeleton, and 116 call-graph-anchored. These counts depend on Ghidra and Stunts
research inputs at their current locations. The inventory covers only candidate
extents, and unknown returns and indirect dispatch remain unresolved. A
prologue can occur in embedded data; a byte-identical region can sit inside a
larger routine. Function source acceptance remains in the independent promotion
ledger and cannot be inferred from any inventory group.

`tools/context.py TARGET OFFSET --inventory` includes the row and its group in
the normal context output. `tools/validate.py` regenerates the six JSON files
under ignored `work/validation/inventory/` and compares them to the tracked
copies; it never rewrites tracked evidence. Rerun the generator explicitly only
when changing the inventory method or inputs, then review the resulting diff.
