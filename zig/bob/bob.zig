const std = @import("std");
const ascii = std.ascii;

pub fn response(s: []const u8) []const u8 {
    const hey_bob = std.mem.trim(u8, s, &ascii.whitespace);

    if (hey_bob.len == 0) return "Fine. Be that way!";

    const is_shout = isallcaps(hey_bob);
    const is_question = hey_bob[hey_bob.len - 1] == '?';

    if (is_shout and is_question) return "Calm down, I know what I'm doing!";
    if (is_shout) return "Whoa, chill out!";
    if (is_question) return "Sure.";
    return "Whatever.";
}

pub fn isallcaps(str: []const u8) bool {
    var e_upper: bool = false;
    for (str) |letra| {
        if (ascii.isLower(letra)) return false;
        if (ascii.isUpper(letra)) e_upper = true;
    }
    return e_upper;
}
