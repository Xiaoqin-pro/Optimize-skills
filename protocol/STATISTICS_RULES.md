# Statistics Rules

## Integrity

Validate the result table before analysis. Check benchmark/function/dimension, population, max FEs, algorithm version, seed schedule, failures, duplicate run IDs and missing values. A failed or invalid table returns `INVALID EXPERIMENT` before any performance interpretation.

## Three Analysis Levels

### Per-run / per-function

For each algorithm × function × dimension, summarize independent stochastic runs with mean, median, standard deviation, IQR, minimum and maximum. A shared seed label does not by itself make two observations statistically paired; use paired tests only when the experimental design creates genuine matched blocks.

### Across functions

First choose and freeze one pre-registered summary per function (normally median error or mean error over independent runs). Compare the resulting function-level blocks across algorithms. Do not concatenate all raw runs from all functions into one artificial sample.

### Multiple algorithms

Use Friedman ranks on function-level blocks for more than two algorithms. For control-versus-others post-hoc comparisons, use Holm correction. Report the number of functions, ties and missing/failed blocks.

## Tests and Effect Sizes

Use Wilcoxon signed-rank only for genuinely paired blocks and state the pairing unit. Report p-values with a practical tolerance and an effect size. Default effect-size choices are Vargha-Delaney A12 for two independent samples or Cliff's delta; use a paired effect size when the design is paired. A p-value alone is never sufficient evidence.

## Robustness

Check wins by function class, dimension, seed sensitivity, runtime overhead, backend and outliers. Compare mechanism diagnostics with the candidate's pre-registered predictions.

## Promotion

A candidate is promoted only when the result is statistically and practically meaningful across more than isolated functions, the mechanism evidence is consistent, and no simpler null mechanism explains the gain.
