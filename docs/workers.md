# Worker coordination and strict promotions

`tools/matching/atlas.py` keeps immutable binary evidence apart from active reconstruction state. The default database is `work/atlas-v2.sqlite` (ignored/generated); `tools/matching/schema.sql` defines its tables. Manifest import reads each `work/oracles/<variant>/metadata.json` relocation list as an ordered stream. It validates the manifest's `relocations_sha256` against the raw little-endian unsigned 32-bit stream, checks duplicate counts, and validates the legacy sorted-entry digest. It stores every linear offset with its ordinal, including duplicates, and records separate SHA-256 digests for ordered entries, the duplicate-preserving multiset, and the distinct set. The receipt carries the pinned oracle's three relocation digests and both entry/distinct counts, so a set comparison cannot hide a duplicate or order change. In the current manifest, `cycles_ega_gp1` has 1,202 relocation entries but 1,201 distinct locations; all 1,202 rows remain in `binary_relocation`.

```powershell
python tools/matching/atlas.py init
python tools/matching/atlas.py import-manifest
python tools/matching/atlas.py import-census
python tools/matching/atlas.py export --output analysis/atlas-export.json
python tools/matching/promote_initial.py --record
python tools/matching/promote_decimal.py --record
```

The exporter emits deterministic JSON in stable table/key order. It omits worker leases, whose expiry is runtime state. The SQLite file remains the writable authority; keep generated exports disposable and reviewable.

The census importer is idempotent for unchanged inputs. It records heuristic function candidates, pairwise byte-region matches, known/reported regions, and pair-level exploratory coverage in separate tables. Candidate rows retain their boundary status and confidence as source evidence; they do not create verified `function_item` or `function_target` rows. `SHARED_EXACT` rows and `RELOCATION_MASKED` rows remain distinct in `region_match`. Revised analysis artifacts append snapshots keyed by their source SHA-256, preserving earlier evidence. Manifest import verifies the actual supplied executable and image hashes; promotion rechecks the executable hash for every applicable target.

The explicit `promote_initial.py --record` command seeds the first source candidate and writes the tracked [initial promotion receipt](../analysis/matching/initial_promotion.json). It records `ega_copy_planes` as `VIDEO_SPECIFIC` across Cycles EGA, CGA, and Tandy. All three 106-byte ranges are freshly assembled and byte-exact; the source boundary remains provisional because direct or relocated incoming-reference evidence has not yet been established. Those are separate claims in the receipt and atlas evidence.

The explicit `promote_decimal.py --record` command writes the tracked [decimal promotion receipt](../analysis/matching/decimal_promotion.json). `format_u8_decimal3` has a 36-byte, near-return boundary with direct callers in Circuit EGA/CGA and Cycles EGA/CGA/Tandy. The fresh MASM output is byte-exact at all five ranges. Its behavior uses AL for three decimal digits and writes a NUL at BX+3; it discards AH. The equivalence group is `SHARED_EXACT` across games.

Useful read-only queries include:

```sql
SELECT boundary_status, boundary_confidence, count(*)
FROM function_candidate GROUP BY boundary_status, boundary_confidence;

SELECT match_type, count(*)
FROM region_match GROUP BY match_type;
```

## Claim and work

Workers claim a bounded scope such as `cluster:ega-blitters` using `claim(db, scope, worker, ttl_seconds)`. The claim is a short transaction using `BEGIN IMMEDIATE`; one live lease can hold a scope, expired leases can be reclaimed, and each claim has a random fencing token. Renew and release operations require that token and reject expired ownership. A worker should register source and output files through `record_candidate` and `record_output`, which calculate their hashes, then release its lease. Keep individual compiler runs in `compiler_experiment` with compiler/version, flags, input/output digests and result.

The Python API is intentionally small:

```python
from tools.matching import atlas

atlas.initialize()
db = atlas.connect()
token = atlas.claim(db, "cluster:ega-blitters", "worker-07", ttl_seconds=1800)
if token is not None:
    # Work in an isolated checkout, then register one candidate per function.
    atlas.record_candidate(db, candidate_id="ega-blit-c1", function_id="blit_042",
                           source_path="src/engine/ega_blit.c", worker="worker-07")
    atlas.record_output(db, "ega-blit-c1", "circuit_ega", "work/candidates/blit042-circuit.bin")
    receipt = atlas.promote(db, "ega-blit-c1")
    atlas.release_lease(db, token)
db.close()
```

For a function used by several targets, register one output for every `function_target` row before calling `promote`. A cluster lease can cover a few related functions, while each function still receives an independent receipt. The two initial MASM builders retain their exact source-path/hash allow-list in `atlas.py`. New C or MASM candidates use tracked `analysis/recipes/<id>.json` files and `tools/promote.py <id>`.

Use function clusters when evidence links functions, but keep a separate `function_target` row for each actual target range. A shared source candidate still receives an independent oracle comparison in every applicable target. Do not report masked or semantic matching as strict byte equivalence.

## Promotion

`promote(db, candidate_id, root=...)` invokes the trusted fresh MASM recipe selected by the candidate's exact source path and hash. It re-reads the registered source and output files, checks their recorded hashes, verifies the fresh object digest and extracted function-byte digest, then reads each pinned oracle load image and compares those freshly built function bytes and registered outputs with the target's exact function range. Each target must also have a matching fresh-build proof row for its pinned image digest, offset, and length. The receipt stores the builder proof and per-target results. It records that the OMF object is fixup-free and checks that no oracle relocation entry intersects the promoted function range. An oracle-extracted blob, caller-supplied proof, or Boolean `exact` result cannot promote source. Missing builder coverage, changed evidence, mismatch, relocation intersection, or regression leaves a rejected receipt. This verifies code bytes and their load-image ranges; it does not claim linked-image or runtime validation.

`gates_by_target` is retained as descriptive worker input only. Caller-provided Boolean gates do not count as independent evidence; currently only checks produced by the fresh builder are eligible to affect strict promotion. Failed promotion attempts stay in history, and a candidate is accepted only when every target mapped to its function is covered by fresh build evidence and matches.

The database deliberately does not schedule agents, interpret source control, or decide which functions are equivalent. Keep workers isolated at the source-control/worktree layer and use leases only to prevent duplicated atlas ownership.

## Daily candidate search and fixups

Run `tools/context.py <target> <offset-or-name>` before choosing a range. `--list '*pattern*'` lists names from reviewed recipes and the reconstruction shortlist. Context marks relocation words in disassembly and shows direct transfer and absolute data-reference leads. The census boundary is heuristic; confirm function entry and return before writing a recipe.

Run `tools/search.py <source.c|source.asm> --target <target> --range <start>:<end> --public <symbol> [--profile <name>]`, repeating target and range together for a shared candidate. It verifies SHA-256-pinned compiler files, runs only `C:/tools/nmlgcdos/msdos.exe`, reads 16-bit OMF records including FIXUPP threads and iterated data, and stores the scratch object and JSON report under ignored `work/search/`. The report separates non-fixup byte equality from strict linker-equivalent equality, lists each fixup kind and target, reports unbound symbols, and shows the first instruction divergences. A compiler failure is a search result, never an accepted match.

Bindings are per preferred target under `analysis/bindings/<target>.json`; each symbol address must carry provenance and confidence notes. A `segment:offset` address uses hexadecimal DOS notation; a linear integer is also accepted. Strict checking computes each linked fixup word from that binding, compares it with the unmasked oracle bytes, and requires every oracle relocation word inside the range to correspond to exactly one segment-base or far-pointer fixup. Relocation rows are compared with multiplicity; a duplicate or unexplained word rejects strict acceptance. Unbound symbols leave a result explicitly non-strict.

`tools/promote.py <recipe-id>` freshly rebuilds a tracked recipe into a new candidate and writes a SQLite receipt with independent target verification rows. The fresh object's fixups must equal `expected_fixups` exactly. A generated object, registered blob, report Boolean or masked comparison cannot stand in for that build. `tools/validate.py` replays all recipes in `analysis/recipes/` and compares the legacy receipts with their tracked copies; it writes only under `work/`.

The legacy MASM builders also pin a transcript hash containing MASM's free-symbol-space count. The atlas invokes them with a fixed DOS process environment size, reproducing their tracked 42,994/42,972-byte counts while checking the newly assembled object and every target range. This environment input does not change the stored proof or receipts.
