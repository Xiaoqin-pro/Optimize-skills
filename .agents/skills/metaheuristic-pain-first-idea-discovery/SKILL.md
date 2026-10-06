---
name: metaheuristic-pain-first-idea-discovery
description: "Use only before a core failure question is frozen: discover important optimization failures, competing explanations and killable mechanisms before proposing operators."
metadata:
  short-description: Find and kill weak optimization ideas early
---

# Pain-First Metaheuristic Idea Discovery

Use this skill for `$ARGUMENTS` before asking for "a novel PSO/CSO/ABC variant". Read `AGENTS.md`, `RESEARCH_BRIEF.md`, `protocol/NOVELTY_RULES.md`, prior `research-wiki` / idea ledgers and the current benchmark protocol. Use the installed `research-lit` skill for literature retrieval.

## Non-negotiable principles

- Stakes first -> reproducible pain -> mechanism -> operator.
- Freeze the research question and success criteria, not the solution.
- "Not found in search" is not proof of novelty. Record databases, queries, dates and evidence level: `[read]`, `[snippet]` or `[recall]`.
- An idea must be allowed to die. Do not narrow the claim, add modules or retune indefinitely to save it.
- A reviewer/red team tries to kill the idea; it does not help defend it.

## Phase 1 - Core Failure Question

Write a `CORE_FAILURE_QUESTION.md` that specifies:

- an important and repeatable failure regime;
- competing explanations for the failure;
- algorithms/papers that rely on each explanation;
- what is settled and what remains disputed;
- benchmark suite/version, function IDs, dimensions and FE budget where the failure is observable;
- why resolving the mechanism would change design practice.

Examples of regimes include rotated multimodal, hybrid/composition, high-dimensional, noisy or constrained landscapes. Do not start from an algorithm name alone.

## Phase 2 - Settledness and Floor Search

Use literature to check whether the core question has already been resolved. Search closest mechanisms and equation forms, not only names. Define a floor: the weakest result that still has scientific value, such as identifying a failure-regime boundary or falsifying a popular explanation. Build a `LITERATURE_MAP.md` with source links and evidence level.

## Phase 3 - Demand / Claim Card

Before generating mechanisms, write `CLAIM_CARD.md` containing:

- ceiling claim;
- floor claim;
- assumptions;
- every plausible experimental result and its interpretation;
- kill criteria;
- a <=30-minute MATLAB kill pilot;
- benchmark discovery/development/confirmatory separation.

Make competing explanations explicit:

```text
H1: proposed mechanism is causal
H2: a simpler known mechanism explains the result
H0: neither mechanism changes the target failure
```

Add a prediction table with rows for objective performance, the decisive mechanism diagnostic, runtime and matched controls. For each plausible outcome write the interpretation before running the experiment. Include an `escape-hatch audit`: for every explanation, state what result would genuinely falsify it. If no possible result can falsify an explanation, the experiment is not discriminating.

Use the labels `KILL`, `WOUND` and `MISS` in the card:

- `KILL`: the core explanation or novelty is falsified.
- `WOUND`: the effect is incomplete, regime-limited or underpowered; one targeted test may be justified.
- `MISS`: the pilot failed technically or did not measure the decisive observable; repair the setup without changing the question.

If only the hoped-for result is valuable, mark the idea as high p-hacking risk and revise it.

## Phase 4 - Clear the Obvious, Then Generate Wide

First list obvious levers that are not novelty by themselves: adaptive inertia or acceleration, mutation, Lévy flight, chaotic map, opposition learning, restart, archive, topology switching and unexplained A+B hybridization.

Then generate candidates from distinct families such as information-source decorrelation, directional entropy, adaptive interaction graphs, history-conditioned selection, distribution-shape control, state-transition detection, matched null mechanisms and cross-regime interventions. Each candidate includes a falsifiable prediction and mechanism diagnostic.

## Phase 5 - Analytic Pre-check

Expand the update equation and remove names. Check algebraic equivalence to known operators. Construct a simpler null mechanism, such as random perturbation plus an adaptive coefficient, and ask whether it produces the same signature. If it does, kill or downgrade the candidate before expensive runs.

## Phase 6 - Independent Red Team

Run `metaheuristic-novelty-gate` or an independent reviewer with the instruction: "try to prove this idea is not worth doing." The red team must search for prior work, reparameterization, counterexamples, unfair FE accounting, negligible effect size, excessive overhead and claims that would not change design practice.

Write `RED_TEAM_SEARCH.md` recording query strings, databases, date, papers read, closest equations, attempted counterexamples and the final kill/wound/miss judgment. Separate `[read]`, `[snippet]` and `[recall]` evidence. Absence from a search remains evidence about search coverage, not proof of novelty.

## Phase 7 - Kill Pilot and Ledger

Run the smallest MATLAB experiment that can distinguish the competing explanations, using CEC or standard functions and fixed seeds. Prefer controls matched on perturbation magnitude or population diversity. Record the prediction table, escape-hatch audit and decisive observable together with the pilot results. Record all candidates in `IDEA_LEDGER.md`:

`question, candidate_id, mechanism_family, evidence, status, kill_reason, provisional_or_firm, next_question`

Sync durable lessons to `research-wiki`. A result that falsifies the mechanism is a successful scientific outcome. Only surviving candidates proceed to `metaheuristic-refine`, `metaheuristic-experiment-plan` and the outer loop.
