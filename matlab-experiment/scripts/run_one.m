function [record, trace] = run_one(config)
%RUN_ONE Run one reproducible metaheuristic experiment.
%   Algorithm contract:
%   [best_f,best_x,trace,diagnostics] = algorithm(objfun, config)
%   The algorithm must pass an N-by-D population to objfun. objfun returns
%   one objective value per row and is the only counted evaluation path.

if nargin ~= 1 || ~isstruct(config)
    error('run_one:InvalidConfig', 'config must be a struct.');
end
required = {'candidate_id','candidate_version','algorithm','objective', ...
    'dimension','population_size','max_fes','seed','benchmark_suite','function_id'};
for i = 1:numel(required)
    if ~isfield(config, required{i})
        error('run_one:MissingField', 'Missing config field: %s', required{i});
    end
end

if ~isfield(config, 'backend')
    config.backend = 'cpu';
end
if ~isfield(config, 'known_optimum')
    config.known_optimum = NaN;
end
if ~isfield(config, 'function_class')
    config.function_class = '';
end
if ~isfield(config, 'lower')
    config.lower = -100 * ones(1, config.dimension);
end
if ~isfield(config, 'upper')
    config.upper = 100 * ones(1, config.dimension);
end

rng(config.seed, 'twister');
eval_count = 0;
trace = [];
diagnostics = struct();
record = make_record(config);
t0 = tic;

try
    algorithm = config.algorithm;
    if ischar(algorithm) || isstring(algorithm)
        algorithm = str2func(char(algorithm));
    end
    objective = config.objective;
    if ischar(objective) || isstring(objective)
        objective = str2func(char(objective));
    end
    counted_obj = @counted_objective;
    [best_f, best_x, trace, diagnostics] = algorithm(counted_obj, config);
    record.best_objective = best_f;
    record.best_x = best_x;
    record.actual_fes = eval_count;
    record.runtime_seconds = toc(t0);
    record.error = best_f - config.known_optimum;
    record.exit_status = 'ok';
catch ME
    record.actual_fes = eval_count;
    record.runtime_seconds = toc(t0);
    record.exit_status = ['failed:' ME.identifier];
    record.error_message = ME.message;
end

if record.actual_fes > config.max_fes
    record.exit_status = 'failed:fe_budget_exceeded';
end

    function values = counted_objective(X)
        if isvector(X)
            X = reshape(X, 1, []);
        end
        n = size(X, 1);
        if eval_count + n > config.max_fes
            X = X(1:max(0, config.max_fes - eval_count), :);
            n = size(X, 1);
        end
        if n == 0
            values = zeros(0, 1);
            return;
        end
        values = objective(X, config);
        values = values(:);
        if numel(values) ~= n
            error('run_one:ObjectiveShape', ...
                'Objective returned %d values for %d candidates.', numel(values), n);
        end
        eval_count = eval_count + n;
    end
end

function record = make_record(config)
record = struct();
record.candidate_id = config.candidate_id;
record.candidate_version = config.candidate_version;
if isa(config.algorithm, 'function_handle')
    record.algorithm = func2str(config.algorithm);
else
    record.algorithm = char(config.algorithm);
end
record.benchmark_suite = config.benchmark_suite;
record.function_id = config.function_id;
record.function_class = config.function_class;
record.dimension = config.dimension;
record.seed = config.seed;
record.population_size = config.population_size;
record.max_fes = config.max_fes;
record.actual_fes = 0;
record.best_objective = NaN;
record.known_optimum = config.known_optimum;
record.error = NaN;
record.runtime_seconds = NaN;
record.backend = config.backend;
record.exit_status = 'not_started';
record.best_x = [];
record.error_message = '';
end
