---
name: metaheuristic-idea-discovery
description: "Use after CORE_FAILURE_QUESTION.md exists to generate and screen one batch of mechanism-driven swarm-optimization candidates with MATLAB pilots."
metadata:
  short-description: Generate and pilot-test optimization mechanisms
---

# Metaheuristic Idea Discovery

For the goal in `$ARGUMENTS`, first invoke or follow `metaheuristic-pain-first-idea-discovery` to define a core failure question, claim card and kill pilot. Then read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/IDEA_LIFECYCLE.md`, the literature map and prior `ideas/` / `research-wiki/` records. Use the installed `research-lit` skill to build or update a mechanism and failure-mode map.

## Default Batch

- Generate 8 structurally diverse candidates.
- Run the novelty gate on all candidates.
- Pilot at most 4 candidates.
- Pilot: 5 functions, dimension 30, 5 fixed seeds.
- Use a 10-minute per-candidate timeout unless the user sets another limit.

## Candidate Contract

Every candidate must state:

1. failure mode;
2. causal hypothesis;
3. intervention and mathematical update;
4. why known mechanisms may not already implement it;
5. expected function classes affected;
6. predicted mechanism diagnostic;
7. cheapest falsification experiment;
8. added hyperparameters and runtime overhead.

Generate candidates from different causal lenses: information flow, topology, stagnation detection, distribution modeling, state-dependent sampling and memory. Do not generate eight coefficient variations of one operator.

## Screening

Reject before implementation when the novelty gate rejects, the idea is metaphor-only, or the hypothesis is not falsifiable. Implement the smallest version that can test the hypothesis. Use `matlab-experiment` for smoke and pilot runs, then `metaheuristic-analyze` for promotion decisions.

Keep failed candidates and their lessons in `research-wiki` or `ideas/<candidate>/FAILURE.md`. Never select only the best observed seed.
