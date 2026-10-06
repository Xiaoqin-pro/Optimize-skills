---
name: metaheuristic-analyze
description: Analyze MATLAB swarm-optimization experiments, validate integrity, test mechanism predictions and determine which research claims the evidence supports.
metadata:
  short-description: Statistically analyze metaheuristic experiments
---

# Metaheuristic Experiment Analysis

Analyze `$ARGUMENTS`. Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/STATISTICS_RULES.md`, the candidate plan and raw CSV files.

## Integrity First

Before interpreting results, verify the same functions, dimensions, population, max FEs, seed schedule and algorithm versions; expected seeds; no duplicate runs; explicit failures; valid actual FEs; and no hidden NaN/Inf removal. If integrity fails, return `INVALID EXPERIMENT` and list repairs.

## Analysis

For every algorithm × function × dimension, report mean, median, standard deviation, IQR, minimum and maximum. Prefer median and distribution-aware summaries for skewed results.

Follow `protocol/STATISTICS_RULES.md` for independent versus paired designs, across-function blocks, Friedman/Wilcoxon tests, Holm correction and effect sizes. Report function-level win/tie/loss, practical tolerance, runtime overhead and mechanism diagnostics against the registered predictions.

Compare mechanism diagnostics such as population diversity, directional entropy, step-size distribution, stagnation events and basin-escape rate. Check whether diagnostics move in the direction predicted by the candidate hypothesis.

## Decision

Return both a performance decision and a claim decision:

- `PROMOTE`: broad meaningful signal, sound integrity and mechanism evidence.
- `HOLD`: promising but ambiguous or underpowered.
- `REJECT`: no meaningful signal, falsified mechanism, isolated wins or simpler equivalent method performs as well.

For the intended claim, state `yes`, `partial` or `no`; list what the data supports and does not support, remaining evidence gaps, a scope-corrected claim and the next action. A positive score on one function does not support a general claim. Update `research-wiki` when available.

Write `results/statistics/<candidate>_<level>_analysis.md`. Do not call a method best from one function or one p-value.
