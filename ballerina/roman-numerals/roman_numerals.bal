# Convert an integer to a Roman number.
#
# + number - the integer to convert
# + return - the Roman number as a string
function roman(int number) returns string {
    string unidade  = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"][number % 10];
    string dezena   = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"][(number % 100) / 10];
    string centena  = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"][(number % 1000) / 100];
    string milhar   = ["", "M", "MM", "MMM"][number / 1000];
    
    return milhar + centena + dezena + unidade;
}
