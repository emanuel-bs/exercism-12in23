# Returns the acronym of the given phrase.
#
# + phrase - a string
# + return - the acronym
function abbreviate(string phrase) returns string {
    string[] palavras = re `[\s\-_]+`.split(phrase);
    return string:'join("", ...palavras.'map(palavra => palavra[0].toUpperAscii()));
}
