public function isIsogram(string sentence) returns boolean {
    int[] partes = sentence
        .toLowerAscii()
        .toCodePointInts()
        .sort()
        .filter(p => p >= 97 && p <= 122);
    foreach int i in 1 ..< partes.length() {
        if (partes[i] == partes[i - 1]) {
            return false;
        }
    }
    return true;
}
