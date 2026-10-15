#!/usr/bin/env python3
"""Summarize tracked recipe coverage per target (claimed ranges; promotion verifies them).

Counts non-overlapping bytes covered by analysis/recipes/*.json ranges, split by
source kind and runtime/game attribution. This is a ledger of recipe scope, not a source-percentage claim;
tools/validate.py is what freshly proves every recipe.
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TARGETS = ("circuit_ega", "circuit_cga", "cycles_ega", "cycles_cga", "cycles_tandy")


def number(value) -> int:
    return int(value, 0) if isinstance(value, str) else value


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--json", action="store_true")
    args = p.parse_args()
    spans = {t: {"game_c": [], "game_asm": [], "runtime_c": [], "runtime_asm": []} for t in TARGETS}
    recipes = 0
    for path in sorted((ROOT / "analysis/recipes").glob("*.json")):
        recipe = json.loads(path.read_text(encoding="utf-8"))
        kind = "c" if recipe["source"].lower().endswith(".c") else "asm"
        runtime = path.stem.startswith("runtime_") or recipe["id"].startswith("runtime_") or \
            recipe["source"].replace("\\", "/").lower().startswith("src/runtime/")
        category = ("runtime_" if runtime else "game_") + kind
        recipes += 1
        for target, extent in recipe["targets"].items():
            spans[target][category].append((number(extent["start"]), number(extent["end"])))
    report = {"recipes": recipes, "targets": {}}
    for target in TARGETS:
        inventory = json.loads((ROOT / "analysis/inventory" / f"{target}.json").read_text(encoding="utf-8"))
        game = sum(f["end"] - f["start"] for f in inventory["functions"]
                   if f.get("classification") != "MSC runtime")
        row = {}
        category_bytes = {}
        for kind, ranges in spans[target].items():
            covered = set()
            for a, b in ranges:
                covered.update(range(a, b))
            row[kind] = len(covered)
            category_bytes[kind] = covered
        runtime_bytes = category_bytes["runtime_c"] | category_bytes["runtime_asm"]
        game_bytes = (category_bytes["game_c"] | category_bytes["game_asm"]) - runtime_bytes
        row["runtime_bytes"] = len(runtime_bytes)
        row["game_bytes"] = len(game_bytes)
        row["c"] = row["game_c"] + row["runtime_c"]
        row["asm"] = row["game_asm"] + row["runtime_asm"]
        row["functions"] = sum(len(v) for v in spans[target].values())
        row["inventory_non_runtime_bytes"] = game
        report["targets"][target] = row
    if args.json:
        print(json.dumps(report, indent=2))
    else:
        print(f"{report['recipes']} recipes")
        print(f"{'target':<14}{'ranges':>8}{'game':>10}{'runtime':>10}{'C bytes':>10}{'ASM bytes':>11}{'inventory':>11}")
        for target, row in report["targets"].items():
            print(f"{target:<14}{row['functions']:>8}{row['game_bytes']:>10}{row['runtime_bytes']:>10}{row['c']:>10}{row['asm']:>11}{row['inventory_non_runtime_bytes']:>11}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
