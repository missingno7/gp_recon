# Grand Prix Engine reconstruction

The user request is an evidence-driven matching reconstruction, not a rewrite.
Treat five DOS targets independently. Keep source-binary provenance separate
from oracle acceptance. Never update the canonical manifest as part of a check.

- Keep supplied games under ignored `assets/`; derived images, compiler products,
  full third-party references and SQLite databases belong under ignored `work/`.
- Use `C:/tools/nmlgcdos/msdos.exe` for historical compiler execution. The user
  reports `C:/tools/msdos` is unstable with compilers. Do not substitute it.
- Preserve ordered relocation entries, including duplicates. Linear locations
  compare representations; sets alone do not preserve DOS loader behavior.
- Shared byte regions are not automatically functions. Runtime matches are not
  evidence of shared game source. Mark heuristics and uncertainty explicitly.
- A strict promotion must freshly compile/assemble maintained source and compare
  its output to the pinned image, without masking mismatches. Track acceptance
  independently for every applicable target.
- Parallel workers may claim disjoint clusters using SQLite leases. Coordinate
  file ownership; only the parent integrates and commits a batch. Use independent
  workers for bounded searches, difficult analysis and review as appropriate.
- Run `tools/validate.py` before promoting or committing changes. It must not
  modify tracked evidence. No SDL or invented gameplay belongs in this milestone.
