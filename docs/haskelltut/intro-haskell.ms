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
a gentle introduction to Haskell
.UL "type classes" .
.ENDBULLET

And finally, a brief discussion on the Haskell language, functional programming in general and the rest of the document.

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
Some algorithms are easier to write this way, there is no need for loops and maintaining a state (an index and accumulators in this case).
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
("smth", 8)           :: (String, Int)  --tuple
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
This is more efficient than having to copy the same instructions each time they are needed: fewer lines of code, fewer potential errors, and the code is more readable.

In a functional language, the whole function is a declaration, a single expression,
the content is what the function
.UL means \*[*].
.FS
And since the function carries a
.UL meaning ,
there is little to no place to add unrelated instructions in a function in FP.
This may seem like a curse, but this is actually a bless in disguise.
One can write any debugging code without interfering with the actual useful code,
debug has to be separated from the rest.
Also, functions in the standard library are almost always one-liners.
.FE
The entire body of the function is the returned value.
Functions can still be complex, and composed of several function calls.
However, all these function calls are bounded together, by an operator for example\*[*].
.FS
This will be explained in details later (with
.I monads ).
.FE

The syntax for functions is rather extended in Haskell compared to an imperative language.
Following sub-sections present different ways to create functions.

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

Also,
.I {}
can be used to pattern match on the constructor regardless of the content of the type.

.SOURCE Haskell ps=8 vs=9p
data Foo = Bar | Baz Int
g :: Foo -> Bool
g Bar {} = True
g Baz {} = False
.SOURCE

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
.I lambda \*[*].
.FS
Since the mathematical explanation of lambdas is completely overkill to understand how to use them, it is discarded in this document.
You're welcome.
.FE
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
      z = ... x ...
  in  y/z
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

.PP
This document already introduced primitive types (integer, float and character) and a few others: Bool, tuples and lists.
Functions also have their own type, and can be passed as function parameter as any other type of value.

This section introduces a few aspects of the Haskell type system.
First,
.UL holes
to ask the compiler what type is required at some point.
Second, the multiple ways to
.UL "create new structures"
with the
.I data
keyword.
Finally,
.UL "type synonyms" ,
with the
.I type
keyword, to make the code more understandable to other developers\*[*].
.FS
Documentation through type names is both elegant and effective, even if this isn't sufficient by any mean.
.FE

.NH 3
What type should I use? Holes!
.PP
Haskell has a great type inference.
When writing a function, the actual type of the missing code can be asked to the compiler by writing a
.I hole
in the code, which is any name starting with an interogation
.B ? ) (
character.
.SOURCE haskell ps=8 vs=9p
foo :: Int -> Int -> Int
foo x y = x + ?a          --the hole is named 'a'
.SOURCE
.BELLOWEXPLANATION1
For an unnamed hole, write an underscore.
.br
Holes also work in function types.
.BELLOWEXPLANATION2

.NH 3
Data structures
.LP
One of the big challenges of a developer is to create data structures.
Once this part is done, related code almost writes itself.
Following sub-sections present different ways to create structures with the
.MODULE data
keyword.
.NH 4
Sum
.LP
A sum type is a simple enumeration.
.SOURCE haskell ps=8 vs=9p
data Bool = False | True

--how to create a Bool value
isItTrue = True

not :: Bool -> Bool
not True = False
not False = True
.SOURCE
.BELLOWEXPLANATION1
A boolean value is either true or false, which is a sum type.
Both
.CONSTRUCTOR True
and
.CONSTRUCTOR False
are constructors for the type
.MODULE Bool.
Pattern matching works on constructors.
.BELLOWEXPLANATION2

Check for non exhaustive patterns with
.I "-fwarn-incomplete-patterns" .

.NH 4
Product
.LP
A product type is a type containing data.
.SOURCE haskell ps=8 vs=9p
data Figure = Rectangle Double Double

--how to create a Figure
myRectangle = Rectangle 10.0 30.0

--pattern matching on Figure
area :: Figure -> Double
area (Rectangle height width) = height * width
.SOURCE
.BELLOWEXPLANATION1
In this example,
.CONSTRUCTOR Rectangle
is a
.I constructor
to create a value of type
.MODULE Figure
and it contains two floating point numbers.
Pattern matching works on constructors, and their parameters are named to be used in the function.
.BELLOWEXPLANATION2

.NH 4
Record
.LP
Record type is a product type with named parameters.
.SOURCE haskell ps=8 vs=9p
data Figure = Rectangle { height :: Double
                        , width  :: Double }

--works as before
myRectangle = Rectangle 10.0 30.0

--works as before
area :: Figure -> Double
area (Rectangle height width) = height * width
.SOURCE
.BELLOWEXPLANATION1
This time,
.CONSTRUCTOR Rectangle
has two named parameters:
.I height
and
.I width .
Creating a figure works as before, and pattern matching too.
.BELLOWEXPLANATION2

Naming parameters automatically creates functions with the same names to get their value from a figure\*[*].
.FS
This forces developers to think about names, not to overlap with preexisting functions.
.FE
.SOURCE haskell ps=8 vs=9p
--compute area without pattern matching
area :: Figure -> Double
area f = height f * width f
.SOURCE
.BELLOWEXPLANATION1
In this example, functions
.I height
and
.I width
were used instead of the pattern matching.
.BELLOWEXPLANATION2

Since constructor parameters are named, this is possible:
.SOURCE haskell ps=8 vs=9p
--Naming constructor values on declaration.
myRectangle = Rectangle { height = 5.0
                        , width = 10.0 }

--Getting only a subset of constructor values.
h (Rectangle {height=v}) = v
.SOURCE
.BELLOWEXPLANATION1
Naming constructor parameters is \(if better than only passing arguments by value.
.br
The function
.I h
takes a
.CONSTRUCTOR Rectangle
as parameter, but the parameters of the constructor aren't mentionned.
The actual useful value (height) can be obtained directly.
This way, data structure can evolve without breaking anything.
.BELLOWEXPLANATION2

.NH 4
Algebraic
.LP
Algebraic type is both sum and product types.
.SOURCE haskell ps=8 vs=9p
data Figure
  = Rectangle Double Double
  | Disc Double

myDisc = Disc 5.0
myRectangle = Rectangle 5.0 10.0

area :: Figure -> Double
area (Rectangle h w) = h * w
area (Disc r)        = pi * r ** 2
.SOURCE
.BELLOWEXPLANATION1
Convenient: each figure has its own statement, any error become obvious and a missing case would be automatically detected.
The equivalent in imperative programming is less readable.
.BELLOWEXPLANATION2

.NH 4
Recursive
.LP
An algebraic data type is recursive if its declaration involves itself.
This is common to describe lists, trees, etc.
.SOURCE haskell ps=8 vs=9p
data List
  = Element Int List
  | End

someList :: List
someList = Element 1 (Element 2 End)

mult2 :: List -> List
mult2 End              = End
mult2 (Element x rest) = Element (x*2) (mult2 rest)
.SOURCE
.BELLOWEXPLANATION1
.I mult2
takes a list and returns a list.
When the list is empty, the return is an empty list.
When the list isn't empty, it is destructured to see the current element and the
.I rest
of the elements (which is a list in our definition).
The new list is created with the
.CONSTRUCTOR Element
constructor, with our current element
.I x
multiplied by 2 as our first parameter, and
.BX "mult2 rest"
as the rest of the list (the second parameter of the
.CONSTRUCTOR Element
constructor).

Working with recursive types is a bit complicated.
Any function working on all the elements of the list needs to be recursive, too.
Well, for now at least.
The
.MODULE Functor
type class will make it trivial.
.BELLOWEXPLANATION2

.NH 4
Polymorphic
.LP
Types are
.I polymorphic
when they have type a parameter, meaning that the type of the values they contain isn't fixed.
For example, a list may contain integers, strings or anything else, and that's still a list.
Fixing the type of the values it contains would be arbitrary and very limiting.
.SOURCE haskell ps=8 vs=9p
data List a
  = Element a (List a)
  | End

listInt = Element 1 (Element 2 End)
listString = Element "Hello" (Element "world" End)

--mult2, as before BUT with a constraint on 'a'
mult2 :: Num a => List a -> List a
mult2 End              = End
mult2 (Element x rest) = Element (x*2) (mult2 rest)
.SOURCE
.BELLOWEXPLANATION1
.MODULE List
.I a
is a list of values of
.UL any
type.
However, its declaration implies that a list is composed of values of the same type, a list cannot contain both an integer and a string.
.br
Working with types like this may require to constrain the inner value types, as it is done in
.I mult2
with the
.MODULE Num
constraint (inner values have to be numbers).
.BELLOWEXPLANATION2

.NH 4
Summary on data types
.PP

Let's recap the available data types in Haskell.
.BULLET
.UL "sum type" :
simple enumerations.
.BULLET
.UL "product type" :
data structure needs to store a value (not just the constructor).
.BULLET
.UL "record type" :
product type with names for the stored values.
.BULLET
.UL "algebraic type" :
sum of product values.
This can be combined with recursive and polymorphic types.
.BULLET
.UL "recursive type" :
data structure includes itself in its definition.
.BULLET
.UL "polymorphic type" :
data structure needs to store a value without imposing the type.
.ENDBULLET

Haskell is built on these types, they all have a purpose and help describe different data structures.

.NH 3
Type synonyms
.LP
A floating point number can be a height, a length, a random number, or the average size of guinea pigs in a pet store.
.SOURCE haskell ps=8 vs=9p
--What does the surface function compute?
--What are the parameters? Its returned value?
surface :: Float -> Float -> Float
.SOURCE
Writing
.MODULE Float
as a parameter doesn't provide any
.UL meaning .
To that end, type synonyms help writing more meaningful function types.
.SOURCE haskell ps=8 vs=9p
type Height = Float
type Width = Float
type Area = Float
surface :: Height -> Width -> Area
.SOURCE
.BELLOWEXPLANATION1
There are probably better ways to name this function, but still, now its parameters and the return value are explicit.
.BELLOWEXPLANATION2

Type synonyms provide the
.UL semantic
behind the types.

.NH 2
Haskell's type classes
.PP

Types may be related to each other.
An integer and a float, wheither their size, are both numbers, for example.
A class of types is defined by the functions they implement.
The class
.MODULE Num
(numbers) is defined by the functions related to numerical operations, such as
.BX "+, -, *, /"
and so on.

In Haskell, many type classes are provided by default, and some will be introduced later.

.SH
Syntax
.LP
Let's see some parts of the Haskell standard library: the
.MODULE Semigroup
class.
.I Semigroup
is just a fancy word to say something really simple.
It represents types with values that can be appended, joined, concatened to each other\*[*].
.FS
There are plenty of other terms like "Semigroup" used in Haskell that actually aren't complicated.
They will be translated for the mere mortals in due time, don't worry.
.FE
The list type is part of the semigroup class:
.BX [1,2]
can be concatened to
.BX [3,4]
and produces
.BX [1,2,3,4]
(in this order).

The following example shows the definition of
.I Semigroup
in the standard library, then implements an instance for the recursive and polymorphic data type
.MODULE List
.I a ,
defined earlier (in the "polymorphic type" section).
.SOURCE haskell ps=8 vs=9p
class Semigroup a where
   --Function to implement to be part of
   --this type class.
   (<>) :: a -> a -> a

--instance for the "List a" type
instance Semigroup (List a)
  --Implementation time!
  --'<>' operator: appending two lists.
  End            <> End            = End
  (Element x xs) <> End            = Element x xs
  End            <> (Element y ys) = Element y ys
  (Element x xs) <> (Element y ys)
    = Element x (xs <> (Element y ys))
.SOURCE
.BELLOWEXPLANATION1
To implement the
.BX <>
operator is very similar to create a new list.
We should always start with the simpler case: both lists are empty, so the result is an empty list.
In case one of the lists is empty, the result is the content of the other one.
Finally, in case both lists have values, the result is a construction of a list with the values of the first list first.
The concatenation of two lists, let's say
.BX "[1, 2]"
and
.BX "[3, 4]"
will result in
.BX "[1, 2, 3, 4]"
(in that order).
.BELLOWEXPLANATION2

Plenty of examples are provided in the section on usual type classes.

.SH
Laws
.PP
Sometimes, in order to have a meaninful type class, the behavior of the structure, given a function, has to be imposed.
For example, the
.BX <>
function, from the
.MODULE Semigroup
type class,
requires the data structure to be associative.
.SOURCE haskell ps=8 vs=9p
--associtivity is required for the operator '<>'
(a <> b) <> c == a <> (b <> c)
.SOURCE
.BELLOWEXPLANATION1
.I a
associated with
.I b
THEN associated with
.I c
has to provide the same result as
.I a
associated with the result of
.I b
associated with
.I c .
.BELLOWEXPLANATION2

Always verify that your structure satisfies the laws required by the type classes you implement.
Otherwise the semantic of the type class will be broken and the behavior won't make sense\*[*].
.FS
Furthermore, it could be completely legitimate for the compiler to implement code optimizations to cut a few function calls, or rewrite some functions, based on these laws.
.FE

.SH
Summary
.PP
A type class regroups similar types, related to each other by the functions they can perform.
Sometimes, they have to obey laws, such as
.I associativity ,
in order to ensure an expected behavior for all these types.

Type classes maximize code reusability since functions are very generic, and can work not with types, but with classes of types.

Type inference is simple, too.
When writing a function, finding the required type classes only is searching for used functions in available type classes.
Example: in the function
.BX "blah x y = x + y"
since
.BX +
is used on both
.I x
and
.I y ,
they both need to be in the type class
.MODULE Num.

.NH 2
Modules
.LP
Any non trivial program needs to split its code base into managable pieces.
Each file will represent a
.I module
which can be imported (even partially) in other modules.

.SH
Module import
.LP
.SOURCE Haskell ps=8 vs=9p
--somewhere on your system there is a file named
--data/bytestring.hs
import Data.ByteString
.SOURCE
.BELLOWEXPLANATION1
Import all functions and types from the module.
.BELLOWEXPLANATION2

.SOURCE Haskell ps=8 vs=9p
import qualified Data.ByteString as B
.SOURCE
.BELLOWEXPLANATION1
Import all functions and types from the module, but they all have to be prefixed by
.I B .
.BELLOWEXPLANATION2

.SOURCE Haskell ps=8 vs=9p
import Data.ByteString (pack, unpack)
.SOURCE
.BELLOWEXPLANATION1
Import only
.I pack
and
.I unpack
functions.
.BELLOWEXPLANATION2

.SOURCE Haskell ps=8 vs=9p
import Data.ByteString (ByteString)
.SOURCE
.BELLOWEXPLANATION1
Import only the
.I ByteString
type (not its constructors).
.BELLOWEXPLANATION2

.SOURCE Haskell ps=8 vs=9p
import Data.ByteString (ByteString(..))
.SOURCE
.BELLOWEXPLANATION1
Import the
.I ByteString
type and its constructors.
.BELLOWEXPLANATION2

.SOURCE Haskell ps=8 vs=9p
import Data.ByteString hiding (head)
.SOURCE
.BELLOWEXPLANATION1
Import all functions and types except the function
.I head .
.BELLOWEXPLANATION2

.SH
Module declaration
.LP
.SOURCE Haskell ps=8 vs=9p
--File: some/simple/module.hs
module Some.Simple.Module where
--followed by the module's code
.SOURCE
.BELLOWEXPLANATION1
All functions and types in the module are exported by default.
.BELLOWEXPLANATION2

.SOURCE Haskell ps=8 vs=9p
--with explicit exports
module Some.Simple.Module (
    some, functions, or, Types(..), to, export
  ) where
.SOURCE

.NH 2
Discussion on Haskell and common concepts
.PP

This section shown most of the common ways to create functions and data structures in Haskell.
This is a boring but non avoidable part of the journey to learn the language, and this only scratched the surface.

Haskell is an evolving language, more than most other languages.
It already has many extensions and more will come since Haskell is made by researchers constantly playing with the language.
Fortunately, there is no point trying to document every extension: the core of the language actually is robust and wasn't touched
.B "in decades" .

To understand idiomatic Haskell code, to understand functionnal programming and to be able to write any non trivial program,
.UL "the next three sections are necessary" .
The first presents some very widespread data structures.
The second presents the usual type classes, found in almost every non trivial code.
This includes type classes used to structure the code (chaining function calls for example) and an introduction to unpure functions.
And the third section presents the usual functions used in Haskell code.
