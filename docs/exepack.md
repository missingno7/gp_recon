# Verified executable baseline

The supplied workspace contains extracted `assets/Circuit` and `assets/Cycles`
directories, not two archive containers. File hashes and executable relationships
are verified here; archive membership, dates and release provenance cannot be
reconstructed from that merged directory alone. No assets are tracked by Git.

`analysis/manifest.json` inventories all 125 files, including 17 MZ executables.
Twelve executable variants belong to five targets. Launchers, configuration
programs and MZ sound drivers are recorded as evidence without inventing extra
game targets. `analysis/patches.json` records every changed load-image byte and
the small packed-file changes, header differences, and relocation changes.

| Preferred target | Supplied source | Load image bytes | Relocation entries |
|---|---|---:|---:|
| circuit_ega | Circuit/GPEGA.EXE | 106336 | 35 |
| circuit_cga | Circuit/GPCGA.EXE | 96944 | 36 |
| cycles_ega | Cycles/CPC2001.DAT | 131392 | 1202 |
| cycles_cga | Cycles/CPC2001C.DAT | 121968 | 1221 |
| cycles_tandy | Cycles/GPTDY.EX_ | 120128 | 1220 |

The two `CPC2001` packed-file SHA-256 values equal the identifiers supplied by the
user. Circuit is the preferred supplied baseline; its independence across two
historical archives was not testable here. Tandy is provisionally the supplied
packed baseline, not a claim of pristine publisher provenance.

## Independent checks

The Python decoder implements backwards fill/literal commands with explicit
bounds. It recognizes the specific 18-byte EXEPACK header and skip length used
by these games; unsupported layouts fail closed. The relocation-table start
must agree with the original stub's `mov si` immediate, its English error
string boundary and the end of all sixteen relocation banks.

The format was researched using [w4kfu/unEXEPACK](https://github.com/w4kfu/unEXEPACK).
The implementation does not accept that reference's synthetic header as an
original linker artifact. A separate verifier executes the original EXEPACK
x86 instructions in Unicorn 2.1.4. It does not invoke the Python decompressor
or relocation-table decoder. At load segments `1000` and `2123`, every one of
the nine packed variants reaches the recovered entry with the expected stack,
the complete expected relocated image, and the exact ordered sequence of
relocation writes. See `analysis/stub_verification.json`.

The supplied unpacked EGA and Tandy MZ files independently confirm relocation
locations after segment:offset normalization. Raw table order and representation
can differ; locations, multiplicity and ordering are separate observations.

| Compared with preferred image | Changed image bytes | Same relocation locations |
|---|---:|---|
| cycles_ega_old / GPEGA.OLD | 12 | yes |
| cycles_ega_exe / GPEGA.EXE | 57 | yes |
| cycles_ega_gp1 / GP1.EXE | 5 | **no** |
| cycles_ega_ex_ / GPEGA.EX_ | 5 | yes |
| cycles_cga_exe / GPCGA.EXE | 11 | yes |
| cycles_cga_ex_ / GPCGA.EX_ | 4 | yes |
| cycles_tandy_exe / GPTDY.EXE | 11 | yes |

`GP1.EXE` and `GPEGA.EX_` have identical unpacked images, but GP1 removes linear
relocation locations 59967, 59984 and 60100 and introduces locations 36927 and
37008, with 37008 occurring twice. Its 1202 entries contain only 1201 distinct
locations. The running stub confirms the duplicate addition. A relocation set
or load-image hash alone would miss this behavioral difference.

`Circuit/START.SND` and `Cycles/START.SND` are the only byte-identical full files
in the supplied directories. This does not test the user's statement about
asset identity between the two Cycles archives, whose separate copies are absent.

## Artifacts and reproduction

```powershell
python tools/baseline.py --check
python tools/exepack/verify_stub.py
```

Use Python 3.11+ and install `unicorn==2.1.4` for the independent verifier. The
local installation is under `C:/tools/gp-recon-python`. The standard library
alone suffices for decoding and manifest checking.

`work/oracles/<variant>/image.bin` is the unrelocated load image;
`metadata.json` includes the complete ordered linear relocation list, source
hash, headers, entry and stack. `analytical.exe` is generated only for packed
inputs, using that verified image and relocation stream. It has a deterministic
paragraph-aligned header with zero checksum and conservative memory allocation
derived from the packed memory floor and recovered stack. DOS min/max allocation
values from the original pre-pack link are not claimed recovered. The synthetic
header, relocation representation, padding and complete executable hash are
**not** asserted identical to the original pre-EXEPACK linker output.

The manifest is a tracked evidence lock. After it exists, routine baseline
generation compares a fresh manifest and fails on differences without updating
the lock. Raw supplied files are only read. Private analysis artifacts can be
regenerated; no canonical source image is replaced with a patched variant.
