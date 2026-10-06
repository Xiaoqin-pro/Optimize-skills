# MATLAB Code Style

The local reference project is `D:\111\Desktop\噜噜\teacher` (`main.m`, `PSO.m`, `LMS.m`). New research code should feel like that project: straightforward procedural MATLAB, compact function files, readable Chinese section comments and explicit loops where they make the algorithm easy to inspect.

## Required Style

- Use one main function per `.m` file. Keep the file name and primary function name identical.
- Prefer simple function signatures with positional inputs and multiple explicit outputs, for example `[best_f, curve, diagnostics] = PSO(...)`.
- Use section headers such as `%% 参数设置`, `%% 初始化`, `%% 迭代更新`, `%% 结果保存` in Chinese when the surrounding project is Chinese.
- Keep algorithm variables visible and familiar: `pop`, `V`, `pbest`, `gbest`, `fitness`, `itermax`, `popmin`, `popmax`, `Vmin`, `Vmax`, `Dimension`, `Particle_Number`.
- Use short inline comments beside non-obvious equations and Chinese comments for experiment intent.
- Use explicit `for` loops for update equations and boundary handling when that improves traceability. Vectorize only when it does not obscure the mechanism or FE count.
- Keep plotting and experiment orchestration in a `main.m`-style script; keep the optimizer and objective function in separate `.m` files.
- Preserve the simple procedural layout: parameter block → initialization → evaluation → iteration → curve/diagnostics → save/plot.

## Scientific Corrections to the Reference Style

Keep the visual and organizational style, but do not copy fragile legacy behavior:

- initialize every output and array before use;
- use `rng(seed,'twister')` rather than global legacy `rand('state',...)`;
- do not leave bare loop counters such as `G` to print to the console;
- do not rely on undeclared variables from another script;
- count objective evaluations explicitly;
- record status, runtime, seed, backend and diagnostics;
- use `parfor` or GPU only behind the documented backend switch;
- retain simple names, but use consistent names within a file and add a short header comment describing units and shapes.

## Function Header Template

```matlab
function [best_f, curve, diagnostics] = PSO(Dimension, maxgen, Particle_Number, ...
        Vmin, Vmax, Popmin, Popmax, objfun, seed, options)
%PSO  Particle swarm optimizer used by the research runner.
%   Dimension         : problem dimension
%   maxgen            : maximum generations (FE budget is enforced separately)
%   Particle_Number   : population size
%   objfun            : objective handle, one row or population matrix
%   seed              : fixed random seed for reproducibility
%   options.backend   : 'cpu', 'gpu' or 'auto'

rng(seed, 'twister');

%% 参数设置
...

%% 初始化
...

%% 迭代更新
...

%% 输出
...
end
```

Use this as a style guide, not as a requirement to preserve old bugs or exact variable names when a clearer name prevents a scientific error.
