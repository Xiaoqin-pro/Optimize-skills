function f = cec2020_adapter(X, function_id)
%CEC2020_ADAPTER Adapt an N-by-D population to the official CEC entrypoint.
if nargin ~= 2
    error('cec2020_adapter:InvalidInput', 'Use f = cec2020_adapter(X, function_id).');
end
if isvector(X)
    X = reshape(X, 1, []);
end
X = double(X);
values = cec20_func(X', function_id);
f = double(values(:));
if numel(f) ~= size(X, 1)
    error('cec2020_adapter:OutputShape', 'CEC output size does not match population size.');
end
end
