const expect = @import("std").testing.expect;

test "basic for" {
    // Here we’ve had to assign values to _, as Zig does not allow us to have unused values
    const string = [_]u8{ 'a', 'b', 'c' };

    for (string) |character, index| {
        _ = character;
        _ = index;
    }

    for (string) |character| {
        _ = character;
    }

    for (string) |_, index| {
        _ = index;
    }

    for (string) |_| {}
}

test "for with continue" {
    const items = [_]i32{ 4, 5, 3, 4, 0 };
    var sum: i32 = 0;

    for (items) |value| {
        if (value == 0) {
            continue;
        }
        sum += value;
    }
    try expect(sum == 16);

    var sum2: i32 = 0;
    for (items) |_, i| {
        try expect(@TypeOf(i) == usize);
        sum2 += @intCast(i32, i);
    }
    try expect(sum2 == 10);
}

test "for with slice" {
    const items = [_]i32{ 4, 5, 3, 4, 0 };
    var sum: i32 = 0;

    for (items[0..2]) |value| {
        sum += value;
    }
    try expect(sum == 9);
}

test "for with reference" {
    var items = [_]i32{ 3, 4, 2 };

    // Iterate over the slice by reference by
    // specifying that the capture value is a pointer.
    for (items) |*value| {
        value.* += 1;
    }

    try expect(items[0] == 4);
    try expect(items[1] == 5);
    try expect(items[2] == 3);
}

// Labeled for
test "nested break" {
    var count: usize = 0;
    outer: for ([_]i32{ 1, 2, 3, 4, 5 }) |_| {
        for ([_]i32{ 1, 2, 3, 4, 5 }) |_| {
            count += 1;
            break :outer;
        }
    }
    try expect(count == 1);
}

test "nested continue" {
    var count: usize = 0;
    outer: for ([_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }) |_| {
        for ([_]i32{ 1, 2, 3, 4, 5 }) |_| {
            count += 1;
            continue :outer;
        }
    }

    try expect(count == 8);
}
