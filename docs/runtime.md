# Runtime-library fingerprint experiment

This experiment compares the five pinned, headerless and unrelocated load
images with code stored in the installed Microsoft C 5.00, 5.10, and 6.00 OMF runtime libraries. It gives
runtime-byte evidence. It does not identify the compiler, compiler switches,
or full game source.

The scanner reads OMF library members in place and extracts `LEDATA` chunks
whose segment name or class is `CODE`, `_TEXT`, or `TEXT`. It samples 32-byte
windows every four bytes, keeping windows with at least 12 distinct byte
values and Shannon entropy of at least 3.2 bits per byte. Each exact hit is
extended in both directions to record the longest contiguous match. Searches
cover each pinned `image.bin`; the MZ header and applied relocations are absent.
The scanner checks each oracle digest against its canonical manifest entry.
Fixup bytes can interrupt a match, and a
member match can be common runtime code or coincidental. No libraries were
copied into the repository.

## Result

The clearest shared fingerprint is the startup argument routine `STDARGV`.
MSC 5.00 and 5.10 each provide exact `STDARGV` runs of up to 136 bytes in
every target; MSC 6.00 reaches 128 bytes. Four alternative memory-model libraries in each
release also contain shorter `STDARGV` hits in those same images. This ranks
the 5.00/5.10 runtime code ahead of the tested 6.00 code, but the common
`STDARGV` evidence does not distinguish 5.00 from 5.10.

| Pinned target | MSC 5.00 strongest `STDARGV` hit | MSC 5.10 strongest `STDARGV` hit | MSC 6.00 strongest `STDARGV` hit |
| --- | ---: | ---: | ---: |
| `circuit_ega` | 52 windows / 136 bytes | 52 / 136 | 46 / 128 |
| `circuit_cga` | 52 / 136 | 52 / 136 | 46 / 128 |
| `cycles_ega` | 52 / 136 | 52 / 136 | 46 / 128 |
| `cycles_cga` | 52 / 136 | 52 / 136 | 46 / 128 |
| `cycles_tandy` | 52 / 136 | 52 / 136 | 46 / 128 |

The 5.10 libraries provide additional evidence for the three `Cycles` images:
`fseek.c` in `MLIBCR.LIB` has 53 matching windows and a 108-byte exact run;
`_open.c` has a 163-byte exact run; and `fread.c` has a 58-byte exact run.
Those members make 5.10 the better-supported runtime family for `Cycles` in
this comparison. They still do not prove that 5.10 compiled the games. The
`Circuit` evidence leaves 5.00 and 5.10 tied on the strongest shared routine.

The hit totals in the JSON are counts across the four alternative memory-model
libraries for a release. They do not mean four copies of a member occur in a
game executable. The shortlist also reports which library file supplied the
candidate, its exact-run length, and the pinned-image offset.

## Provenance and rerun

The machine-readable report records pinned image SHA-256 values, hashes for
the scanned libraries, hashes for the available compiler and linker
executables, and toolchain `provenance.json` hashes where present. MSC 6.00's
installed directory has no `provenance.json`; its files are identified by
path and digest only. Version labels come from the installed tool directories.

No compiler was executed for this experiment. To reproduce and check the scan, run
`python tools/research/runtime_libraries.py --check`. Fresh output goes under
ignored `work/research/`; the tracked evidence is never rewritten by a check.
The report is [runtime_libraries.json](../analysis/runtime_libraries.json),
and the scanner is [runtime_libraries.py](../tools/research/runtime_libraries.py).
