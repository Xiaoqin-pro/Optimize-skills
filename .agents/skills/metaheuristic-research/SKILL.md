---
name: metaheuristic-research
description: Orchestrate an end-to-end research project on MATLAB swarm and metaheuristic optimization, from literature and mechanism ideas through experiments, analysis and review. Use for whole projects or bounded multi-generation search.
metadata:
  short-description: Run metaheuristic research end to end
---

# Metaheuristic Research

Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `RESEARCH_STATE.json` and relevant files under `protocol/`. Use `python scripts/research_state.py` for state changes.

## Modes

- `single` is the default: carry one research question through evidence review, idea, experiment, analysis and final review; stop with a clear next action.
- `autonomous` runs bounded generations only when the user asks for ongoing or multi-generation discovery. Default limit: 5 generations. Honor any smaller user limit and stop at the requested stage, including before confirmatory evaluation.

## Workflow

1. Use `research-lit` to build or refresh the mechanism-focused literature map; use `research-wiki` when available for durable knowledge.
2. Use `metaheuristic-idea` to define the failure question and produce a screened candidate specification.
3. Use `matlab-experiment` to plan and execute the requested level.
4. Use `metaheuristic-analyze` to validate results, test mechanism predictions and judge claim support.
5. Use `metaheuristic-review` for an adversarial evidence review.
6. If rejected, record the failure and return to a structurally different idea. If accepted, freeze the candidate and plan confirmatory work or paper preparation as requested.

In autonomous mode, update state at each phase boundary, preserve negative results, respect configured candidate/generation limits and report why the loop stopped. Do not claim publication-level novelty from benchmark scores alone. Use existing `paper-writing` and `citation-audit` skills only when the user requests paper work.
