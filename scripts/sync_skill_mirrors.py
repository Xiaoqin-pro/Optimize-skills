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
    expected_names = {path.name for path in skill_dirs}
    for mirror_root in MIRRORS:
        mirror_root.mkdir(parents=True, exist_ok=True)
        resolved_root = ROOT.resolve()
        resolved_mirror = mirror_root.resolve()
        if not resolved_mirror.is_relative_to(resolved_root):
            raise SystemExit(f"refusing to sync outside repository: {resolved_mirror}")
        for old_skill in mirror_root.iterdir():
            if (
                old_skill.is_dir()
                and (old_skill / "SKILL.md").is_file()
                and old_skill.name not in expected_names
            ):
                shutil.rmtree(old_skill)
        for source in skill_dirs:
            destination = mirror_root / source.name
            if destination.exists():
                shutil.rmtree(destination)
            shutil.copytree(source, destination)
    print(f"synced {len(skill_dirs)} skills from {CANONICAL}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
