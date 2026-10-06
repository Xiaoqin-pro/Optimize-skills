---
name: metaheuristic-review-loop
description: Critically review swarm-optimization research for novelty, mechanism quality, fair FE budgets, statistical validity, ablation, reproducibility and claim strength.
metadata:
  short-description: Adversarially review optimization research
---

# Metaheuristic Review Loop

Review `$ARGUMENTS` using `AGENTS.md`, the literature map, candidate specification, experiment reports, statistics and raw-result audit. Use the installed paper/citation skills only when the requested deliverable requires them.

## Reviewer Questions

- Is the mechanism new after metaphor removal and equation expansion?
- Is it algebraically equivalent to a known schedule, mutation, restart, topology or archive method?
- Is the causal hypothesis clear and falsifiable?
- Are candidate and baselines compared with equal objective evaluations?
- Were seeds fixed before confirmatory evaluation?
- Were pilot and confirmatory suites separated?
- Do gains span function classes and dimensions?
- Does ablation isolate the proposed mechanism?
- How many hyperparameters and how much runtime overhead were added?
- Do diagnostics support the proposed explanation?
- Are claims narrower than the evidence?

## Output

Write `reviews/<candidate>/REVIEW_<round>.md` with strengths, fatal issues, major issues, required minimum experiments, reproducibility gaps and a verdict: `ACCEPT`, `REVISE` or `REJECT`.

If one decisive experiment is missing, specify the smallest one. If the mechanism is weak, return to `metaheuristic-outer-loop` instead of indefinitely patching the same idea.
