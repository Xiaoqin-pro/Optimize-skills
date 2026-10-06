---
name: metaheuristic-refine
description: Refine a swarm-optimization idea into a precise, minimal MATLAB-ready mechanism with equations, assumptions, diagnostics, complexity and falsifiable predictions.
metadata:
  short-description: Turn an optimization idea into a testable mechanism
---

# Metaheuristic Refinement

Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/MATLAB_STYLE.md`, the candidate's novelty report and pilot results. Refine the candidate without adding rescue mechanisms that were not part of the hypothesis.

## Deliverable

Write or update `ideas/<candidate>/REFINED_SPEC.md` containing:

- problem definition and objective convention;
- baseline algorithm and exact point of intervention;
- normalized equations and pseudocode;
- state variables and update order;
- boundary handling and constraint handling;
- hyperparameters and defaults;
- FE accounting and stopping rule;
- time and memory complexity;
- predicted effect by landscape/function class;
- mechanism diagnostics;
- minimal ablation plan;
- implementation risks and falsification criteria.

## Decisions

Prefer low-parameter, state-dependent mechanisms. If the pilot does not support the causal hypothesis, mark the candidate `HOLD` or `REJECT` and record the lesson instead of adding unrelated operators. If the mechanism is algebraically equivalent to a known method, update the novelty verdict and stop refinement until the research question changes.
