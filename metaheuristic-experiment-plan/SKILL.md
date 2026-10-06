---
name: metaheuristic-experiment-plan
description: Plan fair CPU MATLAB experiments for swarm and metaheuristic algorithms across smoke, pilot, medium, ablation and confirmatory levels.
metadata:
  short-description: Create fair MATLAB optimization experiment protocols
---

# Metaheuristic Experiment Plan

Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/EXPERIMENT_RULES.md`, `protocol/MATLAB_STYLE.md`, the refined candidate specification and the literature's benchmark protocol. Write `ideas/<candidate>/EXPERIMENT_PLAN.md`.

## Levels

### Smoke
One function, one dimension, one seed. Check equations, bounds, objective orientation, FE counting, output schema and deterministic replay.

### Pilot
A small but diverse function set, dimension 30 and 5 fixed seeds. Screen the hypothesis; do not tune repeatedly against the same result.

### Medium
Multiple function classes and dimensions, stronger baselines, diagnostics, runtime measurement and minimal mechanism ablation. Use the same FE budget for candidates and baselines.

### Confirmatory
Freeze candidate version, equations, hyperparameters, seed list, benchmark set and max FEs before running. Use the target benchmark's official protocol where available. Keep a held-out or untouched confirmatory set when feasible.

## Plan Must Specify

- algorithms and exact versions;
- benchmark suite, function classes and dimensions;
- population size and max FEs;
- seed schedule and run count;
- objective direction and known optima;
- boundary and constraint handling;
- raw output fields and diagnostics;
- statistical tests and correction;
- promotion/rejection criteria;
- expected runtime and timeout.

Do not use iteration count as a substitute for FE fairness unless the study explicitly investigates that choice.
