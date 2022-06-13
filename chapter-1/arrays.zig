const std = @import("std");

pub fn main() void {
    std.debug.print("ziglearn - chap. {d} - Arrays\n", .{ 1 });

    const a = [9]u8{'h', 'e', 'y', ' ', 't', 'h', 'e', 'r', 'e'};
    std.debug.print("array a: {s}\n", .{ a });
    // To infer the size of the array use _
    const b = [_]u8{'h', 'e', 'y', ' ', 'y', 'o'};
    const length = b.len;
    std.debug.print("length of array b: {d}\n", .{ length });

    const x = a[4..a.len];
    std.debug.print("slice of array a: {s}", .{ x });
}