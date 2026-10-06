---
name: matlab-experiment
description: Execute reproducible MATLAB experiments for swarm and metaheuristic algorithms on CEC and standard benchmarks, with FE accounting, CPU parallelism and optional benchmark-driven GPU fitness evaluation.
metadata:
  short-description: Run fair MATLAB CEC experiments
---

# MATLAB Metaheuristic Experiment Executor

Run the requested level and candidate in `$ARGUMENTS`. Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/EXPERIMENT_RULES.md`, `protocol/MATLAB_STYLE.md`, the candidate experiment plan and `benchmarks/README.md`.

## Backend Policy

Supported backends are `cpu`, `gpu` and `auto`.

- Default to CPU for lightweight CEC functions.
- Use CPU `parfor` for independent runs when Parallel Computing Toolbox is available.
- Use GPU only for vectorized, numerically heavy population evaluation or very large populations.
- In `auto`, detect GPU availability, run a small same-configuration CPU/GPU microbenchmark, and choose GPU only when wall-clock speedup is meaningful (default threshold 1.5x) and values agree within the stated tolerance.
- Do not launch many MATLAB workers that contend for one GPU.
- GPU availability must never make an experiment fail; fall back to CPU and record the selected backend.

## Preflight

Check MATLAB availability, candidate files, benchmark paths, objective orientation, bounds, dimension support, result directory, seed list and requested FE budget. Prefer `matlab -batch "addpath(genpath(pwd)); ..."` for non-interactive runs.

## Execution Levels

- **Smoke:** one function, one seed; validate the algorithm, bounds, deterministic replay and actual FE counting.
- **Pilot:** small function subset, 5 seeds; screen candidates.
- **Medium:** multiple function classes, stronger baselines, diagnostics and minimal ablation.
- **Confirmatory:** frozen candidate, protocol-compliant suite, fixed seeds and formal statistics.

Use the CEC implementation's official input orientation and dimensions. Do not silently substitute a non-equivalent implementation.

## Result Contract

Every run writes a row containing:

`candidate_id,candidate_version,algorithm,benchmark_suite,function_id,function_class,dimension,seed,population_size,max_fes,actual_fes,best_objective,known_optimum,error,runtime_seconds,backend,exit_status`

Optional fields include `gpu_name`, `cpu_worker`, `diversity`, `directional_entropy`, `mean_step_size`, `stagnation_events` and `restart_count`.

Raw runs are append-only. Keep NaN, Inf and failed rows with explicit status. Verify expected row count, seed coverage, duplicate IDs, FE budget and candidate/baseline comparability before handoff to `metaheuristic-analyze`.

## Rules

Never change seeds because results are unfavorable. Never compare unequal FE budgets. Never report only successful candidates. If a technical error occurs, diagnose and retry the same registered run; do not replace it with a new seed. Record backend and hardware for every run.
