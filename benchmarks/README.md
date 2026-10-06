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

## Machine-readable manifests and adapters

Each suite has a manifest under `manifests/` and an N-by-D adapter under `adapters/`. Read the manifest before constructing an experiment. The adapter handles the official D-by-N input convention; experiment code should call the adapter with N-by-D populations.

CEC2020's `cec20_func` exposes wrapper IDs `1..10`; its C++ source internally maps them to the underlying labels `[1,2,3,7,4,16,6,22,24,25]`. Pass the wrapper ID from the manifest to `cec2020_adapter`, never an underlying label. CEC2022's MEX accepts dimensions `2,10,20`, while its bundled official runner and confirmatory protocol use `10,20`; treat 2D as exploratory only.

Do not add every suite with one `addpath(genpath(...))`. Suite folders contain different MEX entrypoints and example helpers. Load only the selected suite and its adapter:

```matlab
root = fileparts(mfilename('fullpath'));
suite_path = fullfile(root, 'ready', 'CEC2022');
addpath(suite_path);
addpath(fullfile(root, 'adapters'));
f = cec2022_adapter(rand(20, 10), 1);
rmpath(suite_path);
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
