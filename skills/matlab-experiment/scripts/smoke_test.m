function record = smoke_test()
%SMOKE_TEST Validate runner, FE accounting, seed handling and result schema.
config = struct();
config.candidate_id = 'smoke';
config.candidate_version = 'v1';
config.algorithm = @random_search;
config.objective = @sphere_objective;
config.benchmark_suite = 'synthetic';
config.function_id = 1;
config.function_class = 'unimodal';
config.dimension = 5;
config.population_size = 10;
config.max_fes = 100;
config.seed = 1001;
config.lower = -5 * ones(1, 5);
config.upper = 5 * ones(1, 5);
config.known_optimum = 0;
config.backend = 'cpu';

[record, ~] = run_one(config);
assert(strcmp(record.exit_status, 'ok'), record.error_message);
assert(record.actual_fes <= record.max_fes);
assert(~isnan(record.best_objective));

    function f = sphere_objective(X, ~)
        f = sum(X.^2, 2);
    end

    function [best_f, best_x, curve, diagnostics] = random_search(objfun, cfg)
        best_f = Inf;
        best_x = [];
        curve = zeros(ceil(cfg.max_fes / cfg.population_size), 1);
        diagnostics = struct('type', 'smoke');
        used = 0;
        k = 0;
        while used < cfg.max_fes
            batch = min(cfg.population_size, cfg.max_fes - used);
            X = cfg.lower + rand(batch, cfg.dimension) .* (cfg.upper - cfg.lower);
            f = objfun(X);
            used = used + batch;
            k = k + 1;
            [value, index] = min(f);
            if value < best_f
                best_f = value;
                best_x = X(index, :);
            end
            curve(k) = best_f;
        end
        curve = curve(1:k);
    end
end
