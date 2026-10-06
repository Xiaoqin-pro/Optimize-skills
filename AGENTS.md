# Research Project Instructions

## Research Domain

This skill set is for population-based stochastic optimization and swarm-intelligence algorithms, including PSO, CSO, ABC and related black-box optimizers.

The five project skills are `metaheuristic-research`, `metaheuristic-idea`, `matlab-experiment`, `metaheuristic-analyze` and `metaheuristic-review`. Use the research skill for end-to-end orchestration; use a focused skill for a single idea, experiment, analysis or review task.

- Primary language: MATLAB.
- Primary execution: local CPU.
- Supported backends: `cpu`, `gpu`, `auto`; GPU is optional and must never be a pipeline requirement.
- Use GPU mainly for heavy vectorized population fitness evaluation. For lightweight CEC functions, prefer CPU or CPU `parfor` after measuring. The bundled CEC MEX entrypoints are CPU paths; a generic kernel benchmark is only a screening signal.
- W&B, PyTorch, SSH and cloud queues are out of scope unless the user explicitly requests them.
- Use the installed `research-lit`, `research-wiki`, `citation-audit` and paper-writing skills when those tasks are needed; this package does not duplicate them.

## Research Philosophy

Novelty must be mechanism-level. A new animal metaphor, renamed variable, cosmetic equation rewrite, or unmotivated stack of known operators is not enough. Every candidate states:

1. observed failure mode;
2. causal hypothesis;
3. proposed mechanism;
4. measurable prediction;
5. closest known mechanisms;
6. falsification experiment.

## Evaluation Fairness

Use objective-function evaluations (FEs), not iteration count, as the default fairness unit. Keep population size, function budget, dimensions, benchmark suite, and seed list comparable. Fix seeds before confirmatory runs and retain failed, neutral and negative runs.

## Discovery / Development / Confirmatory Separation

Keep pilot, medium and confirmatory results separate. Once a candidate enters confirmatory evaluation, freeze its equations, main hyperparameters, seed schedule and budget. Do not retune against a confirmatory result.

## MATLAB Code Style

Follow [protocol/MATLAB_STYLE.md](protocol/MATLAB_STYLE.md), based on the local teacher reference project: simple procedural `.m` files, Chinese section comments, explicit optimizer loops and separate `main.m` orchestration. Preserve scientific correctness and reproducibility even when the reference project contains legacy shortcuts.

## MATLAB Runtime

Prefer `matlab -batch` for non-interactive runs, with explicit `addpath` calls for the selected runner, suite and adapter. Do not add every benchmark directory with `addpath(genpath(pwd))`. Use `parfor` only when Parallel Computing Toolbox is available; otherwise use ordinary `for` with identical scientific semantics. GPU is optional: detect it with `canUseGPU`/`gpuDevice`, benchmark the same algorithm/objective configuration, and select GPU only when the measured speedup is meaningful and numerical results remain equivalent within tolerance. The provided `benchmark_backend` measures only a generic Sphere kernel, and CEC MEX remains CPU. Do not combine many CPU workers that contend for one GPU.

## Result Contract

Each independent run records at least:

`candidate_id, candidate_version, algorithm, benchmark_suite, function_id, function_class, dimension, seed, population_size, max_fes, actual_fes, best_objective, known_optimum, error, runtime_seconds, backend, exit_status`

Optional mechanism diagnostics include diversity, directional entropy, mean step size, stagnation events and restart count.

## Integrity

Do not delete failed runs, cherry-pick favorable seeds, change seeds after seeing outcomes, or expand the budget only for a proposed method. A benchmark score improvement alone is not a novelty or publication claim.
