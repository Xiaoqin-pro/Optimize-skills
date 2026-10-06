---
name: metaheuristic-research-pipeline
description: "User-facing entry point for a complete MATLAB swarm-optimization research project from literature through review; do not use for a single experiment or analysis."
metadata:
  short-description: Run the complete metaheuristic research workflow
---

# Metaheuristic Research Pipeline

Run the goal in `$ARGUMENTS`. Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `RESEARCH_STATE.json`, `protocol/MATLAB_STYLE.md` and the relevant protocol files.

## Stages

1. **Literature:** use the installed `research-lit` skill and build `idea-stage/LITERATURE_MAP.md` focused on mechanisms, failure modes, closest families and benchmark protocols. Use `research-wiki` for persistent knowledge.
2. **Discovery:** invoke `metaheuristic-outer-loop`, which owns candidate generations, novelty gates, MATLAB smoke/pilot/medium runs and negative-result memory.
3. **Refinement and planning:** use `metaheuristic-refine` and `metaheuristic-experiment-plan` before medium or confirmatory execution.
4. **Execution:** use `matlab-experiment`. Default to CPU; permit `gpu` or measured `auto` selection for heavy vectorized fitness evaluation. Record backend and hardware.
5. **Analysis:** use `metaheuristic-analyze` for integrity, descriptive statistics, nonparametric tests, effect sizes and mechanism diagnostics.
6. **Review:** use `metaheuristic-review-loop` for novelty, fairness, simplicity, reproducibility and claim strength.
7. **Evidence audit:** verify equations, benchmark definitions, raw result integrity, seed policy, ablations, statistics and literature support before writing a paper.

Do not create or invoke fund-application, patent, grant, GPU-cluster queue or unrelated domain skills from this package. Use existing general paper/citation skills only after the scientific evidence is stable.
