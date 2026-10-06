---
name: metaheuristic-outer-loop
description: "Run multi-generation discovery of swarm-optimization mechanisms: generate candidates, novelty-screen, implement MATLAB pilots, learn from negative results and promote only statistically supported ideas."
metadata:
  short-description: Orchestrate generations of optimization ideas
---

# Autonomous Metaheuristic Research Outer Loop

Run the research goal in `$ARGUMENTS`. Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/IDEA_LIFECYCLE.md`, the literature map, prior generations and negative-result records.

## Defaults

- At most 8 generations.
- 8 candidates per generation.
- At most 5 novelty passes, 4 pilot candidates, 2 medium candidates and 1 confirmatory candidate per generation.
- At most 50 total candidates.
- After two scientifically failed candidates from one mechanism family, deprioritize that family.

## Generation Flow

1. Invoke `metaheuristic-pain-first-idea-discovery` when a new research question is needed. Build a failure map from literature, diagnostics and negative experiments. Ask what behavior remains unexplained; do not ask for generic "new ideas".
2. Generate structurally diverse candidates with failure mode, cause, update, predicted diagnostic, falsification test, hyperparameters and overhead.
3. Run `metaheuristic-novelty-gate`; reject or hold weak candidates.
4. Implement the smallest testable version and run `matlab-experiment` smoke tests.
5. Run pilot experiments and analyze with `metaheuristic-analyze`.
6. Promote at most two candidates to medium evaluation with stronger baselines, diagnostics and minimal ablation.
7. Freeze any confirmatory candidate's equations, parameters, seeds, suite and FE budget before execution.
8. Record every technical and scientific failure, lessons learned and deprioritized families in `research-wiki` or the generation directory.
9. Generate the next generation from unresolved failure modes, not from coefficient tweaks.

## Decisions and Stops

Classify each candidate as `PROMISING`, `AMBIGUOUS` or `FAILED`. Stop on the configured generation/candidate limit, a confirmed candidate with adequate review, exhausted research space, repeated absence of new mechanisms or user instruction. Write `ideas/generation_<n>/GENERATION_REPORT.md` and, at the end, `AUTONOMOUS_RESEARCH_REPORT.md` with the full history and limitations.

Never delete negative runs, change seeds after seeing outcomes, expand only the proposed method's budget, or claim publication-level novelty from benchmark scores alone.
