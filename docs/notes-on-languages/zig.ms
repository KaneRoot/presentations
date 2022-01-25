.SECTION C
Compared to assembly, this is a very big improvement since the code is now intended for human readability.
.BULLET better memory representation (types, structures)
.BULLET better code representation (functions, operators)
.BULLET control flow (conditions, loops)
.ENDBULLET

Furthermore, types, and thus type checking, allow the developer to reason about the code and have tools checking the operations performed are relevant, type-wise.

The compiler performs lots of various tasks automatically.
For instance, function calls imply some memory stack management.
For the developer, a function call is a single line of code, or even embed into a bigger expression, no need to think about stack pointers.

C and C-like languages are a step towards architecture abstraction, they already are "high level" in that regard but they are still very much related to the hardware.

Assembly still can be more optimized than the best optimizers in C, but the gain is so small that it isn't useful anymore by any stretch of imagination.
For instance, one can remove a few instructions from the generated assembly from C code, which
.B may
make your code run
.FRAC 1 "100 000"
time quicker.
.SHINE "Who cares?"

.SUBSECTION Side note: Zig
While having a C-like syntax, Zig provides a few notable improvements.

.BULLET
.BULLET
.BULLET
.ENDBULLET
