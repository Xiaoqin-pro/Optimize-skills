---
name: metaheuristic-novelty-gate
description: Evaluate mechanism-level novelty of PSO, CSO, ABC and related metaheuristic ideas before implementation; detect metaphor-only novelty, algebraic equivalence and unmotivated operator stacking.
metadata:
  short-description: Screen swarm-optimization ideas for real novelty
---

# Metaheuristic Novelty Gate

Evaluate the proposal in `$ARGUMENTS` before it enters implementation. Read the project `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/NOVELTY_RULES.md`, the candidate idea file and relevant `research-wiki` entries. Use the installed `research-lit` or `novelty-check` skill when literature evidence is needed.

## Workflow

1. **Normalize.** Rewrite the proposal without biological metaphors. List state variables, population statistics, sampling distributions, information sources, topology, memory, perturbations and update equations.
2. **Equivalence check.** Expand the equations and map them to known inertia/acceleration schedules, Gaussian/Cauchy/differential/Lévy mutation, opposition sampling, restart, archive guidance, topology switching or diversity-triggered adaptation. Explain any mapping explicitly.
3. **Mechanism search.** Search papers using mechanism terms and synonyms, not only the proposed algorithm name. Search for the failure mode, causal mechanism and closest operators.
4. **Hybridization test.** If it combines known operators, require a falsifiable interaction hypothesis and an experiment that distinguishes interaction from additive stacking.
5. **Verdict.** Return `PASS`, `HOLD` or `REJECT`. `HOLD` is required when evidence is ambiguous.

## Required Output

Write `ideas/<candidate>/NOVELTY.md` with:

- Mechanism summary
- Failure mode and causal hypothesis
- Closest mechanisms and papers
- Algebraic-equivalence analysis
- Novelty risk: LOW / MEDIUM / HIGH
- Verdict: PASS / HOLD / REJECT
- Why
- Evidence that could change the verdict

Do not call an idea novel merely because an exact equation was not found. Do not reject a whole algorithm family merely because it is established; judge the proposed mechanism.
