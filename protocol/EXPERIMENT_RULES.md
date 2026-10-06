# Experiment Rules

- Use objective-function evaluations as the fairness unit.
- Keep pilot, medium and confirmatory results in separate directories.
- Fix seeds before confirmatory evaluation.
- Use the same benchmark, dimensions, population and budget for candidates and baselines.
- Retain NaN, Inf and failed runs with explicit status flags.
- Never replace an unfavorable seed or silently retry with a different seed.
- Every run writes the standard result contract from `AGENTS.md`.
- Add diagnostics that test the proposed mechanism, not only final objective values.
