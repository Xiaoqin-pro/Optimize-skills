#!/usr/bin/env python3
"""Copy canonical skills/ into the personal Codex skill mirrors."""

from __future__ import annotations

import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CANONICAL = ROOT / "skills"
MIRRORS = [ROOT / ".agents" / "skills", ROOT]


def main() -> int:
    if not CANONICAL.is_dir():
        raise SystemExit(f"canonical directory missing: {CANONICAL}")
    skill_dirs = sorted(
        path for path in CANONICAL.iterdir() if path.is_dir() and (path / "SKILL.md").is_file()
    )
    if not skill_dirs:
        raise SystemExit("no canonical skills found")
    for mirror_root in MIRRORS:
        mirror_root.mkdir(parents=True, exist_ok=True)
        for source in skill_dirs:
            destination = mirror_root / source.name
            if destination.exists():
                shutil.rmtree(destination)
            shutil.copytree(source, destination)
    print(f"synced {len(skill_dirs)} skills from {CANONICAL}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
