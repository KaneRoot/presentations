.SECTION Performances
.PARAGRAPH_INDENTED
Haskell can be in the same ballpark than C regarding computational speed.
Good performances mostly come from:
.BULLET
good algorithms;
.BULLET
the
.I "-O2"
option to the ghc compiler;
.BULLET
efficient data structures and types;
.BULLET
strictness and laziness where they make sense;
.br
(the compiler may do that for you sometimes, with
.I "strictness analysis" )
.BULLET
tail recursion elimination;
.BULLET
careful function inlining;
.BULLET
(once everything else is done) parallelism or concurrency.
.ENDBULLET

Since refactoring Haskell code is considerably easier than most languages, one could write a naive but valid implementation as a start then make incremental changes to make it efficient.
A naive implementation can be 100 times slower than an optimized one.
However, writing this valid-but-slow solution is really easy given laziness, very generic functions, etc.
There is a trade-off between code optimization and the time you have to write the implementation.
Optimal code is hard to reach, but
.I "good enough"
is easy.

.SUBSECTION newtype
.SECTION_NO_NUMBER newtype, type and data
.PARAGRAPH_UNINDENTED
.TBD

.SUBSECTION Memoization
.PARAGRAPH_UNINDENTED
Memoization is a trade-off between memory and computation, and may transform naive implementations of some recursive algorithms into legitimate solutions.
The idea is simple: keep the result of pure function calls, so the computation only once for a given set of parameters.
This works with all pure functions.
Memoization can offer recursive algorithms a massive performance boost.
.TBD

.SUBSECTION Laziness
.PARAGRAPH_UNINDENTED
Laziness
.BULLET
can make qualitative improvements to performance
.br
.BULLET
can hurt performance in some cases.
.br
It implies to keep track of what should or shouldn't be executed.
.BULLET
Makes code simpler.
.BULLET
Makes hard problems conceivable
.BULLET
Allows for separation of concerns with regard to generating and processing data.

.SUBSECTION Tail recursion elimination
.PARAGRAPH_INDENTED
In the general case, a function call is stacked in memory.
The
.I stack
is very limited in space, trying to put too much function calls and there will be a stack overflow.
Furthermore, putting and removing functions calls from the stack has a time cost.
This is enough to be noticed when a recursive function call itself thousands of times.

The following example shows a naive implementation of computing the length of a list.
.SOURCE Haskell ps=8 vs=9p
len [] = 0
len (x:xs) = 1 + len xs
.SOURCE

This function produces the following stack for a list with three elements.
.PS
boxht=0.3; boxwid=2
moveht=0.3
up
"call stack for a 3-element list"
move
box "\fIlen\fR (x:xs) = 1 + \fIlen\fR xs"
box "\fIlen\fR (x:xs) = 1 + \fIlen\fR xs"
box "\fIlen\fR (x:xs) = 1 + \fIlen\fR xs"
box "\fIlen\fR [] = 0"
.PE
There are several steps to optimize this function.
.BULLET
First, we need to remove the need for multiple stack frames of the same function.
This is done by using an accumulator parameter to remove the tail recursion.
.BULLET
Then, the accumulator should be strict.
Otherwise it creates
.I thunks ,
and this also builds a stack that will end-up in overflow.
.ENDBULLET

.SECTION_NO_NUMBER First step
.PARAGRAPH_INDENTED
.I "Tail recursion elimination"
(or
.I "tail recursion optimization" )
is removing the need to stack a new function call each time.
This reduces both time and space costs of putting and removing a function call in the stack.

.SOURCE Haskell ps=8 vs=9p
len' [] acc = acc
len' (x:xs) acc = len' xs (1 + acc)
.SOURCE
This time, the increment is a
.UL function
passed to the next recursion.
This function is lazy and won't be computed right away, this isn't efficient and may create a stack overflow.
The compiler should be noticed that the accumulator is
.I strict .

.SECTION_NO_NUMBER Rewrite the function with a strict accumulator
.PARAGRAPH_INDENTED
One way to make sure the accumulator is strict, is to use the
.BX $!
operator, which forces a strict evaluation to its right component.

.SOURCE Haskell ps=8 vs=9p
len' [] acc = acc
len' (x:xs) acc = len' xs $! (1 + acc)
.SOURCE
.BELLOWEXPLANATION1
The accumulator is strict, no thunk will be generated and managed, this removes the stack overflow.
.BELLOWEXPLANATION2

Another way, is to use the
.MODULE BangPattern
extension to explicitely say the accumulator is strict.
.SOURCE Haskell ps=8 vs=9p
{-# LANGUAGE BangPatterns #-}
len' [] acc = acc
len' (x:xs) !acc = len' xs (1 + acc)
.SOURCE
.BELLOWEXPLANATION1
The extension
.MODULE BangPattern
has to be enabled, then the only change in the code is the exclamation point on the accumulator.
Flag parameters that are strict is a good practice.
When compiling with
.I -O2
the compiler can find out some of the actual strict parameters.
.BELLOWEXPLANATION2

.SECTION_NO_NUMBER A better way
.PARAGRAPH_INDENTED
Our
.I len
function follows the
.I fold
pattern, walking a full list and returning a single value.
So, let's use it, it even has a strict variant\*[*]!
.FS
Remember, conventionaly a function with an apostrophe is a strict variant in the standard Haskell API.
.FE
.SOURCE Haskell ps=8 vs=9p
import Data.List
len = foldl' (\acc _ -> 1 + acc) 0
.SOURCE
.BELLOWEXPLANATION1
Reusing existing functions is simpler, less error-prone and actually more efficient.
.BELLOWEXPLANATION2

.SECTION_NO_NUMBER Experiment
.PARAGRAPH_INDENTED
Several implementations of the
.I len
function were described: the
.I naive
without any kind of optimization, the one introducing an
.I accumulator
but without explicit strictness (neither the
.BX $!
operator nor the bang pattern),
the implementation with
.I bang
patterns, and finally the one with
.I foldl' .
Let's see how they compare!
.TS
allbox tab(:);
l2 | n2 | n2 | n2 | n
l2 | n2 | n2 | n2 | n.
optimization : naive : accumulator : bang : foldl'
nothing      : 4358  :       5286  : 709  : 733
-O2          : 878   :       396   : 395  : 254
.TE
.BELLOWEXPLANATION1
Values in milliseconds, average over 100 runs.
Standard deviation for these values varies from 0.1 to 0.4 %.
The list has 10 millions entries.
This was performed on an Alpine Linux server.
On the same server, a C program only incrementing a value 10 million times spends 42 ms on the computation.
.BELLOWEXPLANATION2

The table above shows several interesting things:
.BULLET
one of the optimizations of the
.I -O2
compiler option is
.I "strictness analysis"
which gave the same speed to the accumulator function and the explicitely strict version
.I bang ); (
.BULLET
(follow-up) since strictness analysis works, there is no point trying to spot every parameter that should be strict, (almost) naive implementations can still have great performances;
.BULLET
the program is more than twice faster without tail recursion;
.BULLET
massive performance gain with the
.I -O2
option (computation can be 13 times quicker), even using optimized versions with strictness (almost 3 times);
.BULLET
standard functions are so darn fast, use them.
.ENDBULLET

.SUBSECTION Inlining
.PARAGRAPH_UNINDENTED

.TBD

.SECTION_NO_NUMBER Inlining a function
.PARAGRAPH_UNINDENTED
.TBD

.SECTION_NO_NUMBER Prevent inlining
.PARAGRAPH_UNINDENTED
.TBD

.SUBSECTION Avoiding space leaks
