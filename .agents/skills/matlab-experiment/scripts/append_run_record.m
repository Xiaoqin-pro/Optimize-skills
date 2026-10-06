function append_run_record(output_file, record)
%APPEND_RUN_RECORD Append a run struct to a CSV/table without overwriting it.
if ~isstruct(record)
    error('append_run_record:InvalidRecord', 'record must be a struct.');
end
new_table = struct2table(record);
if isfile(output_file)
    old_table = readtable(output_file, 'TextType', 'string');
    names = union(old_table.Properties.VariableNames, new_table.Properties.VariableNames, 'stable');
    for i = 1:numel(names)
        name = names{i};
        if ~ismember(name, old_table.Properties.VariableNames)
            old_table.(name) = missing(height(old_table), 1);
        end
        if ~ismember(name, new_table.Properties.VariableNames)
            new_table.(name) = missing(height(new_table), 1);
        end
    end
    new_table = new_table(:, names);
    old_table = old_table(:, names);
    writetable([old_table; new_table], output_file);
else
    parent = fileparts(output_file);
    if ~isempty(parent) && ~isfolder(parent)
        mkdir(parent);
    end
    writetable(new_table, output_file);
end
end
