function results = run_batch(configs, output_file, use_parallel)
%RUN_BATCH Run a list of independent configurations and write one table.
if nargin < 2
    output_file = '';
end
if nargin < 3
    use_parallel = false;
end
if ~isstruct(configs)
    error('run_batch:InvalidConfigs', 'configs must be a struct array.');
end

n = numel(configs);
if n == 0
    results = table();
    return;
end
first_record = run_one(configs(1));
records = repmat(first_record, n, 1);
records(1) = first_record;
if use_parallel && license('test', 'Distrib_Computing_Toolbox') && n > 1
    parfor i = 2:n
        records(i) = run_one(configs(i));
    end
else
    for i = 2:n
        records(i) = run_one(configs(i));
    end
end

results = struct2table(records);
if ~isempty(output_file)
    parent = fileparts(output_file);
    if ~isempty(parent) && ~isfolder(parent)
        mkdir(parent);
    end
    writetable(results, output_file);
end
end
