# Experiment Rules

## Levels and Plan

- **Smoke:** one function, one dimension and one seed; verify equations, bounds, objective orientation, deterministic replay, FE accounting and output schema.
- **Pilot:** a small, diverse subset (default: 5 functions, dimension 30 and 5 fixed seeds); screen the causal prediction without repeated tuning against the same results.
- **Medium:** several function classes and dimensions, stronger baselines, mechanism diagnostics, runtime and minimal ablation.
- **Confirmatory:** freeze candidate version, equations, hyperparameters, benchmark set, seeds and FE budget before execution; use the official target-suite protocol when available.

Before execution, write `ideas/<candidate>/EXPERIMENT_PLAN.md` with algorithm versions, manifest and adapter, function IDs/classes/dimensions, population, max FEs, seed schedule, objective and optimum conventions, boundary handling, outputs and diagnostics, statistics, promotion criteria and a runtime estimate. Keep pilot, medium and confirmatory outputs separate.

- Use objective-function evaluations as the fairness unit.
- Keep pilot, medium and confirmatory results in separate directories.
- Fix seeds before confirmatory evaluation.
- Use the same benchmark, dimensions, population and budget for candidates and baselines.
- Retain NaN, Inf and failed runs with explicit status flags.
- Never replace an unfavorable seed or silently retry with a different seed.
- Every run writes the standard result contract from `AGENTS.md`.
- Add diagnostics that test the proposed mechanism, not only final objective values.
