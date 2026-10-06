function f = cec2019_adapter(X, function_id)
%CEC2019_ADAPTER Adapt an N-by-D population to the official CEC entrypoint.
if nargin ~= 2
    error('cec2019_adapter:InvalidInput', 'Use f = cec2019_adapter(X, function_id).');
end
if isvector(X)
    X = reshape(X, 1, []);
end
X = double(X);
values = cec19_func(X', function_id);
f = double(values(:));
if numel(f) ~= size(X, 1)
    error('cec2019_adapter:OutputShape', 'CEC output size does not match population size.');
end
end
