.NH 1
Functional programming
.PP
FP can be seen as an
.ft I
"everything is a function"
.ft R
paradigm.
This can be seen as an attempt to create programs as single mathematical expressions.
In that regard, each line of code is intended to provide the
.UL intent
of the developer more than
.I "how to perform stuff" .

.NH 2
A few examples
.PP
Just to get started on how to write a program with a functional programming language, I'll provide a few examples.
Please do read books on it if you want to know more.
.[
Learn You a Haskell
.]

First example:
.B fibonacci .
.\" A space in necessary (otherwise, everything is single-lined)
.SOURCE Haskell
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib x = fib (x-1) + fib (x-2)
.SOURCE
. .BELLOWEXPLANATION1
. In this sequence, we see the Fibonacci sequence expressed in a very simple way.
. .BELLOWEXPLANATION2

A few notes on what is happening:
.BULLET
The first line is the type of the function: it accepts an
.I Int
as its first (and only) argument and returns another
.I Int .
.BULLET
The body of the function changes depending on the argument value.
.BULLET
Finally, if the parameter isn't 0 or 1, it performs
.BX "fib (x-1) + fib (x-2)"
, which can be read as the mathematical expression of the Fibonacci sequence.
.ENDBULLET

Compared to an imperative programming language, the code for this function is considerably
.UL smaller
and more
.UL readable .
This can be explained in several points:
.BULLET
Recursion:
.BULLET
Pattern matching and 
.ENDBULLET
.
.
