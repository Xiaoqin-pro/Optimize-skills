function [ok, messages] = validate_result_table(input_data)
%VALIDATE_RESULT_TABLE Check required fields and basic FE integrity.
if istable(input_data)
    data = input_data;
elseif isfile(input_data)
    data = readtable(input_data, 'TextType', 'string');
else
    error('validate_result_table:InvalidInput', 'Input must be a table or file path.');
end

required = {'candidate_id','candidate_version','algorithm','benchmark_suite', ...
    'function_id','dimension','seed','population_size','max_fes','actual_fes', ...
    'best_objective','runtime_seconds','backend','exit_status'};
messages = strings(0, 1);
names = string(data.Properties.VariableNames);
for i = 1:numel(required)
    if ~ismember(required{i}, names)
        messages(end+1, 1) = "missing field: " + required{i}; %#ok<AGROW>
    end
end
if isempty(messages)
    if any(data.actual_fes < 0 | data.actual_fes > data.max_fes)
        messages(end+1, 1) = "actual_fes violates [0, max_fes]"; %#ok<AGROW>
    end
    if any(data.population_size <= 0 | data.dimension <= 0)
        messages(end+1, 1) = "population_size and dimension must be positive"; %#ok<AGROW>
    end
    if any(ismissing(string(data.exit_status)))
        messages(end+1, 1) = "exit_status contains missing values"; %#ok<AGROW>
    end
end
ok = isempty(messages);
end
