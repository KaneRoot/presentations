.NH 1
Usual Haskell type classes
.PP
A type class represents a property of a data type.
For example, a type that can be sorted (Ord), isn't empty (NonEmpty), or that can be serialized in a printable string format on the terminal (Show).
Type classes allow developers to focus on an abstraction of the types they work with;
a function can express constraints on its parameters instead of actual types.
.FOOTNOTE1
And
.I abstract
code isn't in any way a synonym of
.I slowness .
This idea will be destroyed in the section on performances.
.FOOTNOTE2

The section introducing Haskell summarized type classes as a set of functions.
A type needs to implement them to be part of the type class.
Implementation also needs to respect a set of laws depending on the semantic of the type class, such as
.I associativity
or
.I transitivity
for example.

Many type classes exist in the standard distribution of Haskell.
Most of them are widespread in libraries since they are useful in many contexts.
Here is a first sample:
.MODULE Num
(numbers),
.MODULE Eq
(types that can be tested for equality),
.MODULE Ord
(types that can be sorted), etc.

Knowing all classes and their little implementation details isn't necessary.
However, a few of them are really interesting from an educational perspective or for composing bigger programs.

In this section,
.TYPECLASS Eq
and
.TYPECLASS Ord
type classes are first introduced.
They provide simple examples of actual type classes and how to create instances.
Then, the three usual type classes
.TYPECLASS Functor ,
.TYPECLASS Applicative
and
.TYPECLASS Monad
since they are related to each other and widespread in Haskell.
Each of them allows to abstract some parts of usual code structure, such as loops, some conditions and a bit of error management.
Some widespread monads will be introduced, such as the IO monad, allowing us to write our first application: a magnificent hello world!
Finally, a brief conclusion on type classes and their usefulness.

.NH 2
Eq: types that can be tested for equality
.PP
The
.TYPECLASS Eq
type class represents all types that can be tested for equality.
It is based on the
.MODULE Bool
data type, and requires only to define a single function:
.FUNCTION (==)

.SOURCE Haskell ps=8 vs=9p
--Let's implement a data structure
--which will be an instance of Eq
data Room = Room Int --a room has a number

instance Eq Room where
  (Room x) == (Room y) = x == y

--In GHCi
r1 = Room 4
r2 = Room 4
r3 = Room 8
r1 == r2
> True
r1 == r3
> False
.SOURCE
.BELLOWEXPLANATION1
The Room data structure, representing a room with a number in an hostel for example, allows to show how to implement an instance of the
.TYPECLASS Eq
type class.
.BELLOWEXPLANATION2


.NH 2
Ord: types that can be sorted
.PP
.SOURCE Haskell ps=8 vs=9p
data Ordering = LT | EQ | GT
.SOURCE

.NH 2
Functor
.LP
A type
.I f
is a
.MODULE Functor
if it provides a function
.I fmap
which, given any types
.I a
and
.I b
lets you apply any function from
.I "(a -> b)"
to turn an
.I "f a"
into an
.I "f b,"
preserving the structure of
.I f .

.NH 2
Applicative

.NH 2
Monad
.PP
Functional programming, and particularly in Haskell, a function is a single expression.
However, one may want to perform multiple function calls in this single expression.
A
.MODULE Monad
is about binding these function calls together.
.FOOTNOTE1
It is frightening that nobody just says this to explain monads.
The mathematical explaination is incredibly useless when talking to developers, stop even trying.
.FOOTNOTE2

Binding function calls is like a
.I "try and catch"
in other languages.
In Java for example, when a function returns an exception, the remaining function calls are ignored and the exception is
.I catched .
The
.I "try and catch"
mechanism allows to write less conditions on the return values of the functions;
there is no need to test if they failed and error management is separated from regular instructions.
.br
The following figure shows the difference between C error management and the Java's
.I "try and catch"
mechanism.

.PS
reset
.defcolor lightgreen rgb 0.9 1.0 0.9
.defcolor lightblue  rgb 0.9 0.9 1.0
.defcolor bloatcode  rgb 1.0 0.1 0.1
down
boxht=0.2
JAVA: "JAVA"
move
move left
"try"
move right
down
move 0.1
box "function1()" shaded "lightgreen"
box "function2()" shaded "lightgreen"
box "function3()" shaded "lightgreen"
box "function4()" shaded "lightgreen"
move left
down
move 0.1
"catch ..."
move right
down
move 0.1
box "..." shaded "lightblue"
move to JAVA + (1.4,0)
C: "C"
move
move right 0.1
down
linesep=0.20
define cfun { [
	R: $1 ljust outline "bloatcode"
	right
	move to R.e + (0.4,0)
	box $2 shaded "lightgreen"
	move to R
	down
	move linesep
	$3 ljust outline "bloatcode"
	move linesep
	move right 0.3
	box "..." shaded "lightblue"
	down
	move linesep
] }
cfun("ret1 = ", "function1()", "if (ret1 == ...)")
cfun("ret2 = ", "function2()", "if (ret2 == ...)")
move left 0.4
right
circle fill rad 0.03
move 0.1
circle fill rad 0.03
move 0.1
circle fill rad 0.03
line from JAVA + (0.8,0) to JAVA + (0.8,-2)
.\" Title
move to JAVA + (0.8,-2.3)
"Try & Catch vs fully imperative error management" shaded "green"
.PE
.BELLOWEXPLANATION1
Function calls are green boxes, error management are blue boxes.
(Bloat) code required in C to check for errors is in red.
.br
The
.I "try and catch"
mechanism groups all function calls, error management is elsewhere later in the code.
This greatly improves readability with multiple function calls.
.BELLOWEXPLANATION2

Monads are simpler than
.I "try and catch" :
they are operators (simple functions) binding function calls.
.FOOTNOTE1
Also, monads are more generic than
.I "try and catch"
and do not require a compiler-supported mechanism.
.FOOTNOTE2
In practice, a Monad is defined by three functions:
.I (>>=)
which computes the first function and give the result to the second (as its last argument),
.I (>>)
which computes the first function and ignore the result, and
.I return
which takes a value and puts it in the context of the monad (as the
.I pure
function in the
.MODULE Applicative
type class).
The implementation of these operators depends on the monad.
The following examples, with
.MODULE Maybe
and
.MODULE Either
monads, provide the general idea behind monads.

.SH
The Maybe Monad
.PP
A monad was created from the Maybe data structure.
And this can be summarized this way: either there is a value and the next function is called, or the computation stops and returns Nothing.

Let's take an example: three functions in the Maybe monad (returning a Maybe value).
.SOURCE Haskell ps=8 vs=9p
function1, function2 :: Maybe Int
function3 :: Int -> Maybe Int
expression = function1 >> function2 >>= function3
.SOURCE
.BELLOWEXPLANATION1
.FUNCTION function1
and
.FUNCTION function2
provide a
.MODULE Maybe
Int (they have no parameters) and
.FUNCTION function3
has a single Int parameter.
.BELLOWEXPLANATION2
The following figure represents the
.FUNCTION expression
function.
.PS
reset
boxht=0.3
define function { [
	right
	X: box $1
	arrow "\fINothing\f[]" above to last box + (1.5,0)
	circle rad 0.1 fill "End" "" ""
] }
down
FUN1: function("function1");
move
FUN2: function("function2");
move
FUN3: function("function3");
.\" Circles
move to FUN1.sw + (0.375,-0.10)
circle ">>" rad 0.15
move to FUN2.sw + (0.375,-0.10)
circle ">>=" rad 0.15
arc -> from FUN1.sw to FUN2.nw "Just \fIresult\f[]         " rjust "ignore \fIresult\f[]         " rjust
arc -> from FUN2.sw to FUN3.nw "Just \fIresult\f[]         " rjust "give \fIresult\f[] to         " rjust "function3         " rjust
move to FUN3.sw + (0.375,0)
arrow "  Just \fIresult\f[]" ljust
circle rad 0.1 fill "End      " rjust
move
move right
"Maybe monad: function1 >> function2 >>= function3"
.PE
.BELLOWEXPLANATION1
First,
.FUNCTION function1
is called.
In case its result is
.CONSTRUCTOR Nothing,
the
.FUNCTION expression
stops and returns
.CONSTRUCTOR Nothing.
Otherwise,
.FUNCTION function2
is called.
Again, in case its result is
.CONSTRUCTOR Nothing,
the
.FUNCTION expression
stops and returns
.CONSTRUCTOR Nothing.
Otherwise, the
.I result
of
.FUNCTION function2
is provided as argument to the next function.
This value isn't in a Maybe structure.
.BELLOWEXPLANATION2

.KS
Let's take a few examples with concrete values.
.SOURCE Haskell ps=8 vs=9p
function3 x = Just (x+3)
Just 1 >> Just 2 >>= function3
--> Just 5
Nothing >> Just 2 >>= function3
--> Nothing
.SOURCE
.KE

The implementation is fairly simple to guess.
.SOURCE Haskell ps=8 vs=9p
instance  Monad Maybe  where
  (Just x) >>= k    = k x
  Nothing  >>= _    = Nothing
.SOURCE
.BELLOWEXPLANATION1
The monad type class only requires to implement the
.I (>>=)
operator.
The
.I (>>)
operator is derived from the previous one, and the
.I return
function is defined by default as a synonym of the
.I pure
function in the Applicative type class.
.BELLOWEXPLANATION2

The
.MODULE Maybe
monad is very simple and works well to chain filter functions, similar to the shell programs:
.ft CW
cat file | grep value | grep othervalue > result.
.ft
However, the Maybe structure is fairly limited: functions cannot indicate an error, which will be fixed with the next monad.

.SH
The Either Monad
.PP

.PS
reset
boxht=0.3
define function { [
	right
	X: box $1
	arrow "Left \fIerror\f[]" above to last box + (1.5,0)
	circle rad 0.1 fill "End" "" ""
] }
down
FUN1: function("function1");
move
FUN2: function("function2");
move
FUN3: function("function3");
.\" Circles
move to FUN1.sw + (0.375,-0.10)
circle ">>" rad 0.15
move to FUN2.sw + (0.375,-0.10)
circle ">>=" rad 0.15
arc -> from FUN1.sw to FUN2.nw "Right \fIresult\f[]         " rjust "ignore \fIresult\f[]         " rjust
arc -> from FUN2.sw to FUN3.nw "Right \fIresult\f[]         " rjust "give \fIresult\f[] to         " rjust "function3         " rjust
move to FUN3.sw + (0.375,0)
arrow "  Right \fIresult\f[]" ljust
circle rad 0.1 fill "End      " rjust
move
move right
"Either monad: function1 >> function2 >>= function3"
.PE

.NH 3
Implement a monad
.PP

.NH 3
To sort
.PP

.BULLET
.UL Num :
numbers.
.br
Required functions:
.BX "+ * abs signum fromInteger negate"
.BULLET
.UL Eq :
types that can be tested for equality.
.br
Required function:
.BX (==)
.BULLET
.UL Ord :
types that can be ordered.
.br
Required function:
.BX compare
.BULLET
.UL Semigroup :
types that can be concatened together (such as lists).
.br
Required function:
.BX (<>)
.BULLET
.UL Monoid :
semigroup with an identity value.
An identity value can be an empty list for a list type.
.br
Required function:
.BX mempty
.ENDBULLET

Monad
Foldable
Read
Alternative
Show

.\".SOURCE haskell ps=8 vs=9p
.\".SOURCE

.NH 2
Alternative
.PP
The
.MODULE Alternative
class helps chaining function calls and takes the first valid value returned by these functions.

.LP
The definition of the
.MODULE Alternative
class:
.SOURCE Haskell ps=9 vs=10p
class Applicative f => Alternative f where
  --The identity of '<|>'
  empty :: f a

  --An associative binary operation
  (<|>) :: f a -> f a -> f a
.SOURCE
.BELLOWEXPLANATION1
In the
.MODULE Alternative
type class, two functions are defined:
.I empty
and
.BX "<|>" .
.BELLOWEXPLANATION2

The instance for the "Maybe" type:
.SOURCE Haskell ps=9 vs=10p
instance Alternative Maybe where
  empty = Nothing

  Nothing <|> r = r
  l       <|> _ = l
.SOURCE
.BELLOWEXPLANATION1
First, our value if nothing is matched:
.CONSTRUCTOR Nothing.
Then, either the first parameter is invalid so the second is given, or the first parameter is valid and it is used.
.BELLOWEXPLANATION2

In practice: let's use the module
.MODULE Parsec
to parse an URL scheme with this logic:
.SOURCE Haskell ps=9 vs=10p
pScheme :: Parser Text
pScheme
  =   string "file"
  <|> string "ftp"
  <|> string "https"
  <|> string "irc"
  <|> string "mailto"
.SOURCE
.BELLOWEXPLANATION1
In case you were wondering:
.I string
is a Parsec function testing a string at the current index location of the parsed data.
In this case, the function tests for the scheme in the URL.
.BELLOWEXPLANATION2

.\" KS/KE: Keep this text preserved from any cut (page break, etc.)
.KS
The main difference between
.MODULE Alternative
and a simple
.I or
statement in an imperative or object-oriented programming language is the type: the
.UL semantic
.FOOTNOTE1
Ok, maybe not
.UL exactly
the "semantic" but mostly the type, which is already a big step forward.
.FOOTNOTE2
is preserved.
In an imperative language, this is valid:
.SOURCE Python ps=8 vs=9p
if True or 1 or some_structure:
	serious(fuckingsly)

# or, in some languages:

val = True or 1 or some_structure
.SOURCE
.BELLOWEXPLANATION1
Both examples are valid in Python.
.BELLOWEXPLANATION2
.KE

.NH 2
Arrows
.PP
Arrows are another way than monads to express a logical implication between function calls.
