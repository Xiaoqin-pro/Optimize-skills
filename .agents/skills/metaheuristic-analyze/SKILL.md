---
name: metaheuristic-analyze
description: Analyze MATLAB swarm-optimization results with integrity checks, win/tie/loss, Wilcoxon, Friedman, Holm correction, effect sizes, robustness and mechanism diagnostics.
metadata:
  short-description: Statistically analyze metaheuristic experiments
---

# Metaheuristic Experiment Analysis

Analyze `$ARGUMENTS`. Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/STATISTICS_RULES.md`, the candidate plan and raw CSV files.

## Integrity First

Before interpreting results, verify the same functions, dimensions, population, max FEs, seed schedule and algorithm versions; expected seeds; no duplicate runs; explicit failures; valid actual FEs; and no hidden NaN/Inf removal. If integrity fails, return `INVALID EXPERIMENT` and list repairs.

## Analysis

For every algorithm × function × dimension, report mean, median, standard deviation, IQR, minimum and maximum. Prefer median and distribution-aware summaries for skewed results.

For each candidate-baseline pair report function-level win/tie/loss, practical tolerance, effect size, runtime overhead and (when meaningful) relative or log-scaled improvement. Use Wilcoxon signed-rank for paired comparisons, Friedman for multiple algorithms and Holm correction for post-hoc control comparisons unless the benchmark protocol specifies another test. Always report effect size with p-values.

Compare mechanism diagnostics such as population diversity, directional entropy, step-size distribution, stagnation events and basin-escape rate. Check whether diagnostics move in the direction predicted by the candidate hypothesis.

## Decision

Return exactly one of:

- `PROMOTE`: broad meaningful signal, sound integrity and mechanism evidence.
- `HOLD`: promising but ambiguous or underpowered.
- `REJECT`: no meaningful signal, falsified mechanism, isolated wins or simpler equivalent method performs as well.

Write `results/statistics/<candidate>_<level>_analysis.md`. Do not call a method best from one function or one p-value.
