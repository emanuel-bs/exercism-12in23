function transform(input::AbstractDict)
    Dict(
    #     lowercase.(letter) => score
    #     for (score,letters) in input
    #         for letter in letters
        lowercase.(letter) => score.first
        for score = input
            for letter = score.second
    )
end
