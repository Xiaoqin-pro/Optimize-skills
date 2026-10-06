# Benchmark Functions

This folder contains downloaded benchmark implementations for MATLAB swarm-optimization experiments.

## Ready-to-use MATLAB folders

| Folder | Coverage | Notes |
|---|---|---|
| `ready/CEC2013` | CEC 2013 single-objective suite | Official MATLAB source archive; compile `cec13_func.cpp` with MATLAB `mex` before calling it. |
| `ready/CEC2014` | CEC 2014 single-objective suite | Official MATLAB archive; includes Windows `cec14_func.mexw64` and `input_data`. |
| `ready/CEC2017` | CEC 2017 single-objective bound-constrained suite | MATLAB files and Windows MEX/input data copied from the extended MATLAB repository. |
| `ready/CEC2019` | CEC 2019 100-digit challenge | MATLAB files and input data from the extended repository. |
| `ready/CEC2020` | CEC 2020 single-objective bound-constrained suite | Official MATLAB software package with Windows MEX/input data. |
| `ready/CEC2022` | CEC 2022 single-objective bound-constrained suite | MATLAB runner/MEX/input data from the official full-download package. |

The original repositories and archives remain under `official/` and `extended/` for provenance. Do not edit those copies in place; put adapters under the research project.

## Extended collection

`extended/CEC-Benchmark-Functions` contains MATLAB versions of CEC 2005, 2010, 2013, 2014, 2017, 2019 and CEC 2020-related functions, plus example scripts and input data. It is useful for smoke tests and cross-year comparisons, but for publication claims prefer the official suite and protocol for the target CEC year.

## Typical MATLAB setup

```matlab
root = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(root, 'ready', 'CEC2014')));
```

CEC implementations differ in input orientation and supported dimensions. Read the local `readme.txt` and official technical report before writing an adapter. Do not assume that every `cecXX_func` accepts the same shape.

A common CEC pattern is:

```matlab
% Some official suites use X as D-by-N and return one value per column.
% Confirm the orientation in that suite's readme before calling it.
f = cec14_func(X, func_id);
```

## Reproducibility

Record the benchmark year, repository commit, function ID, dimension, bounds, input orientation, objective offset convention, max FEs and seed schedule in every experiment. CEC functions often use shifted/rotated input files and fixed allowed dimensions; do not replace them with an unshifted textbook function while retaining the CEC label.

## Provenance

- Official CEC repositories: [P.-N. Suganthan GitHub](https://github.com/P-N-Suganthan), including [CEC2013](https://github.com/P-N-Suganthan/CEC2013), [CEC2014](https://github.com/P-N-Suganthan/CEC2014), [CEC2017-BoundContrained](https://github.com/P-N-Suganthan/CEC2017-BoundContrained), [CEC2020](https://github.com/P-N-Suganthan/2020-Bound-Constrained-Opt-Benchmark) and [CEC2022-SO-BO](https://github.com/P-N-Suganthan/2022-SO-BO).
- Extended MATLAB collection: [tsingke/CEC-Benchmark-Functions](https://github.com/tsingke/CEC-Benchmark-Functions).

The downloaded files are retained with their upstream notices. Check the upstream license and citation requirements before redistributing or publishing derived code.
