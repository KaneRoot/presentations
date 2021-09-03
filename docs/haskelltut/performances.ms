.NH 1
Performances
.LP

Haskell can be in the same ballpark than C regarding computational speed.
Good performances mostly come from:
.BULLET
good algorithms;
.BULLET
efficient data structures and types;
.BULLET
strictness and laziness where they make sense;
.BULLET
non terminal recursion;
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

.NH 2
newtype
.SH
newtype, type and data
.LP
.TBD

.NH 2
Memoization
.LP
Memoization is a trade-off between memory and computation, and may transform naive implementations of some recursive algorithms into legitimate solutions.
The idea is simple: keep the result of pure function calls, so the computation only once for a given set of parameters.
This works with all pure functions.
Memoization can offer recursive algorithms a massive performance boost.
.TBD

.NH 2
Laziness
.LP
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

.NH 2
Inlining
.LP

.TBD

.SH
Inlining a function
.LP
.TBD

.SH
Prevent inlining
.LP
.TBD
