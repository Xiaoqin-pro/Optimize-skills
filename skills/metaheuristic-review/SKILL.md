---
name: metaheuristic-review
description: Adversarially review a swarm-optimization research candidate and its evidence for novelty, fairness, mechanism support, reproducibility and claim strength. Use after analysis or when a research review is requested.
metadata:
  short-description: Red-team optimization research evidence
---

# Metaheuristic Research Review

Review `$ARGUMENTS`. Read `AGENTS.md`, the failure question and claim card, candidate specification, benchmark protocol, experiment plan, raw-result audit, analysis and relevant literature map. Follow the applicable rules under `protocol/`.

Try to falsify the claimed mechanism. Check closest equations and prior work, causal predictions, FE fairness, seed freezing, discovery/confirmatory separation, function-class coverage, ablation, complexity, runtime, diagnostics and whether claims exceed evidence. Distinguish fatal problems from repairable gaps.

Write `reviews/<candidate>/REVIEW_<round>.md` with evidence, strengths, fatal and major issues, minimum repairs and one verdict: `ACCEPT`, `REVISE` or `REJECT`. Recommend confirmatory evaluation only when the candidate and protocol are frozen. Do not rewrite results to defend a weak claim; return a rejected candidate to `metaheuristic-idea` with the falsified assumption recorded.
