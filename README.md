# Grand Prix Engine

Evidence-driven matching reconstruction of **Grand Prix Circuit (1988)** and
**The Cycles: International Grand Prix Racing (1989)**. The shared historical
architecture is being discovered from original DOS binaries. This repository
does not yet build either complete game.

Five independent target identities are fixed: `circuit_ega`, `circuit_cga`,
`cycles_ega`, `cycles_cga`, and `cycles_tandy`. Patched releases remain evidence
variants, never extra targets or replacements for preferred oracles.

## Reproduce the evidence

Keep the supplied extracted files in ignored `assets/Circuit/` and
`assets/Cycles/`. Their precise identities are locked in
[analysis/manifest.json](analysis/manifest.json). All executable images,
analytical MZ containers, compiler products, references and SQLite databases
remain under ignored `work/`. No original game assets or compiler binaries are
tracked.

Use Python 3.11+, `capstone==5.0.3`, and `unicorn==2.1.4`. Historical builds use
the hash-pinned local tools under `C:/tools` and
`C:/tools/nmlgcdos/msdos.exe`. The installed `python` Windows alias is unavailable
in this workspace; the bundled interpreter works:

```powershell
$gpPython = 'C:\Users\jiriv\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
& $gpPython tools/validate.py
```

The validator regenerates private images from supplied packed files, checks
the tracked manifest without rewriting it, runs the tests, executes the
original EXEPACK stub independently at two load addresses, reproduces the
census, checks vehicle data observations, and assembles the scoped source
proof freshly. It also repeats the three Microsoft C 5.10 pilot profiles and
the runtime-library comparison. A passing scoped proof does not claim linked-image, whole-game,
original-object-file or packed-output equality.

The compiler helper requires an approved process launch in the desktop sandbox;
MS-DOS Player can fail with a Windows DLL relocation error inside that sandbox.
Use `C:/tools/nmlgcdos`, as requested by the user. Do not substitute the unstable
`C:/tools/msdos` installation.

Individual commands are also available:

```powershell
& $gpPython tools/baseline.py --check
& $gpPython tools/exepack/verify_stub.py
& $gpPython tools/census/analyze.py --output work/census-refresh
& $gpPython tools/matching/atlas.py init
& $gpPython tools/matching/atlas.py import-manifest
& $gpPython tools/matching/atlas.py import-census
```

## Evidence and remaining work

- [Executable recovery and exact patch differences](docs/exepack.md)
- [Cross-game and cross-display census](docs/census.md)
- [Historical compiler experiments](docs/toolchain.md)
- [Independent runtime-library fingerprints](docs/runtime.md)
- [Shared formatter proved across all five targets](docs/decimal.md)
- [Structure leads checked against supplied data](docs/structures.md)
- [SQLite ownership and promotion workflow](docs/workers.md)
- [Workflow research references](docs/references.md)
- [Milestone status and next reconstruction clusters](docs/status.md)

Exact byte matches, relocation-masked comparisons, heuristic boundaries and
verified source matches are distinct states. Runtime reuse is tracked
separately from shared game code. Source attribution, original compiler versions
and memory models remain research questions until independently demonstrated.
