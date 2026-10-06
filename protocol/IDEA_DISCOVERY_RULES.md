# Idea Discovery Rules

Use these steps inside `metaheuristic-idea`; they preserve the detailed research method without adding separate skill routes.

## 1. Find a research failure

Start from an important, repeatable failure regime, not an optimizer name. Record competing explanations, the papers or algorithms that rely on them, what is settled, what remains disputed, the benchmark conditions where the failure appears and why resolving it could change design practice. Use `research-lit` for retrieval.

## 2. Check settledness and claim value

Search closest mechanisms and equation forms. Label evidence `[read]`, `[snippet]` or `[recall]`; record databases, queries, date and source links. Absence from search is evidence about search coverage, not proof of novelty. Define a ceiling claim, a useful floor claim, assumptions, kill criteria and the cheapest pilot that can distinguish the explanations. Write `CORE_FAILURE_QUESTION.md`, `LITERATURE_MAP.md` and `CLAIM_CARD.md`.

The claim card should state what each plausible result would mean, include a short kill pilot, separate discovery/development/confirmatory data, and identify an escape hatch that could otherwise protect the idea from falsification. If only the hoped-for result has value, revise the question before proposing a mechanism.

## 3. Generate candidate mechanisms

Generate structurally different candidates from the failure map, not coefficient variants. Each candidate states the observed failure, causal hypothesis, intervention and equations, expected regime, predicted diagnostic, cheapest falsification test, closest known mechanisms, new hyperparameters and runtime cost. Screen no more than 8 by default and pilot no more than 4.

## 4. Normalize and check novelty

Remove biological names. List state variables, information sources, topology, memory, sampling and update equations. Expand equations and check equivalence to known schedules, mutation, differential or Lévy perturbation, opposition sampling, restarts, archive guidance and diversity-triggered adaptation. Search by mechanism terms. A hybrid needs a falsifiable interaction hypothesis and a control that separates interaction from simple stacking. Return `PASS`, `HOLD` or `REJECT`; use `HOLD` when the closest mechanism is unclear.

## 5. Challenge before implementation

Construct the simplest null mechanism that might produce the same result. Ask a red-team reviewer to search for prior work, reparameterization, counterexamples, unfair FE accounting, negligible practical effect, excess overhead and claims that would not change design practice. Record query strings, sources, evidence level and `KILL`, `WOUND` or `MISS`. A missing technical measurement is `MISS`; a limited effect can be `WOUND`; a falsified mechanism is `KILL`.

## 6. Refine and retain lessons

Only surviving candidates receive `ideas/<candidate>/REFINED_SPEC.md`: normalized equations and pseudocode, update order, boundary handling, defaults, FE rule, complexity, predicted effects, mechanism diagnostics, minimal ablations and falsification criteria. Keep rejected candidates and negative results in `IDEA_LEDGER.md`; sync durable lessons to `research-wiki` when available. Do not add rescue mechanisms after a failed prediction without changing the hypothesis and recording the change.
