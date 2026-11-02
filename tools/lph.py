#!/usr/bin/env python3
"""Extract and statically decode the `LPH` constant pools.

Luraph stores each stage's constant pool inside a long-bracket string that
starts with `LPH` and is encoded with a private base-85 alphabet (0x21..0x75),
5 characters -> 4 little-endian bytes.  The `z` shorthand stands for five `!`
characters (a zero quintet).

The static decode below is the same transformation the loader performs at run
time, which is why the decoded bytes can be cross-checked against the `buffer`
object the payload builds inside the emulation harness.
"""

from __future__ import annotations

import hashlib
import json
import math
import re
from collections import Counter
from dataclasses import dataclass, asdict

POOL_RE = re.compile(r"\[(=*)\[(LPH[^\s]{0,2}.*?)\]\1\]", re.DOTALL)


@dataclass
class Pool:
    index: int
    signature: str
    encoded_chars: int
    encoded_sha256: str
    decoded_bytes: int
    decoded_sha256: str
    entropy: float
    printable_ratio: float
    head_hex: str
    offset: int

    def to_json(self) -> dict:
        return asdict(self)


def extract_pools(src: str) -> list[tuple[str, int]]:
    """Return [(payload, offset)] for every LPH long-bracket string."""
    found = []
    for m in POOL_RE.finditer(src):
        payload = m.group(2)
        if payload.startswith("LPH"):
            found.append((payload, m.start()))
    return found


def base85_decode(payload: str) -> bytes:
    """Decode the Luraph base-85 body (the leading `LPH` and marker char are data too)."""
    text = payload.replace("z", "!!!!!")
    out = bytearray()
    cache: dict[str, int] = {}
    length = len(text) - 4
    for i in range(5, length + 1, 5):
        chunk = text[i - 5:i]
        value = cache.get(chunk)
        if value is None:
            try:
                b = [ord(c) for c in chunk]
            except TypeError:  # pragma: no cover
                continue
            value = ((b[4] - 33) + (b[3] - 33) * 0x55 + (b[2] - 33) * 7225
                     + (b[1] - 33) * 614125 + (b[0] - 33) * 52200625) & 0xFFFFFFFF
            cache[chunk] = value
        out += value.to_bytes(4, "little")
    return bytes(out)


def _entropy(data: bytes) -> float:
    if not data:
        return 0.0
    counts = Counter(data)
    total = len(data)
    return -sum((c / total) * math.log2(c / total) for c in counts.values())


def describe(src: str) -> tuple[list[Pool], list[bytes]]:
    pools: list[Pool] = []
    blobs: list[bytes] = []
    for idx, (payload, offset) in enumerate(extract_pools(src)):
        decoded = base85_decode(payload)
        printable = sum(1 for b in decoded if 32 <= b < 127) / max(1, len(decoded))
        pools.append(Pool(
            index=idx,
            signature=payload[:4],
            encoded_chars=len(payload),
            encoded_sha256=hashlib.sha256(payload.encode("utf-8", "surrogateescape")).hexdigest(),
            decoded_bytes=len(decoded),
            decoded_sha256=hashlib.sha256(decoded).hexdigest(),
            entropy=round(_entropy(decoded), 3),
            printable_ratio=round(printable, 4),
            head_hex=decoded[:32].hex(),
            offset=offset,
        ))
        blobs.append(decoded)
    return pools, blobs


def write_reports(pools: list[Pool], out_dir) -> str:
    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / "pools.json").write_text(json.dumps([p.to_json() for p in pools], indent=1), encoding="utf-8")
    return str(out_dir / "pools.json")


def main(argv: list[str]) -> int:
    import pathlib
    import sys
    if len(argv) < 3:
        print("usage: lph.py <script.luau> <out-dir>", file=sys.stderr)
        return 2
    src = pathlib.Path(argv[1]).read_text(encoding="utf-8", errors="surrogateescape")
    pools, blobs = describe(src)
    out = pathlib.Path(argv[2])
    out.mkdir(parents=True, exist_ok=True)
    for pool, blob in zip(pools, blobs):
        (out / f"pool{pool.index}.bin").write_bytes(blob)
    write_reports(pools, out)
    for p in pools:
        print(f"pool{p.index}: {p.encoded_chars} b85 chars -> {p.decoded_bytes} bytes, "
              f"entropy {p.entropy}, sha256 {p.decoded_sha256[:16]}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(__import__("sys").argv))
