"""Strict MZ parsing and the EXEPACK encoding used by the supplied games.

All locations are relative to the unrelocated load image. An analytical MZ is
explicitly a new container, never claimed to be the original linker header.
"""
from __future__ import annotations

import hashlib
import struct
from dataclasses import dataclass

FIELDS = "magic cblp cp crlc cparhdr minalloc maxalloc ss sp csum ip cs lfarlc ovno".split()


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def words(data: bytes, offset: int, count: int) -> tuple[int, ...]:
    if offset < 0 or offset + count * 2 > len(data):
        raise ValueError("truncated word array")
    return struct.unpack_from("<" + "H" * count, data, offset)


@dataclass
class MZ:
    header: dict
    image: bytes
    relocations: list[int]
    relocation_pairs: list[tuple[int, int]]
    overlay: bytes


def parse_mz(data: bytes) -> MZ:
    h = dict(zip(FIELDS, words(data, 0, 14)))
    if h["magic"] != 0x5A4D or not h["cp"] or h["cblp"] > 511:
        raise ValueError("invalid MZ header")
    end = h["cp"] * 512 if h["cblp"] == 0 else (h["cp"] - 1) * 512 + h["cblp"]
    start = h["cparhdr"] * 16
    if not 28 <= start <= end <= len(data):
        raise ValueError("invalid MZ image bounds")
    table_end = h["lfarlc"] + h["crlc"] * 4
    if h["crlc"] and not 28 <= h["lfarlc"] <= table_end <= start:
        raise ValueError("invalid MZ relocation table bounds")
    pairs = [words(data, h["lfarlc"] + i * 4, 2) for i in range(h["crlc"])]
    relocs = [seg * 16 + off for off, seg in pairs]
    if any(p + 2 > end - start for p in relocs):
        raise ValueError("relocation outside image")
    return MZ(h, data[start:end], relocs, pairs, data[end:])


def exepack_header(mz: MZ) -> dict | None:
    at = mz.header["cs"] * 16
    if at + 18 > len(mz.image):
        return None
    raw = words(mz.image, at, 9)
    if raw[8] == 0x4252:
        size = 18
    elif raw[7] == 0x4252:
        size = 16
    else:
        return None
    names = "real_ip real_cs mem_start exepack_size real_sp real_ss dest_len skip_len signature".split()
    h = dict(zip(names, raw))
    h.update(offset=at, header_size=size)
    return h


def unpack(mz: MZ) -> tuple[bytes, list[int], dict]:
    eh = exepack_header(mz)
    if eh is None:
        raise ValueError("not recognized EXEPACK")
    if eh["header_size"] != 18 or eh["skip_len"] != 1:
        raise ValueError("unsupported EXEPACK header variant (supplied games use 18-byte header, skip_len=1)")
    src = mz.image[:eh["offset"]]
    pos = len(src)
    while pos and src[pos - 1] == 0xFF:
        pos -= 1
    output = bytearray(eh["dest_len"] * 16)
    dst = len(output)
    commands = 0
    while True:
        if pos < 3:
            raise ValueError("truncated EXEPACK command")
        op = src[pos - 1]
        count = struct.unpack_from("<H", src, pos - 3)[0]
        pos -= 3
        if not count or count > dst:
            raise ValueError("invalid EXEPACK output count")
        dst -= count
        if op & 0xFE == 0xB0:
            if pos < 1:
                raise ValueError("missing EXEPACK fill byte")
            pos -= 1
            output[dst:dst + count] = bytes([src[pos]]) * count
        elif op & 0xFE == 0xB2:
            if pos < count:
                raise ValueError("truncated EXEPACK literal")
            pos -= count
            output[dst:dst + count] = src[pos:pos + count]
        else:
            raise ValueError(f"unknown EXEPACK command {op:02x}")
        commands += 1
        if op & 1:
            break
    if dst != pos:
        raise ValueError(f"unexplained EXEPACK prefix: source={pos}, destination={dst}")
    output[:dst] = src[:pos]
    # This variant's original stub loads SI with the table offset. Requiring
    # exactly sixteen complete banks and exact stub bounds avoids string-only
    # guessing (the English error string is an additional sanity check).
    stub_end = eh["offset"] + eh["exepack_size"]
    stub = mz.image[eh["offset"]:stub_end]
    marker = b"Packed file is corrupt"
    found = stub.find(marker)
    if found < 0 or stub.find(marker, found + 1) >= 0:
        raise ValueError("unknown or ambiguous EXEPACK relocation layout")
    table = found + len(marker)
    if b"\xbe" + struct.pack("<H", table) + b"\x0e\x1f" not in stub[:found]:
        raise ValueError("stub does not reference expected relocation table")
    cursor = table
    relocs = []
    counts = []
    for bank in range(16):
        n, = words(stub, cursor, 1)
        cursor += 2
        entries = words(stub, cursor, n)
        cursor += n * 2
        counts.append(n)
        relocs.extend((bank << 16) + off for off in entries)
    if cursor != len(stub):
        raise ValueError("EXEPACK relocation table does not end at declared bound")
    # Duplicates must be retained: patched GP1.EXE contains one, and DOS adds
    # the load segment twice there. Silently deduplicating would change it.
    if any(p + 2 > len(output) for p in relocs):
        raise ValueError("EXEPACK relocation outside image")
    eh.update(commands=commands, literal_prefix=pos, relocation_table_offset=table,
              relocation_bank_counts=counts)
    return bytes(output), relocs, eh


def relocations_hash(relocs: list[int]) -> str:
    """Hash ordered linear locations; set equality is a separate comparison."""
    return sha256(b"".join(struct.pack("<I", p) for p in relocs))


def analytical_mz(image: bytes, relocs: list[int], entry: dict, stack: dict,
                  packed_header: dict) -> bytes:
    header_size = (28 + len(relocs) * 4 + 15) & ~15
    total = header_size + len(image)
    # Allocation preserves packed minimum memory floor, including its temporary
    # unpacker needs. This conservative analytical policy is not a linker claim.
    packed_paras = (packed_header.get("packed_image_size", len(image)) + 15) // 16
    minalloc = max(0, packed_paras + packed_header["minalloc"] - (len(image) + 15) // 16,
                   stack["ss"] + (stack["sp"] + 15) // 16 - (len(image) + 15) // 16)
    vals = [0x5A4D, total % 512, (total + 511) // 512, len(relocs), header_size // 16,
            minalloc, packed_header["maxalloc"], stack["ss"], stack["sp"], 0,
            entry["ip"], entry["cs"], 28, 0]
    header = bytearray(header_size)
    struct.pack_into("<14H", header, 0, *vals)
    for i, loc in enumerate(relocs):
        struct.pack_into("<HH", header, 28 + i * 4, loc & 0xFFFF, (loc >> 16) * 0x1000)
    return bytes(header) + image
