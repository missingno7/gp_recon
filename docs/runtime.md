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

## Function-level attribution and maintained source

The follow-up [runtime_attribution.json](../analysis/runtime_attribution.json) maps
OMF member code runs to inventory extents for each target. It pins the
library SHA-256 and member header offset, records the run length and any
MSC 5.00 counterpart, and retains the inventory classification for audit.
These are attribution leads: a partial run or a nearby library member does
not make the entire inventory extent byte-exact. The inventory labels and
boundaries are still heuristic. Three short Cycles extents marked runtime have
no 12-byte library run and remain unresolved rather than being assigned a
member. No DSI modification is demonstrated; partial matches cannot exclude it.

MSC 5.10 `SLIBCR.LIB` and `MLIBCR.LIB` provide the selected member names.
Most matching runs also occur in the corresponding MSC 5.00 libraries and do
not discriminate the release. The longer 5.10 runs in Cycles `fseek.c`,
`fread.c`, and `_open.c` favor 5.10 for those members, not for all game code.
The direct member rescan identifies 16 Circuit and 27 Cycles extents per
target classified `game/engine` that contain runtime code runs. This includes
`STDARGV`, low-level DOS I/O, stream I/O, and formatting members. Some
`data/unknown` inventory extents also contain runtime code.

Maintained source and strictly checked recipes are separate from library-only
member evidence. `strlen.asm` and `strlen_medium.asm` reconstruct the
small- and medium-model `STRLEN` leaves. `sub_2CE77.asm` is a 19-byte CRT0DAT
helper shared across five targets. `toupper.c` strictly rebuilds its Cycles
ranges, but its exact installed library member is unconfirmed; its attribution
remains medium confidence. Each recipe with a `runtime_` ID is replayed by
`tools/validate.py`; [coverage.py](../tools/coverage.py) reports those ranges
as runtime bytes even when an older recipe ID also exists.

The `STDARGV` experiment uses the LF-normalized MSC 5.10
`STARTUP/DOS/STDARGV.ASM` from the pinned installation (Microsoft source, kept local under ignored `work/` and not redistributed), with local `VERSION.INC`, `CMACROS.INC`, and
`MSDOS.INC` names. The `masm510-msc-startup` profile pins each installed include
hash and stages it into the scratch build. The installed source SHA-256 is
`6c40436a25873fa016dcb5dfdcfd980869b3c3e5b45486a25153430a5885f8d8`;
the LF copy is `139a0af2ae0119163ef47d8b991b546e1677db46c3d3aeee21b98f7b8c8635d5`.
A fresh build matches all non-fixup
bytes across the full 398-byte Circuit EGA/CGA routine, and both libraries
contain matching `STDARGV` runs. Strict replay remains blocked at the two
`_DATA` member-placement fixups: the pipeline's current DGROUP binding model
cannot express that segment contribution while enforcing the inventory DGROUP
base. There is therefore no `STDARGV` promotion recipe or claim of strict
acceptance. The installed startup source is provenance for the source file;
the library and oracle runs are separate provenance for attribution.
