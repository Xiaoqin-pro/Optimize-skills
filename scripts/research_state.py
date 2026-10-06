#!/usr/bin/env python3
"""Deterministic, atomic updates for the personal research state file."""

from __future__ import annotations

import argparse
import json
import os
import tempfile
from datetime import datetime, timezone
from pathlib import Path
from typing import Any


REQUIRED_KEYS = {
    "run_id",
    "question_id",
    "generation",
    "candidate",
    "phase",
    "status",
    "candidate_status",
    "confirmatory_locked",
    "last_update_utc",
    "artifacts",
}
ALLOWED_STATUSES = {"idle", "running", "complete", "blocked", "locked"}


def utc_now() -> str:
    return datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")


def load_state(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as handle:
        state = json.load(handle)
    validate_state(state)
    return state


def validate_state(state: Any) -> None:
    if not isinstance(state, dict):
        raise ValueError("state must be a JSON object")
    missing = REQUIRED_KEYS.difference(state)
    if missing:
        raise ValueError(f"missing state keys: {', '.join(sorted(missing))}")
    if not isinstance(state["generation"], int) or state["generation"] < 0:
        raise ValueError("generation must be a non-negative integer")
    for key in ("run_id", "question_id", "candidate", "phase", "status", "last_update_utc"):
        if not isinstance(state[key], str):
            raise ValueError(f"{key} must be a string")
    if state["status"] not in ALLOWED_STATUSES:
        raise ValueError(f"status must be one of {sorted(ALLOWED_STATUSES)}")
    if not isinstance(state["candidate_status"], dict):
        raise ValueError("candidate_status must be an object")
    if not all(isinstance(k, str) and isinstance(v, str) for k, v in state["candidate_status"].items()):
        raise ValueError("candidate_status keys and values must be strings")
    if not isinstance(state["confirmatory_locked"], bool):
        raise ValueError("confirmatory_locked must be boolean")
    if not isinstance(state["artifacts"], dict):
        raise ValueError("artifacts must be an object")


def atomic_write(path: Path, state: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temp_name = tempfile.mkstemp(prefix=f".{path.name}.", suffix=".tmp", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8", newline="\n") as handle:
            json.dump(state, handle, ensure_ascii=False, indent=2)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temp_name, path)
    finally:
        if os.path.exists(temp_name):
            os.unlink(temp_name)


def touch(state: dict[str, Any]) -> None:
    state["last_update_utc"] = utc_now()


def command_start(state: dict[str, Any], args: argparse.Namespace) -> None:
    state["run_id"] = args.run_id
    state["question_id"] = args.question_id
    state["generation"] = args.generation
    state["candidate"] = ""
    state["phase"] = "literature"
    state["status"] = "running"
    state["candidate_status"] = {}
    state["confirmatory_locked"] = False
    touch(state)


def command_phase(state: dict[str, Any], args: argparse.Namespace) -> None:
    state["phase"] = args.phase
    if args.status is not None:
        state["status"] = args.status
    if args.generation is not None:
        state["generation"] = args.generation
    touch(state)


def command_candidate(state: dict[str, Any], args: argparse.Namespace) -> None:
    state["candidate"] = args.candidate_id
    state["candidate_status"][args.candidate_id] = args.status
    if args.generation is not None:
        state["generation"] = args.generation
    if state["status"] == "idle":
        state["status"] = "running"
    touch(state)


def command_lock(state: dict[str, Any]) -> None:
    state["confirmatory_locked"] = True
    state["phase"] = "confirmatory_locked"
    state["status"] = "locked"
    touch(state)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--state", type=Path, default=Path("RESEARCH_STATE.json"), help="state JSON path")
    sub = parser.add_subparsers(dest="command", required=True)

    start = sub.add_parser("start", help="start or reset a research run")
    start.add_argument("--run-id", required=True)
    start.add_argument("--question-id", required=True)
    start.add_argument("--generation", type=int, default=0)

    phase = sub.add_parser("phase", help="record a phase boundary")
    phase.add_argument("phase")
    phase.add_argument("--status", choices=sorted(ALLOWED_STATUSES))
    phase.add_argument("--generation", type=int)

    candidate = sub.add_parser("candidate", help="record candidate status")
    candidate.add_argument("candidate_id")
    candidate.add_argument("status")
    candidate.add_argument("--generation", type=int)

    sub.add_parser("lock-confirmatory", help="freeze confirmatory state")
    sub.add_parser("resume", help="print the current validated state")
    sub.add_parser("validate", help="validate without changing the file")
    return parser


def main() -> int:
    args = build_parser().parse_args()
    path = args.state.resolve()
    if not path.exists():
        raise SystemExit(f"state file does not exist: {path}")
    try:
        state = load_state(path)
        if args.command == "validate":
            print(f"valid: {path}")
            return 0
        if args.command == "resume":
            print(json.dumps(state, ensure_ascii=False, indent=2))
            return 0
        if args.command == "start":
            command_start(state, args)
        elif args.command == "phase":
            command_phase(state, args)
        elif args.command == "candidate":
            command_candidate(state, args)
        elif args.command == "lock-confirmatory":
            command_lock(state)
        else:
            raise SystemExit(f"unsupported command: {args.command}")
        validate_state(state)
        atomic_write(path, state)
        print(f"updated: {path}")
        return 0
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        raise SystemExit(f"research state error: {exc}") from exc


if __name__ == "__main__":
    raise SystemExit(main())
