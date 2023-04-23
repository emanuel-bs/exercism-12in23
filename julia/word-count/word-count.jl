function wordcount(sentence)
    words = split(lowercase(replace(sentence, r"(?!\b'\b)[^\w ]" => " ")))

    wordcount = Dict{String,Int128}()

    for word in words
        wordcount[word] = get(wordcount, word, 0) + 1
    end
    wordcount
end
