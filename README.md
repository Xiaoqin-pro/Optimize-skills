# Optimize Skills

Personal Codex skill package for mechanism-driven research on PSO, CSO, ABC and related swarm/metaheuristic optimization algorithms in MATLAB.

## What it does

```text
failure question
    -> pain-first claim card
    -> mechanism novelty / equivalence gate
    -> MATLAB kill pilot
    -> FE-fair analysis
    -> red-team review
    -> resumable multi-generation search
```

This package is intentionally personal and opinionated. It does not include grant, patent, or unrelated application workflows.

## Codex layout

The canonical plugin skills are under `skills/`. A project-scoped mirror is under `.agents/skills/`, and the root skill folders are retained as a readable source mirror for this personal workspace.

The plugin manifests are:

- `plugin.json`
- `.codex-plugin/plugin.json` (Codex compatibility manifest)

OpenAI's plugin format declares skills with a root `skills/` directory; the project-scoped mirror follows the `.agents/skills/<skill>/SKILL.md` layout used by Codex-compatible projects.

## Five-minute personal start

1. Open this repository as the Codex project.
2. Read `AGENTS.md`, `RESEARCH_BRIEF.md` and `RESEARCH_STATE.json`.
3. Put or reference the baseline MATLAB algorithm in your research project.
4. Start with:

```text
Use metaheuristic-research-pipeline.
Investigate premature convergence of PSO on rotated multimodal landscapes.
Use the local MATLAB backend with auto CPU/GPU selection.
Stop before confirmatory evaluation and show the surviving candidates.
```

For a new question, the pipeline invokes `metaheuristic-pain-first-idea-discovery` first. For a frozen question, use `metaheuristic-idea-discovery`. For a single pilot use `matlab-experiment`; for result interpretation use `metaheuristic-analyze`.

## Deterministic MATLAB layer

`skills/matlab-experiment/scripts/` contains fixed helpers for:

- `run_one.m`: one seeded run with objective-function evaluation counting;
- `run_batch.m`: independent run batches with optional `parfor`;
- `smoke_test.m`: runner and schema smoke check;
- `validate_result_table.m`: required fields and FE integrity;
- `append_run_record.m`: append-only CSV records;
- `benchmark_backend.m`: CPU/GPU microbenchmark.

The algorithm contract is documented in `skills/matlab-experiment/references/RESULT_SCHEMA.md`.

## Benchmarks

CEC2013, 2014, 2017, 2019, 2020 and 2022 ready MATLAB suites are under `benchmarks/ready/`. Use the machine-readable manifests under `benchmarks/manifests/` and the N-by-D adapters under `benchmarks/adapters/`. Load one suite at a time; do not `genpath` every CEC year into MATLAB.

See [benchmarks/README.md](benchmarks/README.md) for dimensions, entrypoints, provenance and citation requirements.

## Resume

`RESEARCH_STATE.json` is the resumable state machine. `metaheuristic-outer-loop` updates it at phase boundaries so an interrupted session can continue from the last completed candidate and phase instead of inferring state from chat history.

## MATLAB style

The code style follows the local teacher project: simple procedural `.m` files, Chinese section comments, explicit optimizer loops, separate `main.m` orchestration and multiple explicit outputs. Scientific safeguards remain mandatory: seeded `rng`, initialized arrays, explicit FE accounting, preserved failed runs and recorded backend.
