#!/usr/bin/env python3
"""Verify that every personal skill mirror matches canonical skills/."""

from __future__ import annotations

import hashlib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CANONICAL = ROOT / "skills"
MIRRORS = [ROOT / ".agents" / "skills", ROOT]


def digest(path: Path) -> str:
    hasher = hashlib.sha256()
    for item in sorted(path.rglob("*")):
        if item.is_file():
            hasher.update(item.relative_to(path).as_posix().encode("utf-8"))
            hasher.update(b"\0")
            hasher.update(item.read_bytes())
    return hasher.hexdigest()


def main() -> int:
    mismatches: list[str] = []
    skill_dirs = sorted(
        path for path in CANONICAL.iterdir() if path.is_dir() and (path / "SKILL.md").is_file()
    )
    expected_names = {path.name for path in skill_dirs}
    for source in skill_dirs:
        source_hash = digest(source)
        for mirror_root in MIRRORS:
            mirror = mirror_root / source.name
            if not mirror.is_dir() or digest(mirror) != source_hash:
                mismatches.append(str(mirror))
    for mirror_root in MIRRORS:
        actual_names = {
            path.name
            for path in mirror_root.iterdir()
            if path.is_dir() and (path / "SKILL.md").is_file()
        }
        for extra in sorted(actual_names - expected_names):
            mismatches.append(str(mirror_root / extra))
    if mismatches:
        print("skill mirror mismatch:")
        print("\n".join(mismatches))
        return 1
    print(f"skill mirrors match ({len(skill_dirs)} skills)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
