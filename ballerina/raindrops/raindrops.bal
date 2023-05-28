public function convert(int n) returns string {
    string onomatopoeia = "";
    if n % 3 == 0 { onomatopoeia += "Pling"; }
    if n % 5 == 0 { onomatopoeia += "Plang"; }
    if n % 7 == 0 { onomatopoeia += "Plong"; }
    return onomatopoeia.length() == 0 ? n.toString() : onomatopoeia;
}
