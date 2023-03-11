const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    if (limit > 1000 or buffer.len > 200) @panic("limite ultrapassado");

    var list = [_]bool{true} ** (limit + 1);
    var number: u32 = 2;
    var index: u32 = 0;

    while (number <= limit) : (number += 1) {
        if (list[number]) {
            buffer[index] = number;
            index += 1;
            if (index == buffer.len) {
                break;
            }
            var nested_loop_index: u32 = 2 * number;
            while (nested_loop_index <= limit) : (nested_loop_index += number) {
                list[nested_loop_index] = false;
            }
        }
    }
    return buffer[0..index];
}
