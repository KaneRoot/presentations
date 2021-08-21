.NH 1
Core concepts
.LP
Functional programming brings some concepts that aren't present (or widespread) in other paradigms.
This section presents some of these concepts:
.I currying ,
.I "Function composition" ,
.I "High Order Functions"
and
.I "Referential transparency"
(purity).

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
-->[2,4,6,8,10]
.SOURCE

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


.NH 1
Introduction to Haskell

.PP
Functional and imperative programming languages are differents on many levels.
This section provides an overview on those differences.

This section presents:
.BULLET
an implementation of the fibonacci sequence to get a taste of those differences with a concrete yet simple example;
.BULLET
a few Haskell
.UL "basic types" ;
.BULLET
the Haskell
.UL "syntax for functions" ;
.BULLET
the Haskell
.UL "type system" ,
which includes basic types such as integers and characters, but also more advanced types such as sum, product and algebraic types;
.BULLET
the Haskell
.UL "type classes" ,
a gentle introduction to the categorization of types and why this is better than Java interfaces for example;
.BULLET
finally, a conclusion on the pros and cons of this approach.
.ENDBULLET

.\"Please do read books on it if you want to know more.
.\".[
.\"Learn You a Haskell
.\".]

.NH 2
A first example
.PP
Just to get started on how to write a program with a functional programming language, here is an example: the fibonacci sequence.
.\" A space in necessary (otherwise, everything is single-lined)
.SOURCE Haskell
fib :: Int -> Int
fib 0 = 0
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
Recursion: the function calls itself.
Some algorithms are easier to write this way, there is no need for loops and maintaining a state (an index in this case).
.BULLET
Pattern matching: while there is no explicit conditions, the function actually provides a different implementation depending on the value of the parameter.
The behavior of the function is trivial to read, less error-prone than with explicit conditions.
.BULLET
No return statement: a function in Haskell is a declaration, it says what
.I is .
This is not a set of instructions to execute, this is a single expression representing what the function
.UL mean .
Consequently, the whole expression is to be executed and its single produced value is to be returned by the function.
.ENDBULLET

.NH 2
A few Haskell basic types
.PP
Before introducing syntax for functions, a quick overview of very simple types in Haskell.
.SOURCE haskell ps=8 vs=9p
5                     :: Int
5.5                   :: Float
[1,2,3]               :: [Int] --list of integers
'H'                   :: Char
True                  :: Bool
"hello"               :: String
['w','o','r','l','d'] :: String (or [Char])
.SOURCE

Some function types (details later).
.SOURCE haskell ps=8 vs=9p
(+) :: Num a => a -> a -> a
       --'a' = Number type (Int, Float, ...)
(==) :: Eq a => a -> a -> Bool
        --'a' = type that can be tested for equality
.SOURCE
.BELLOWEXPLANATION1
Both functions have a
.I constraint
on their parameters.
Function
.BX +
requires both its parameters to be numbers,
.BX (==)
requires its parameters to be any type that can be tested for equality (like integers).
More on constraints later.
.BELLOWEXPLANATION2

Just a taste of how we can define data structures.
.SOURCE haskell ps=8 vs=9p
--real definition of Bool in the standard library
data Bool = False | True
.SOURCE
.BELLOWEXPLANATION1
A
.MODULE Bool
is either a
.I True
or a
.I False .
True and False are called
.I constructors .
.BELLOWEXPLANATION2

.SOURCE haskell ps=8 vs=9p
--real definition of String in the standard library
type String = [Char]  --list of Char
.SOURCE
.BELLOWEXPLANATION1
A
.MODULE String
is a list of
.MODULE Char
(characters), they are synonyms.
Also, writing a string with
.BX "\`\`hello\`\`"
is syntactic sugar for
.BX "['h', 'e', 'l', 'l', 'o' ]"
.BELLOWEXPLANATION2

.NH 2
Haskell's syntax for functions
.PP
Functions in imperative and functional languages are different concepts.

In an imperative language, a function is a set of instructions to execute and are gathered and named to be called later, possibly several times or just to cut the code in more readable pieces.
This is a more efficient than having to copy the same instructions each time they are needed: fewer lines of code, fewer potential errors, and the code is more readable.

In a functional language, the whole function is a declaration, a single expression,
the content is what the function
.UL means .
.FOOTNOTE1
And since the function carries a
.UL meaning ,
there is little to no place to add unrelated instructions in a function in FP.
This may seem like a curse, but this is actually a bless in disguise.
One can write any debugging code without interfering with the actual useful code,
debug has to be separated from the rest.
Also, functions in the standard library are almost always one-liners.
.FOOTNOTE2
The entire body of the function is the returned value.
Functions can still be complex, and composed of several function calls.
However, all these function calls are bounded together, by an operator for example.
.FOOTNOTE1
This will be explained in details later.
.FOOTNOTE2

The syntax for functions is rather extended in Haskell compared to an imperative language, and that is why it has its own section.

.NH 3
Pattern Matching
.LP
A function can take parameters, and the function body can change according to their value.
The fibonacci sequence included pattern matching on a number.
.SOURCE Haskell
fib :: Int -> Int
fib 0 = 0   -- in case param == 0
fib 1 = 1   -- in case param == 1
fib x = fib (x-1) + fib (x-2) --otherwise
.SOURCE

In practice, pattern matching is often used on data structures.
.SOURCE haskell ps=8 vs=9p
not :: Bool -> Bool
not True  = False
not False = True
.SOURCE
.BELLOWEXPLANATION1
.I Constructors ,
such as
.I True
and
.I False
for the
.MODULE Bool
data structure, can be used in pattern matching.
.BELLOWEXPLANATION2

When the actual value of a parameter isn't necessary, there is no point to even name it; it can be replaced by an underscore.
.SOURCE haskell ps=8 vs=9p
not :: Bool -> Bool
not True  = False  --case where the parameter is True
not _     = True   --any other case
.SOURCE

Pattern matching can destructure lists.
.SOURCE haskell ps=8 vs=9p
--Quick introduction to lists:
[1,2,3] --list of integers
1:[2,3] --add 1 to the head of the list [2,3]
        --":" is an infix constructor taking
        --a value and a list

--len: computes the number of elements in a list
len :: [a] -> Int
len []     = 0          --empty list
len (x:xs) = 1 + len xs --at least a value (x)
.SOURCE
.BELLOWEXPLANATION1
Function
.I len
takes a list (of any type) and returns a number.
First case, the function takes an empty list, its value is 0 (no element in the list).
In case the list isn't empty, it can be destructured: a list can be seen as the infix constructor
.BX :
and a first value
.I x
followed by the rest of the list
.I xs .
So, once destructured, two informations are available:
.I x
(the head value of the list) and
.I xs
(the rest of list, potentially empty).
.BELLOWEXPLANATION2

Since the function
.I len
only has to compute the number of elements, the actual value of
.I x
isn't important, let's rewrite:
.SOURCE haskell ps=8 vs=9p
len :: [a] -> Int
len []     = 0
len (_:xs) = 1 + len xs   --x became '_'
.SOURCE
.BELLOWEXPLANATION1
This time, the function doesn't name the list's head: it is explicitly ignored.
.BELLOWEXPLANATION2

Pattern matching on more complex types will be presented later.

.NH 3
Guards
.LP
Pattern matching provides a different function body according to the value of a parameter.
Sometimes, this is not enough, and the parameter has to be tested more thoroughly, by calling a function for example.
Guards provide a different function body according to tests on values.
.SOURCE haskell ps=8 vs=9p
not :: Bool -> Bool
not v
  | v == True = False
  | otherwise = True
.SOURCE
.BELLOWEXPLANATION1
Guards elegantly replace some conditional instructions (predicates) at the start of imperative functions.
.BELLOWEXPLANATION2

Predicates and function's body are clearly identified.

.NH 3
Case ... of
.LP
A value can be tested through
.I "case ... of"
which is like a switch in C, for example.
.SOURCE haskell ps=8 vs=9p
not :: Bool -> Bool
not v = case v of
  True  -> False   --in case v is True
  _     -> True    --in case v is any other value
.SOURCE

.NH 3
Anonymous functions: lambdas
.LP
An anonymous function is created with the backslash character \\ followed by the parameters, then an arrow (->) and finally the body of the function.
This anonymous function is called a
.I lambda .
.FOOTNOTE1
Since the mathematical explanation of lambdas is completely overkill to understand how to use them, it is discarded in this document.
You're welcome.
.FOOTNOTE2
.SOURCE haskell ps=8 vs=9p
--add 5 to each element of a list
map (\x -> x + 5) [1,2,3,4,5]
--> [6,7,8,9,10]

--sum both elements of each tuple
map (\(x,y) -> x + y) [(1,2),(3,4),(5,6)]
--> [3,7,11]
.SOURCE
Lambdas are widespread in Haskell and in FP in general since this makes the code very concise.
However, when possible, use partial function application (even more concise), by example:
.SOURCE haskell ps=8 vs=9p
map (\x -> x + 5) [1,2,3,4,5]
    --could be written this way:
map (+ 5) [1,2,3,4,5]
.SOURCE

.NH 3
Where and let
.LP
Within the scope of a function, one can declare functions or constant values.
.SOURCE haskell ps=8 vs=9p
health :: Float -> Float -> String
health height weight
  | bmi < 18.5                = "underweight"
  | bmi >= 18.5 && bmi < 25.0 = "normal weight"
  | bmi >= 25.0 && bmi < 30.0 = "overweight"
  | bmi >= 30.0               = "obesity"
  where bmi = weight / (height * height)

health 1.62 70
--> "overweight"
.SOURCE
.BELLOWEXPLANATION1
Function
.I health
uses the value
.I bmi
computed within the function, after the
.I where
keyword.
The value
.I bmi
uses any available value within the context of the function
.I health .
In this case,
.I bmi
uses both
.I height
and
.I weight .
.BELLOWEXPLANATION2

Besides indentation, functions within the context of a function aren't different from what the document shown before.
They also can have an explicit type.
.SOURCE haskell ps=8 vs=9p
health height weight
  -- [...]
  where
    bmi :: Float
    bmi = weight / (height * height)
.SOURCE
.BELLOWEXPLANATION1
Function
.I bmi
doesn't need parameters since it already has access to the relevant values (in the scope of the
.I health
function).
.BELLOWEXPLANATION2

The
.I let
notation can be put in any place where a statement is expected.
That is the main difference with
.I where .
Example:
.SOURCE haskell ps=8 vs=9p
f :: s -> (a,s)
f x =
  let y = ... x ...
  in  y
.SOURCE
.BELLOWEXPLANATION1
.BELLOWEXPLANATION2

.SH
Let or where?
.LP
Chosing either
.I let
or
.I where
is mostly a matter of taste.
Though, one could be prefered in some cases.
Refactoring is easier with
.I let
when the declarations have to be put inside a lambda expression, for example.
However,
.I where
is prefered when the same declaration should be shared between several expressions, which would imply some boilerplate with
.I let .
.SOURCE haskell ps=8 vs=9p
--Refactoring this
f x =
  let y = ... x ...
  in  y
--into this
f = State $ \x ->
  let y = ... x ...
  in  y
--wouldn't have been possible with 'where'.


--However, writing this with 'let' would be painful
f x
  | cond1 x   = a
  | cond2 x   = g a
  | otherwise = f (h x a)
  where
    a = w x
--(it could been mixed with 'case' to make it work,
--but ultimately make it harder to write and to read)
.SOURCE
.BELLOWEXPLANATION1
Chosing the right one comes with experience, nothing to worry about.
.BELLOWEXPLANATION2

.NH 2
Haskell's type system

.NH 3
Simple types
.TBD
.NH 3
Type synonyms
.TBD
.NH 3
Data
.TBD
.NH 3
Summary: newtype, type and data
.NH 3
What type should I use? Holes!
.NH 3
Data structures
.NH 4
Sum
.NH 4
Product
.NH 4
Record
.NH 4
Algebraic
.NH 4
Recursive
.NH 4
Polymorphic
.NH 4
Summary on data types

.NH 2
Haskell's type classes

.NH 2
A simple note...
.LP

Most of what was presented here isn't part of the language, but only the standard library.
Function composition rests on the operator
.BX (.)
which only is a simple function in the standard library.
Same thing for (->) operator.
.TBD

.SOURCE haskell ps=8 vs=9p
--function composition
(.) :: (b -> c) -> (a -> b) -> a -> c
(.) f g = \x -> f (g x)
.SOURCE

.NH 2
Conclusion on basic haskell syntax and concepts
.LP

.\".SOURCE haskell ps=8 vs=9p
.\".SOURCE
