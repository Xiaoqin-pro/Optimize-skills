# Result Schema

`run_one` and `run_batch` produce one row per independent stochastic run.

Required fields:

- `candidate_id`, `candidate_version`
- `algorithm`, `benchmark_suite`, `function_id`, `function_class`
- `dimension`, `seed`, `population_size`
- `max_fes`, `actual_fes`
- `best_objective`, `known_optimum`, `error`
- `runtime_seconds`, `backend`, `exit_status`

The algorithm contract is:

```matlab
[best_f, best_x, curve, diagnostics] = algorithm(objfun, config)
```

`objfun` accepts an `N-by-D` population and returns `N` objective values. The wrapper counts each row as one objective-function evaluation and clips the final batch at `max_fes`.

Use `validate_result_table` before statistical analysis. Failed runs remain in the table with `exit_status` beginning with `failed:`.
