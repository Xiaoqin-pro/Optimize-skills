# Learning-Augmented Optimization Rules

Use this protocol whenever a candidate learns a policy, value function, operator-selection rule, surrogate, restart rule, topology, population allocation or parameter controller during optimization. A learned component is a research mechanism, not a decorative module.

## Candidate Types

Record one primary type in the candidate specification:

- **Fixed mechanism:** a state-dependent equation or topology with no learned policy.
- **Contextual bandit / hyper-heuristic:** selects operators, neighborhoods, topology actions or resource allocation from measured population state.
- **Reinforcement-learning controller:** defines state, action, reward, transition horizon, policy/value update and reset semantics.
- **Surrogate or learned model:** predicts objective, ranking, uncertainty, basin transitions or useful search directions.
- **Meta-learned controller:** is trained across a declared distribution of landscapes and evaluated on held-out landscapes.

Do not call a method learning-based merely because it has an adaptive coefficient, random choice or feedback condition.

## Required Specification

For every learned component, write:

- state features and their timing; avoid features that use future evaluations or test labels;
- action space and whether actions change search operators, topology, population size, restart, evaluation allocation or parameters;
- reward definition, scale, delay, discount and credit assignment;
- policy/value/model initialization, update schedule, exploration rule and reset between independent runs;
- training budget, optimization budget, wall-clock and memory overhead;
- fixed, random, bandit and stronger non-learning controls;
- train/validation/test landscape split when learning across instances;
- what is frozen before validation and confirmatory evaluation;
- the predicted mechanism signature and a falsification experiment.

## No Leakage and Fair Budgets

- Never select hyperparameters, reward weights, actions or stopping rules from confirmatory landscapes.
- If learning consumes objective evaluations, count them in the same FE budget. If it learns across offline landscapes, report the meta-training cost separately and keep test landscapes untouched.
- Do not use test outcomes to update the policy, replay buffer, surrogate or operator ranking.
- Compare against a fixed controller, a simple feedback controller with matched state information, and a non-learning null with matched action or evaluation overhead.
- Report both optimization performance and controller cost. A learned controller that wins only after an unreported training budget is not a fair comparison.

## Diagnostics and Generalization

Log action frequencies, policy entropy or uncertainty, reward curves, state coverage, intervention timing, operator transitions, restart decisions and failure-regime coverage when applicable. Test whether the learned policy behaves as predicted on unseen functions, dimensions, rotations, compositions, noise levels or constraints. A policy that memorizes function IDs is not generalization.

For an RL controller, report at least:

```text
state -> action -> objective consequence -> reward -> update
```

Use ablations for no-learning/fixed policy, reward variants, state features, exploration and update frequency. Prefer the simplest controller that explains the observed gain.
