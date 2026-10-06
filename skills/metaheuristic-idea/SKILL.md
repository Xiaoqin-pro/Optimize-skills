---
name: metaheuristic-idea
description: Discover and refine mechanism-driven research ideas for PSO, CSO, ABC and related optimizers, including failure analysis, literature settledness and novelty checks. Use before implementing a new method.
metadata:
  short-description: Find and screen optimization mechanisms
---

# Metaheuristic Idea

Use for `$ARGUMENTS`. Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/IDEA_DISCOVERY_RULES.md`, `protocol/NOVELTY_RULES.md`, prior idea records and the target benchmark protocol. Use `research-lit` for literature retrieval; use `research-wiki` for persistent lessons when available.

## Phases

1. **Failure question:** define a repeatable regime, competing explanations and why resolving it matters. Produce `CORE_FAILURE_QUESTION.md`.
2. **Settledness and claim:** map closest work with source links and evidence levels; define ceiling/floor claims, assumptions, kill criteria and a discriminating pilot. Produce `LITERATURE_MAP.md` and `CLAIM_CARD.md`.
3. **Mechanism candidates:** generate structurally different, falsifiable mechanisms from the failure map. State equations, causal predictions, diagnostics, null controls and overhead.
4. **Novelty and equivalence:** normalize equations, search closest mechanisms and return `PASS`, `HOLD` or `REJECT`. Do not equate missing search results with novelty.
5. **Pre-experiment red team:** try to falsify the candidate and compare it with a simpler null. Record evidence, `KILL`/`WOUND`/`MISS` and the decision in `RED_TEAM_SEARCH.md` and `IDEA_LEDGER.md`.
6. **Refined spec:** only for survivors, write `REFINED_SPEC.md` with update order, boundary handling, complexity, defaults, diagnostics, ablations and falsification criteria.

Read the linked protocol files for detailed criteria. Preserve failed ideas and negative results; do not add rescue operators after a failed prediction without stating a new hypothesis.
