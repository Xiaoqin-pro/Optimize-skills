function report = benchmark_backend(population_sizes, dimensions, repeats)
%BENCHMARK_BACKEND Compare CPU and optional GPU batch fitness evaluation.
if nargin < 1, population_sizes = [30 100 500 1000]; end
if nargin < 2, dimensions = [30 100 500]; end
if nargin < 3, repeats = 5; end

rows = [];
for n = population_sizes
    for d = dimensions
        X = rand(n, d);
        t = zeros(repeats, 1);
        for r = 1:repeats
            t0 = tic; sum(X.^2, 2); t(r) = toc(t0);
        end
        row = struct('population', n, 'dimension', d, ...
            'cpu_seconds', median(t), 'gpu_seconds', NaN, 'speedup', NaN, ...
            'gpu_available', false);
        if exist('gpuDevice', 'file') == 2
            try
                g = gpuArray(X);
                wait(gpuDevice);
                tg = zeros(repeats, 1);
                for r = 1:repeats
                    t0 = tic; sum(g.^2, 2); wait(gpuDevice); tg(r) = toc(t0);
                end
                row.gpu_seconds = median(tg);
                row.speedup = row.cpu_seconds / row.gpu_seconds;
                row.gpu_available = true;
            catch
                row.gpu_available = false;
            end
        end
        rows = [rows; row]; %#ok<AGROW>
    end
end
report = struct2table(rows);
end
