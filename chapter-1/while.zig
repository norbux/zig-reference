const expect = @import("std").testing.expect;

// While without a continue expression
test "while" {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }

    try expect(i == 128);
}

// While with a continue expression
test "while with continue expression" {
    var sum: u8 = 0;
    var i: u8 = 1;

    while (i <= 10) : (i += 1) {
        sum += i;
    }

    try expect(sum == 55);
}

// While with continue
test "while with continue" {
    var sum: u8 = 0;
    var i: u8 = 0;

    while (i <=3) : (i += 1) {
        if (i == 2) continue;
        sum += i;
    }

    try expect(sum == 4);
}

// While with break
test "while with break" {
    var sum: u8 = 0;
    var i: u8 = 0;

    while (i <= 3) : (i += 1) {
        if (i == 2) break;
        sum += i;
    }

    try expect(sum == 1);
}