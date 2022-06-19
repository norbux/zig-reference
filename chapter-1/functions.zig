const std = @import("std");
const expect = @import("std").testing.expect;

fn addFive(x: u32) u32 {
    return x + 5;
}

test "function" {
    const y = addFive(0);
    try expect(@TypeOf(y) == u32);
    try expect(y == 5);
}

fn fibonaci(n: u16) u16 {
    if (n == 0 or n == 1) return n;
    return fibonaci(n - 1) + fibonaci(n - 2);
}

test "function recursion" {
    const x = fibonaci(10);
    try expect(x == 55);
}
