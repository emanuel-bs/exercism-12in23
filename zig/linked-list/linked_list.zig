const std = @import("std");
pub fn LinkedList(comptime T: type) type {
    return struct {
        const Self = @This();
        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node = null,
            data: T,
        };
        first: ?*Node = null,
        last: ?*Node = null,
        len: usize = 0,

        pub fn push(self: *Self, new_node: *Node) void {
            new_node.prev = self.last;
            if (self.last) |last_node| {
                last_node.next = new_node;
            } else {
                self.first = new_node;
            }
            self.last = new_node;
            self.len += 1;
        }

        pub fn pop(self: *Self) ?*Node {
            if (self.last) |last_node| {
                self.last = last_node.prev;
                if (self.first == last_node) {
                    self.first = null;
                }
                self.len -= 1;
                return last_node;
            }
            return null;
        }

        pub fn shift(self: *Self) ?*Node {
            if (self.first) |first_node| {
                self.first = first_node.next;
                if (self.last == first_node) {
                    self.last = null;
                }
                self.len -= 1;
                return first_node;
            }
            return self.last;
        }

        pub fn unshift(self: *Self, new_node: *Node) void {
            if (self.first) |first_node| {
                first_node.prev = new_node;
                first_node.next = first_node;
            }
            if (self.last == null) {
                self.last = new_node;
            }
            self.first = new_node;
            self.len += 1;
        }

        pub fn delete(self: *Self, node: *Node) void {
            var _current = self.first;
            while (_current) |current| {
                if (current == node) {
                    if (current.next) |next| {
                        next.prev = current.prev;
                    }
                    if (current.prev) |prev| {
                        prev.next = current.next;
                    }
                    if (self.first == current) {
                        self.first = current.next;
                    }
                    if (self.last == current) {
                        self.last = current.prev;
                    }
                    self.len -= 1;
                }
                _current = current.next;
            }
        }
    };
}
