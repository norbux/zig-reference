const std = @import("std");

pub fn main() void {
    std.debug.print("ziglearn - chap. {d} - Assignment\n", .{ 1 });

    const constant: u32 = 5;
    var variable: u32 = 5000;

    // Explicit type coercion
    // Check out https://ziglang.org/documentation/master/#Explicit-Casts for more examples
    var sum = @as(i64, constant + variable);
    std.debug.print("constant + variable: {d}\n", .{ sum });

    var cast = @intCast(i64, constant);
    std.debug.print("u32 cast to i64: {d}\n", .{ cast });

    // Undefined assignment. You can't assign undefined unless there is a type annotation
    // in the declaration: var x = undefined; would throw a compile time error
    const a: i32 = undefined;
    var b: u32 = undefined;
    std.debug.print("undefined a: {}, undefined b: {}\n", .{ a, b });
}