function largest_product(str, span)
    if span > length(str) || span < 0 || (length(str) == 0 && span > 0)
        throw(ArgumentError("Invalid span"))
    end
    num = [parse(Int8, c) for c in str]
    maximum(prod(num[i.+(1:span)])
            for i in 0:(length(str)-span))
end