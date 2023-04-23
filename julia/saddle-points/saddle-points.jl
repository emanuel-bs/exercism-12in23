function saddlepoints(M)
    coluna = minimum(M, dims=1, init=Inf64)
    linha = maximum(M, dims=2, init=-Inf64)
    Tuple.(findall(coluna .== linha))
end
