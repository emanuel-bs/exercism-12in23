const std = @import("std");
const mem = std.mem;
pub const Signal = enum(isize) {
    wink = 0b00001,
    double_blink = 0b00010,
    close_your_eyes = 0b00100,
    jump = 0b01000,
    // 0b10000 = Reverse the order of the operations in the secret handshake.
};

pub fn calculateHandshake(allocator: mem.Allocator, number: isize) mem.Allocator.Error![]const Signal {
    var secret_handshake = std.ArrayList(Signal).init(allocator);
    if (0b10000 & number == 0) {
        if (@enumToInt(Signal.wink) & number != 0) {
            try secret_handshake.append(Signal.wink);
        }
        if (@enumToInt(Signal.double_blink) & number != 0) {
            try secret_handshake.append(Signal.double_blink);
        }
        if (@enumToInt(Signal.close_your_eyes) & number != 0) {
            try secret_handshake.append(Signal.close_your_eyes);
        }
        if (@enumToInt(Signal.jump) & number != 0) {
            try secret_handshake.append(Signal.jump);
        }
    } else {
        if (@enumToInt(Signal.jump) & number != 0) {
            try secret_handshake.append(Signal.jump);
        }
        if (@enumToInt(Signal.close_your_eyes) & number != 0) {
            try secret_handshake.append(Signal.close_your_eyes);
        }
        if (@enumToInt(Signal.double_blink) & number != 0) {
            try secret_handshake.append(Signal.double_blink);
        }
        if (@enumToInt(Signal.wink) & number != 0) {
            try secret_handshake.append(Signal.wink);
        }
    }
    return secret_handshake.items;
}
