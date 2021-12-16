// WARNING: this document expects you to understand a few basic concepts in
//          computer science, such as pointers, stack and heap memory, etc.

// WARNING: Zig isn't considered as ready for production. Bugs are expected.
//          DO NOT TRY ZIG AS YOUR FIRST PROGRAMMING EXPERIENCE.
//          The compiler, even the language and its libraries aren't ready, yet.
//          You've been warned.

// Zig aims to be a replacement for the C programming language.
// Prior knowledge of C is strongly recommended.


//! Top-level documentation.

/// Documentation comment.

// Simple comment.



// Hello world.

// Import standard library, reachable through the "std" constant.
const std = @import("std");

// "info" now refers to the "std.log.info" function.
const info = std.log.info;

// Usual hello world.
pub fn main() void {
    // Contrary to C functions, Zig functions have a fixed number of arguments.
    // In C: "printf" takes any number of arguments.
    // In Zig: std.log.info takes a format and a list of elements to print.
    info("hello world", .{});
}


// Booleans.
// Keywords are prefered to operators for boolean operations.
print("{}\n{}\n{}\n", .{
    true and false,
    true or false,
    !true,
});

// Integers.
const one_plus_one: i32 = 1 + 1;
print("1 + 1 = {}\n", .{one_plus_one});

// Floats.
const seven_div_three: f32 = 7.0 / 3.0;
print("7.0 / 3.0 = {}\n", .{seven_div_three});

// Integers have arbitrary value lengths.
// Here is a 10-bit unsigned integer:
var myvar: u10 = 5;
// Useful for example to read network packets, or arbitrary complex binary formats.


// Number representation is greatly improved compared to C.
const one_billion = 1_000_000_000;
const binary_mask = 0b1_1111_1111;
const permissions = 0o7_5_5;
const big_address = 0xFF80_0000_0000_0000;


// Overflow operators: tell your compiler when it's okay to overflow.
var i: u8 = 0;
i  -= 1; // runtime overflow error (unsigned value should always be positive)
i -%= 1; // okay (wrapping operator), i == 255


// Arrays: well-defined structures with a length attribute (len).

// 5-byte array with undefined content (stack garbage).
var array: [5]u8 = undefined;
// array.len == 5

// 5-byte array with defined content.
var array2 = [_]u8{ 1, 2, 3, 4, 5 };
// array2.len == 5

// 1000-byte array with defined content.
// The content is provided by the "foo" function.
var array3 = [_]u8{foo()} ** 1000; // another way
// array3.len == 1000


// Loop over arrays.

// Loop over every item.
for (array) |item| {
    // do something with 'item'
}

// Loop over every item with an index.
for (array) |item, index| {
    // do something with 'item', indexed at 'index'
}

// As before, but "*item" is a pointer over the element.
// You can then modify the content of the array.
for (array) |*item, index| {
    // item is now a pointer
}



// Modifying and accessing arrays content.

// Array of 10 32-bit undefined integers.
var some_integers: [10]i32 = undefined;

some_integers[0] = 30; // first element of the array is now 30

var x = some_integers[0]; // x now equals to 30, its type is infered
var y = some_integers[1]; // second element of the array isn't defined
                          // y got a stack garbage value (no runtime error)

// Array of 10 32-bit undefined integers.
var some_integers: [10]i32 = undefined;

var z = some_integers[20]; // index > array size, compilation error

// At runtime, we loop over the elements of "some_integers" with an index.
// Index i = 20, then we try:
try some_integers[i]; // runtime error 'index out of bounds'
                      // "try" keyword is necessary when accessing an array with an index,
                      // since there is a potential runtime error.
                      // More on that later.



// Strings.

// Simple string constant.
const hello = "hello";
// Equivalent to:
const hello: *const [5:0]u8 = "hello";
// In words: hello is a constant, a pointer on a constant array of 5 elements
// (8-bit unsigned integers), with an extra '0' (sentinel value) at the end.

print("string: {s}\n", .{hello});

// This represents rather faithfully C strings.
// Although, Zig strings are structures, no need for "strlen" to know their size.
// hello.len == 5



// Slices.

// Slices are pointer + size, arrays without compile-time known size.
// They have runtime out-of-band verifications.

const array = {1,2,3,4,5};
const slice = array[0..array.len];
// slice[10] gives an error


// Slices can have sentinel values, too.
const string: [:0]const u8 = "hello";
// string.len == 5
// string[5] == 0


// Pointers.

const x: i32 = 1;
const pointer: *i32 = &x;
print("1 = {}, {}\n", .{x, pointer});

// .* is used to reach the content of the pointed memory.
if (pointer.* == 1) {
    print("x value == {}\n", .{pointer.*});
}

// Optional values (?<type>).

// "optional_value" can either be "null" or an unsigned 32-bit integer.
var optional_value: ?u32 = null; // optional_value == null
optional_value = 42;             // optional_value != null


// "some_function" returns ?u32
var x = some_function();
if (x) |value| {  // In case "some_function" returned a value.
    // do something with 'value'
}


// Errors.

// Zig provides an unified way to express errors.
// Errors are defined in error enumerations, example:
const Error = error {
    WatchingAnyNetflixTVShow,
    BeOnTwitter,
};

// Normal enumerations are expressed the same way, but with "enum" keyword.
const SuccessStory = enum {
    DoingSport,
    ReadABook,
};


// Error union (!).
// Either the value "mylife" is an an error or a normal value.
var mylife: Error!SuccessStory = Error.BeOnTwitter;
// mylife is an error. Sad.

mylife = SuccessStory.ReadABook;
// Now mylife is an enum.


// Handling errors.

// Some error examples.
const Error = error {
    UnExpected,
    Authentication,
};

// "some_function" can either return an error or an integer.
fn some_function() Error!u8 {
    return Error.UnExpected; // It returns an error.
}

// Errors can be "catch" without intermediate variable.
var value = some_function() catch |err| switch(err) {
    Error.UnExpected => return err, // Returns the error.
    Error.Authentication => unreachable, // Not expected, ever. Crashes the program.
    else => unreachable,
};


// "try" is a very handy shortcut for "catch |err| return err".
var value = try some_function();
// If "some_function" fails, the current function stops and returns the error.
// "value" can only have a valid value, the error already is handled with "try".


// Structures.

///////// var List_u8 = struct {
/////////     items: []u8,
/////////     // ...
/////////     pub fn init(allocator : *std.mem.Allocator) !List_u8 {
/////////         return List_u8{
/////////             .items = try allocator.alloc(u8, 10)
/////////         };
/////////     }
///////// };

// Point is now a constant representing a structure.
// This structure contains two u32, x and y.
// x has a default value, which wasn't possible in C.
const Point = struct {
    x: u32 = 1, // default value
    y: u32,
};

// Variable "p" is a new Point, with x = 1 (default value) and y = 2.
var p = Point{ .y = 2 };

// Fields are accessed as usual with the dot notation: variable.field.
print("p.x: {}\n", .{p.x}); // 1
print("p.y: {}\n", .{p.y}); // 2


// A structure can also contain public constants and functions.
const Point = struct {
    pub const some_constant = 30;

    x: u32,
    y: u32,

    // This function "init" creates a Point and returns it.
    pub fn init() Point {
        return Point{ .x = 0, .y = 0 };
    }
};


// How to access a structure public constant.
// The value isn't accessed from an "instance" of the structure, but from the
// constant representing the structure definition (Point).
print("constant: {}\n", .{Point.some_constant});

// Having an "init" function is rather idiomatic in the standard library.
// More on that later.
var p = Point.init();
print("p.x: {}\n", .{p.x}); // p.x = 0
print("p.y: {}\n", .{p.y}); // p.y = 0


/// TODO
// Structures often have functions to modify their state, which is very similar
// to object-oriented programming.
const Point = struct {
    const Self = @This(); // Refers to its own type (later called "Point").

    x: u32,
    y: u32,

    // Take a look at the signature.
    // First argument is of type *Self, meaning that the "self" variable is
    // a pointer on the instance of the structure.
    // This allows the same "dot" notation as in OOP, like "instance.set(x,y)",
    // see the following example.
    pub fn set(self: *Self, x: u32, y: u32) void {
        self.x = x;
        self.y = y;
    }
};

// Let's use the previous structure.
var p = Point{ .x = 0, .y = 0 }; // "p" variable is a Point.

p.set(10, 30); // x and y attributes of "p" are modified via the "set" function.
print("p.x: {}\n", .{p.x}); // 10
print("p.y: {}\n", .{p.y}); // 30

// In C:
//   1. we would have written something like: point_set(p, 10, 30);
//   2. since all functions are in the same namespace, it would have been
//      very cumbersome to create functions with different names for different
//      structures. Many long names, painful to read.
//
// In Zig, structures provide namespaces for their own functions. Two different
// structures can have the same names for their functions, which brings clarity.



// Defer and errdefer.
// Make sure that an action (single instruction or block of code) is
// executed before the end of the scope (function, block of code).
// Even on error, that action will be executed.
// Useful for memory allocations, and resource management in general.

pub fn main() void {
    // should be executed at the end of the function
    defer print("third!\n", .{});

    {
        // last element of its scope: will be executed right away
        defer print("first!\n", .{});
    }

    print("second!\n", .{});
}

fn hello_world() void {
    defer print("end of function\n", .{}); // after "hello world!"

    print("hello world!\n", .{});
}

// errdefer executes the instruction (or block of code) only on error.
fn second_hello_world() !void {
    errdefer print("2. something went wrong!\n", .{}); // if "foo" fails.
    defer print("1. second hello world\n", .{}); // executed after "foo"

    try foo();
}
// Defer statements can be seen as stacked: first one is executed last.



// Memory allocators.

// Memory isn't managed directly in the standard library, instead an "allocator"
// is asked every time an operation on memory is required.
// Thus, the standard library lets developers handle memory as they need,
// through structures called "allocators", handling all memory operations.

// In this example I chose a page allocator.
var allocator = std.heap.page_allocator;

// "list" is an ArrayList of 8-bit unsigned integers.
// An ArrayList is a contiguous, growable list of elements in memory.
var list = try ArrayList(u8).initAllocated(allocator);
defer list.deinit(); // Free the memory at the end of the scope. Can't leak.

list.add(5);

for (list.items) |item| {
    std.debug.print("item: {}\n", .{item});
}




/// TODO
/// NOT IN THE RIGHT PLACE

const std = @import("std");
const Allocator = std.mem.Allocator;

fn List(comptime T: type) type {
    return struct {
        const Self = @This();

        items: []T,
        nb: usize,
        allocator: *Allocator,

        pub fn initAllocated(allocator: *Allocator) !Self {
            return Self{
                .allocator = allocator,
                .items = try allocator.alloc(T, 1),
                .nb = 0,
            };
        }

        pub fn add(self: *Self, a : T) void {
            self.items[self.nb] = a;
            self.nb += 1;
            self.allocator.resize(self.items, self.nb);
        }

        pub fn deinit(self: *Self) void {
            self.allocator.free(self.items);
        }
    };
}




// Memory allocation.

fn some_memory_allocation_example() !void {
    var buf = try page_allocator.alloc(u8, 10);
    defer page_allocator.free(buf);

    var buf2 = try page_allocator.alloc(u8, 10);
    defer page_allocator.free(buf2);

    try foo();
    try bar();

    // ...
}


// Memory allocation.


const std = @import("std");
const page_allocator = std.heap.page_allocator;
const print = std.debug.print;


// Allocators: 4 main functions to know

//   single_value = create (type)
//                  destroy (single_value)

//   slice = alloc (type, size)
//           free (slice)


fn page_allocator_fn() !void {
    print("page allocator\n", .{});

    var slice = try page_allocator.alloc(u8, 3);
    defer page_allocator.free(slice);


    slice[0] = 0;
    slice[1] = 1;

    for (slice) |item, i| {
        print("val {}: {}\n", .{i, item});
    }
}


const GeneralPurposeAllocator = std.heap.GeneralPurposeAllocator;

fn general_purpose_allocator_fn() !void {
    print("general purpose allocator\n", .{});

    const config = .{.safety = true};
    var gpa = GeneralPurposeAllocator(config){};
    defer _ = gpa.deinit();

    const allocator = &gpa.allocator;

    var slice = try allocator.alloc(u8, 3);
    defer allocator.free(slice);

    slice[0] = 0;
    slice[1] = 1;

    print("value: {} => len: {}\n", .{slice, slice.len});
    for (slice) |item, i| {
        print("val {}: {}\n", .{i, item});
    }
}

















const FixedBufferAllocator = std.heap.FixedBufferAllocator;

fn fixed_buffer_allocator_fn() !void {
    print("fixed buffer allocator\n", .{});

    // var buffer: [1000]u8 = undefined;
    var buffer = [_]u8{0} ** 1000;
    var fba = FixedBufferAllocator.init(buffer[0..]);

    var allocator = &fba.allocator;

    var value = try allocator.create(u64);
    defer allocator.destroy(value);

    value.* = 8;
    print("value.*: {}\n", .{value.*});
}
















const arena_allocator = std.heap.ArenaAllocator;

fn arena_allocator_fn() !void {
    print("arena allocator\n", .{});

    var arena = arena_allocator.init(page_allocator);
    defer arena.deinit(); // end of function = no more allocs

    var allocator = &arena.allocator;

    const value = try allocator.create(u8);
    const slice = try allocator.alloc(u8, 3);

    value.* = 8;

    print("value: {} => {}\n", .{value, value.*});

    slice[0] = 0;
    slice[1] = 1;

    for (slice) |item, i| {
        print("val {}: {}\n", .{i, item});
    }
}



pub fn main() !void {
    try page_allocator_fn();
    try general_purpose_allocator_fn();
    try fixed_buffer_allocator_fn();
    try arena_allocator_fn();
    try gpa_arena_allocator_fn();
}
















fn gpa_arena_allocator_fn() !void {
    print("gpa arena allocator\n", .{});

    const config = .{.safety = true};
    var gpa = GeneralPurposeAllocator(config){};
    defer _ = gpa.deinit();

    const gpa_alloc = &gpa.allocator;

    var arena = arena_allocator.init(gpa_alloc);
    defer arena.deinit();

    const allocator = &arena.allocator;

    const value = try allocator.create(u8);
    const array = try allocator.alloc(u8, 3);

    value.* = 8;

    print("value: {} => {}\n", .{value, value.*});
    for (array) |it| {
        print("it: {}\n", .{it});
    }
}



inline fn max(comptime T: type, a: T, b: T) T {
	return if (a > b) a else b;
}


var res = max(u64, 1, 2);
var res = max(f32, 10.50, 32.19);




















// Comptime: avoiding the pre-processor.
// 

fn List(comptime T: type) type {
    return struct {
        items: []T,
    };
}

const MyList = List(u8);


// use
var list = MyList{
    .items = ... // memory allocation
};

list.items[0] = 10;


// A taste of standard library.
/// TODO


var my_array = ArrayList(i32).init();












// Conditional compilation

const available_os = enum { OpenBSD, Linux };
const myos = available_os.OpenBSD;


// The following switch is based on a constant value.
// This means that the only possible outcome is known at compile-time.
// Thus, there is no need to build the rest of the possibilities.
// Similar to the "#ifdef" in C, but within the Zig language, no need for a pre-processor.
const string = switch (myos) {
   .OpenBSD => "OpenBSD is awesome!",
   .Linux => "Linux rocks!",
};

// Also works in this case.
const myprint = switch(myos) {
    .OpenBSD => std.debug.print,
    .Linux => std.log.info,
}



// Testing our functions.

const std = @import("std");
const expect = std.testing.expect;


// Function to test.
pub fn some_function() bool {
    return true;
}

// This "test" block can be run with "zig test".
// It will test the function at compile-time.
test "returns true" {
    expect(false == some_function());
}
