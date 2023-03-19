const std = @import("std");

pub fn binarySearch(comptime T: type, target: T, buffer: []const T) ?usize {
    var upper_bound: usize = buffer.len;
    var lower_bound: usize = 0;

    if (upper_bound == 0 or target > buffer[upper_bound - 1] or target < buffer[0]) {
        return null;
    }
    while (lower_bound <= upper_bound) {
        var mid_ind = @divTrunc(lower_bound + upper_bound, 2);
        var mid = buffer[mid_ind];
        if (mid == target) {
            return mid_ind;
        } else if (mid < target) {
            lower_bound = mid_ind + 1;
        } else {
            upper_bound = mid_ind - 1;
        }
    }
    return null;
}
