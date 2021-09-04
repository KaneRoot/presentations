.NH 1
Core concepts
.LP
Functional programming brings some concepts that aren't present (or widespread) in other paradigms.
This section presents some of these concepts:
.I currying ,
.I "function composition" ,
.I "High Order Functions" ,
.I "referential transparency" (purity)
and
.I "laziness" .

.NH 2
Currying
.PP
Or,
.I "why do functions take a single argument" ?
.LP
In Haskell and other functional programming languages, functions only take a single argument.
Let's take an example with a function
.B add ,
which is the sum of two integers.
.SOURCE haskell ps=8 vs=9p
add :: Int -> Int -> Int
add x y = x + y
.SOURCE

The first line is the type of the function.
One way to understand the type
.BX "Int -> Int -> Int"
is that the function takes two integers and returns another one.
.I "But why is this written without a clear difference between parameters and the returned value" ?
Because we can partially apply the function.

.SOURCE haskell ps=8 vs=9p
add1 :: Int -> Int
add1 = add 1
.SOURCE
.BELLOWEXPLANATION1
.BX add1
is
.BX add
but with a default parameter.
.BELLOWEXPLANATION2

.I "How to read this" ?
Function
.BX add1
uses the
.BX add
function with a default parameter set to 1.
.BX "(add 1)"
.UL "is a function" .
It returns a function taking a single integer and returning an integer.
.BX add1
could have been written with an explicit parameter this way
.BX "add1 x = add 1 x"
but since it is just the partial application of another function, there is no need.
.br

.UL "Currying" :
each time a parameter is provided to a function, another function is returned.
This goes until all parameters are provided and the function actually is performed.

In Haskell and in functional programming in general, the concept of
.I currying
functions is widespead, and brings conciseness and code reusability.
Plenty of examples will be presented later.

.NH 2
Function composition
.LP
Function composition is the act of pipelining the result of one function, to the input of another.
This is almost like in shell but the order is reversed, and typed.
.FOOTNOTE1
Data isn't just serialized in strings like in shell (for the most part).
And each output type of a function
.UL must
be the input type of the following function in the composition.
.FOOTNOTE2

.SOURCE haskell ps=8 vs=9p
--the '.' operator is used to compose functions

--result of `sort` is pipelined to `reverse`
sort_and_reverse = reverse . sort

--the result is a descending sort (from 10 to 1)
countdown = sort_and_reverse [2,8,7,10,1,9,5,3,4,6]

--shorter
countdown = (reverse . sort) [2,8,7,10,1,9,5,3,4,6]
.SOURCE

.NH 2
High Order Functions
.LP
Functions in functional programming languages are simple types, they are treated as any other type.
Functions can be given as parameters for other functions.
.SOURCE haskell ps=8 vs=9p
--(* 2) is a function multiplying by two
--a value given in parameter
map (* 2) [1,2,3,4,5]
--> [2,4,6,8,10]
.SOURCE
.BELLOWEXPLANATION1
.BX map
is a function taking another function as its first parameter, and applies it to each element of a list.
.BELLOWEXPLANATION2

.NH 2
Referential transparency (Purity)
.PP
Referential transparency (or
.I purity )
is the property of an expression when it only uses its parameters to compute a value.
In this context, two computations of the same expression with the same parameters will produce the same result.
Example:
.BX "1 + 2"
will always produce
.I 3 .
Functions aren't pure when they rely on input and output, like networking.
A function can be recognized as non pure given its type, when the function relies on the IO monad for example (see later for details).

.I "Why is purity a big deal" ?
Two examples.
.BULLET
.UL Memoization :
purity ensures that two computations produce the same result.
Memory can be traded for computation speed.
Pure functions can be called once for a given set of parameters, and their result can be stored in memory.
There is a gain when the computation is longer to execute than a lookup in a table.

Memoization can transform naive implementations of some recursive algorithms into legitimate solutions.
.BULLET
.UL "Common subexpression elimination" :
the compiler can optimize the code by rewritting some expressions.
.SOURCE haskell ps=8 vs=9p
--these two expressions share a common computation:
a = b * c + g
d = b * c * e

--and can be rewritten this way:
tmp = b * c
a = tmp + g
d = tmp * e
.SOURCE
.BELLOWEXPLANATION1
In this example,
.BX "b * c"
is factored, but it works with any pure function.
.BELLOWEXPLANATION2
.ENDBULLET

.NH 2
Laziness
.PP
Laziness means to compute a value only when necessary.
Why calculate every element of a list when you only use the first one?

.SOURCE Haskell
--take 5 elements of an infinite list
take 5 $ [1..]
--> [1,2,3,4,5]
.SOURCE

Laziness is great for creating simpler programs.
Algorithms can sometimes be expressed in a simpler way when infinite lists aren't a problem.

In practice, we all encountered an example of laziness that makes programming easier: shells.
.SOURCE sh ps=8 vs=9p
find / |
  grep -E "(foo|bar)" |
  head -n 5 | # take only 5 elements
  mail -s "5 foo bar stuff" somebody@example.com
.SOURCE
.BELLOWEXPLANATION1
In this example, once 5 elements get to pass the
.I grep
filter, this script stops.
Millions of files could be on this system, they won't be explored.
Shell is lazy: a program stops when the next program in the pipeline closes its input, not only when it finishes its task.
.BELLOWEXPLANATION2

However, laziness could be detrimental to performances, too.
As with the shell, laziness has a cost.
See the section on performances.

