const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    if (str.len <= 25) return false;
    var alfabeto = std.bit_set.IntegerBitSet(26).initEmpty();
    for (str) |letra| {
        if (!std.ascii.isAlphabetic(letra)) continue;
        alfabeto.set(std.ascii.toUpper(letra) - 'A');
    }
    return alfabeto.count() == 26;
}
