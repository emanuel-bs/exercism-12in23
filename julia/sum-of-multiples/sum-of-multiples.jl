function sum_of_multiples(limit, factors)
    nonzero_factors = filter(f -> !iszero(f), factors)
    is_multiple(i) = any(f -> iszero(mod(i, f)), nonzero_factors)
    filter(is_multiple, 1:(limit-1)) |>
    sum
end