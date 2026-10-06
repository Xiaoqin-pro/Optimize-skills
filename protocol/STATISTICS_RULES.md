# Statistics Rules

1. Validate result integrity before interpreting performance.
2. Report mean, median, standard deviation, IQR, min and max for each algorithm × function × dimension.
3. Report function-level win/tie/loss and effect size; ignore numerically negligible differences under a stated tolerance.
4. Use Wilcoxon signed-rank for paired comparisons where appropriate, Friedman for multiple algorithms, and Holm correction for post-hoc control comparisons.
5. Report p-values together with effect sizes and practical magnitude.
6. Check robustness by function class, dimension, seed sensitivity and runtime overhead.
7. A single favorable benchmark or p-value is not sufficient for promotion.
