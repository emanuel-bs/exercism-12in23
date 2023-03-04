// Take a look at the tests, you might have to change the function arguments
pub const SearchError = error{
    ValueAbsent,
    EmptyBuffer,
};

pub fn binarySearch(comptime T: type, target: T, buffer: []const T) SearchError!usize {
    const middle: usize = buffer.len / 2;
    if (buffer.len == 0) {
        return SearchError.EmptyBuffer;
    } else if (buffer[middle] == target) {
        return middle;
    } else {
        if (buffer[middle] < target) {
            if (middle == buffer.len - 1) {
                return SearchError.ValueAbsent;
            }
            return try binarySearch(T, target, buffer[middle + 1 ..]) + middle + 1;
        } else {
            if (middle == 0) {
                return SearchError.ValueAbsent;
            }
            return try binarySearch(T, target, buffer[0..middle]);
        }
    }
}
