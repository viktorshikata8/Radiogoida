% removes all rows in table that have N column value less than epsilon
function tbl = strip_by_epsilon(tbl, col, epsilon)
    tbl(tbl{:, col} < epsilon, :) = [];
end