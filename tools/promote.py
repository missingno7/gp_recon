#!/usr/bin/env python3
"""Freshly promote a tracked C/MASM recipe into the SQLite atlas."""
from __future__ import annotations
import argparse
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from tools.matching import atlas


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("recipe", help="recipe ID or analysis/recipes/*.json path")
    p.add_argument("--db", type=Path, default=atlas.DB_PATH)
    args = p.parse_args()
    path = Path(args.recipe)
    if path.suffix != ".json":
        path = Path("analysis/recipes") / (args.recipe + ".json")
    recipe = atlas.load_recipe(path)
    if recipe.get("builder") == "legacy":
        from tools.matching.promote_initial import record as initial
        from tools.matching.promote_decimal import record as decimal
        builder = {"initial": initial, "decimal": decimal}.get(path.stem)
        if builder is None:
            raise ValueError(f"unknown legacy builder for {path}")
        receipt = builder(args.db)
    else:
        db = atlas.connect(args.db)
        try:
            receipt = atlas.promote_recipe(db, path)
        finally:
            db.close()
    print(json.dumps(receipt, indent=2, sort_keys=True))
    return 0 if receipt["accepted"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
