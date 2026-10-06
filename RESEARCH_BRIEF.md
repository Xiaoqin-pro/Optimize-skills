# Research Brief

## Goal

Discover simple, interpretable and mechanism-driven improvements to population-based swarm optimization. The goal is not another metaphor-only optimizer.

## Baselines

Primary baselines: PSO, CSO and ABC. Add stronger baselines only after a literature review and record the reason for adding them.

## Questions

1. Why do existing swarm algorithms prematurely converge on multimodal or rotated landscapes?
2. Can population information flow be modified without many new hyperparameters?
3. Can search behavior depend on measured swarm state instead of arbitrary schedules?

## Preferred Novelty

Prefer new information-flow mechanisms, adaptive interaction topology, state-dependent search, population-distribution modeling, principled stagnation detection and low-parameter diversity control.

Treat chaotic-map substitution, Lévy-flight insertion, opposition-based learning, arbitrary mutation insertion, cosmetic adaptive weights and unexplained hybridization as high-risk until a mechanism-specific hypothesis is demonstrated.

## Compute

MATLAB on the local machine. Backends are `cpu`, `gpu` and `auto`; use CPU by default for light CEC functions. GPU selection is meaningful only when the algorithm and objective implement GPU execution; the bundled CEC MEX paths are CPU. The generic backend benchmark is a screening signal, not a CEC speed claim. Cheap pilot experiments may screen many candidates before medium and confirmatory experiments.

## Experimental Levels

- Smoke: one function, one dimension, one seed; validates implementation and FE accounting.
- Pilot: 5 functions, dimension 30, 5 seeds; screens candidates.
- Medium: multiple function classes, stronger baselines, mechanism diagnostics and minimal ablation.
- Confirmatory: frozen candidate, fixed seeds, target benchmark protocol and formal statistics.

## Promotion Criteria

A candidate must have credible novelty, avoid obvious algebraic equivalence, improve across more than isolated functions, show mechanism-specific evidence, survive ablation and have acceptable complexity/runtime overhead.
