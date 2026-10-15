# Initial structure evidence

`analysis/structures.json` is a small atlas of external layout leads and direct
byte observations. It records source-file hashes at CyclesMod revision
`e544c88e5247efb1d5f61cf19bfa038e63b192fb`. The external editor is a research
reference, not an authority over the original source structure.

The reference describes three 148-byte vehicle records in a 444-byte array:
22 bytes of settings, 20 bytes of gear ratios and 106 bytes of torque data.
The entire reference car array exactly occurs at Circuit EGA load-image offset
98018 (`0x17EE2`) and Circuit CGA offset 88618 (`0x15A2A`). Its SHA-256 is
`c52ee38fdc67b4559ebca70aacf1da60fb8401cf38be006a1e21194ca9f44046`.
The entire reference bike array matches the supplied 444-byte `BIKES.INF`, hash
`758e368b29d6bb0a21f8cb3deb36e240a053e531b8300d736740f129f350b3a4`.

The data identity is verified. Record partitioning, signedness and field names
are reference hypotheses pending instruction-level usage evidence. In
particular, this milestone does not yet prove the Cycles file-loading path or
promote these hypotheses into shared engine C types.

[CyclesMod](https://github.com/albertus82/cyclesmod/tree/e544c88e5247efb1d5f61cf19bfa038e63b192fb)
and [Marnetto's GPC research](https://marnetto.net/projects/grand-prix-circuit)
are useful next leads for vehicle parameters, track layouts and PES resources.
The latter's data-segment-relative offsets require an independently verified
DS base before comparing them with load-image-relative offsets in this atlas.

```powershell
python tools/research/vehicles.py --check
```

The check needs only local oracles, supplied assets and the tracked metadata.
Regenerating reference observations requires an ignored CyclesMod checkout at
the pinned revision and `python tools/research/vehicles.py`.
