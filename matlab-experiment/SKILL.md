---
name: matlab-experiment
description: Plan and run reproducible MATLAB experiments for swarm and metaheuristic algorithms, from smoke tests through confirmatory evaluation, with objective-evaluation accounting and statistical handoff.
metadata:
  short-description: Run fair MATLAB CEC experiments
---

# MATLAB Metaheuristic Experiments

Plan or run the requested level and candidate in `$ARGUMENTS`. Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/EXPERIMENT_RULES.md`, `protocol/MATLAB_STYLE.md`, the candidate specification, the selected suite manifest under `benchmarks/manifests/` and `benchmarks/README.md`. If no experiment plan exists, create `ideas/<candidate>/EXPERIMENT_PLAN.md` before execution.

## Workflow

1. **Plan:** specify algorithm versions, function IDs/classes/dimensions, population, max FEs, seeds, objective conventions, boundary handling, diagnostics, statistics, promotion criteria and expected runtime. Freeze these fields before confirmatory evaluation.
2. **Smoke:** one function, dimension and seed; verify implementation, bounds, deterministic replay, FE count and result schema.
3. **Pilot:** screen the registered hypothesis on a small diverse set with fixed seeds.
4. **Medium:** evaluate multiple function classes and dimensions with stronger baselines, mechanism diagnostics and minimal ablation.
5. **Confirmatory:** use the frozen candidate and target suite protocol. Keep results separate from discovery and development data.

Run only the level requested. Use `run_one.m`, `run_batch.m` and `validate_result_table.m` in `skills/matlab-experiment/scripts/`; record every run and retain failures. Follow `protocol/EXPERIMENT_RULES.md` and pass completed results to `metaheuristic-analyze`.

## Execution

Check MATLAB, candidate files, result directory, selected suite and budget before running. Use explicit `addpath` calls for the runner, selected suite and adapter; do not recursively add every CEC year. Follow the manifest's function IDs, orientation, dimensions and objective convention.

Default to CPU; bundled CEC MEX entrypoints are CPU paths. Use GPU only when both the algorithm and objective implement it and a same-configuration benchmark shows a useful speedup with equivalent values. The provided backend benchmark measures only a generic Sphere kernel.

Use the scripts and result contract documented in `skills/matlab-experiment/references/RESULT_SCHEMA.md`. Keep runs append-only, retain failures, and check FE budgets, seed coverage and baseline comparability before handing results to `metaheuristic-analyze`. Detailed fairness rules are in `protocol/EXPERIMENT_RULES.md`.
