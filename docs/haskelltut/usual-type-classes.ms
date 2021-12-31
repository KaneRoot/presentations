.SECTION Usual Haskell type classes
.PARAGRAPH_INDENTED
A type class represents a property of a data type.
For example, a type that isn't empty (NonEmpty), or that can be serialized in a printable string format on the terminal (Show).
Type classes allow developers to focus on an abstraction of the types they work with;
a function can express constraints on its parameters instead of actual types\*[*].
.FS
And
.I abstract
code isn't in any way a synonym of
.I slowness .
This idea will be destroyed in the section on performances.
.FE

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

.SUBSECTION Eq: types that can be tested for equality
.PARAGRAPH_INDENTED
The
.TYPECLASS Eq
type class represents all types that can be tested for equality.
It is based on the
.MODULE Bool
data type, and requires only to define a single function to test for equality.
Here is the definition:
.SOURCE Haskell ps=8 vs=9p
class  Eq a  where
  (==), (/=) :: a -> a -> Bool

  x /= y     = not (x == y)
  x == y     = not (x /= y)
.SOURCE
.BELLOWEXPLANATION1
Either the operator
.OPERATOR (==)
is defined or its opposite
.OPERATOR (/=) .
The other will be derived from the implemented one, see the default implementations.
.BELLOWEXPLANATION2

An example of data structure, part of the Eq type class:
.SOURCE Haskell ps=8 vs=9p
data Room = Room Int --a room has a number

instance Eq Room where
  --Rooms are "equal" if they have the same number.
  (Room x) == (Room y) = x == y
.SOURCE
.BELLOWEXPLANATION1
The Room data structure represents a room with a number in an hostel, for example.
This example shows how to implement an instance of the
.TYPECLASS Eq
type class.
.BELLOWEXPLANATION2

.KS
Then, the code can be tested in GHCi:
.SOURCE Haskell ps=8 vs=9p
r1 = Room 4
r2 = Room 4
r3 = Room 8
r1 == r2
> True
r1 == r3
> False
.SOURCE
.KE

Before switching to another type class, here is the implementation of the
.TYPECLASS Eq
type class for the
.MODULE Maybe
data structure.
.SOURCE Haskell ps=8 vs=9p
data  Maybe a  =  Nothing | Just a
  deriving (Eq, Ord)
.SOURCE
.BELLOWEXPLANATION1
The actual implementation doesn't even exist: it is derived automatically.
This way of deriving implementations of type classes from data structures won't be covered right now.
See later sections.
.BELLOWEXPLANATION2

.SUBSECTION Ord: types that can be sorted
.PARAGRAPH_INDENTED
The
.TYPECLASS Ord
type class represents all types that can be sorted (is a value smaller or equal than another).
The type class introduces the following data structure and function.
.SOURCE Haskell ps=8 vs=9p
--data structure to compare values
data Ordering = LT | EQ | GT

--Ord depends on the class Eq: any sortable
--value has to be part of the Eq type class
class Eq a => Ord a where
  --only function to implement
  compare :: a -> a -> Ordering
.SOURCE

Here is an implementation of the type class for the previous
.MODULE Room
data structure.
.SOURCE Haskell ps=8 vs=9p
instance Ord Room where
  --'compare' already exists for integer values
  compare (Room x) (Room y) = compare x y
.SOURCE

Now the
.MODULE Room
data structure is part of the
.TYPECLASS Ord
type class, a list of rooms can be sorted.
.SOURCE Haskell ps=8 vs=9p
import Data.List (sort)
sort [Room 2, Room 3, Room 1]
--> [Room 1, Room 2, Room 3]
.SOURCE

As you can expect, some functions require their parameter to allow sorting.
Sorting functions, sure, but also
.FUNCTION min
and
.FUNCTION max
functions for example.

Some widespread types and data structures are part of the Ord typeclass, such as
.MODULE Int,
.MODULE Maybe
and
.MODULE Either
for example.
.SOURCE Haskell ps=8 vs=9p
sort [Right 2, Right 1]
--> [Right 1, Right 2]
.SOURCE
.BELLOWEXPLANATION1
Nothing fancy.
.BELLOWEXPLANATION2

This also works with nested structures.
.SOURCE Haskell ps=8 vs=9p
sort [Right (Just 2), Right (Just 2)]
--> [Right (Just 1), Right (Just 2)]

--like, for real
sort [ Right (Just (Right (Room 2)))
     , Right (Just (Right (Room 1)))
     ]
--> [ Right (Just (Right (Room 1)))
  , Right (Just (Right (Room 2)))
  ]
.SOURCE
.BELLOWEXPLANATION1
Let's break the last example.
The
.FUNCTION sort
function allows to sort a very nested structure.
.I How ?
The
.MODULE Room
structure is part of
.TYPECLASS Ord
so it can be sorted.
.MODULE Either
too, so
.BX "Right (Room 1)"
is sortable.
Since this can be sorted and that
.MODULE Maybe
is part of the
.TYPECLASS Ord
typeclass, then
.BX "Just (Right (Room 1))"
also can be sorted, etc.
.BELLOWEXPLANATION2
And we just touched something really interesting with Haskell.
Despite its simplity, code is generic and reusability is great!

.SUBSECTION Functor: applying a function in a structure
.PARAGRAPH_INDENTED
A functor is a type allowing to apply a function to its inner value(s), through a
.FUNCTION fmap
function.
The following code represents the
.MODULE Functor
type class and the only required function.
.SOURCE Haskell ps=8 vs=9p
class Functor a where
  fmap :: (a -> b) -> f a -> f b
.SOURCE
.BELLOWEXPLANATION1
fmap takes a function (from
.I a
to
.I b )
and a functor (such as a list) containing values of type
.I a .
The fmap function produces a functor with values of type
.I b .
.BELLOWEXPLANATION2

.FUNCTION fmap
and
.FUNCTION map
functions are synonyms for a list.
Here is an example.
.SOURCE Haskell ps=8 vs=9p
fmap (+3) [1,2,3]
--> [4,5,6]
.SOURCE
.BELLOWEXPLANATION1
The
.FUNCTION fmap
function for lists applies a function to each element of that list, and returns a new list.
.BELLOWEXPLANATION2

And as we saw with the type of the
.FUNCTION fmap
function, the returned functor can have a different inner type.
Example:
.SOURCE Haskell ps=8 vs=9p
fmap show [1,2,3]
--> ["1","2","3"]
.SOURCE
.BELLOWEXPLANATION1
The
.FUNCTION show
function takes a value and provides a string representation.
.BELLOWEXPLANATION2

Lists aren't the only functors.
Any type containing data
.I "product data type" ) (
can be a functor.
.MODULE Maybe
and
.MODULE Either
are functors, too.
So it is possible to apply a function to their inner values.
.SOURCE Haskell ps=8 vs=9p
fmap (+3) (Just 3)
--> Just 6
fmap (+3) (Nothing)
--> Nothing
.SOURCE
.BELLOWEXPLANATION1
In case the
.MODULE Maybe
functor contains a value, the function is applied.
Otherwise, it just returns
.CONSTRUCTOR Nothing.
.BELLOWEXPLANATION2

.SOURCE Haskell ps=8 vs=9p
fmap (+3) (Right 3)
--> Right 6
fmap (+3) (Left "error")
--> Left "error"
.SOURCE
.BELLOWEXPLANATION1
The behavior of the
.MODULE Either
functor is similar to
.MODULE Maybe.
In case there is a value (read: a
.CONSTRUCTOR Right
value), the function is applied to it.
In case there is an error (read: a
.CONSTRUCTOR Left
value), the function is ignored.
.BELLOWEXPLANATION2
The general idea is the same behind both the Maybe and the Either functor implementations:
either the value is valid and the function is applied to it, otherwise the error value is returned.
This isn't exactly the same as the list functor, where the data type doesn't represent any possible "error".
The implementation of the
.TYPECLASS Functor
type class actually is dependent of the
.UL semantic
of the data type.
.\"A type
.\".I f
.\"is a
.\".MODULE Functor
.\"if it provides a function
.\".I fmap
.\"which, given any types
.\".I a
.\"and
.\".I b
.\"lets you apply any function from
.\".I "(a -> b)"
.\"to turn an
.\".I "f a"
.\"into an
.\".I "f b,"
.\"preserving the structure of
.\".I f .

.SECTION_NO_NUMBER Maybe implementation
.PARAGRAPH_UNINDENTED
To further demystify the
.TYPECLASS Functor
type class, here is the implementation for the
.MODULE Maybe
data type.
.SOURCE Haskell ps=8 vs=9p
instance  Functor Maybe  where
  fmap _ Nothing       = Nothing
  fmap f (Just a)      = Just (f a)
.SOURCE
.BELLOWEXPLANATION1
In case the maybe has no value, this returns nothing.
Otherwise, this creates a new
.MODULE Maybe
with
.BX "f a"
as the value.
.BELLOWEXPLANATION2

.SECTION_NO_NUMBER Imperative vs functional structure manipulation
.PARAGRAPH_INDENTED
Functors are a way to manipulate data structures.

The following figure compares a list manipulation from C and Haskell perspectives.

.PS
reset
.defcolor lightgreen rgb 0.9 1.0 0.9
.defcolor lightblue  rgb 0.9 0.9 1.0
.defcolor bloatcode  rgb 1.0 0.1 0.1
down
boxht=0.2
boxwid=0.4
CLANG: "C"
move; left; move; move; down
"\fIst = ...\f[]" ljust
move 0.2
FORLOOP: "for (int i = 0; i<= \fIst\f[].len; i++) {" ljust outline "bloatcode"
move 0.1; move right; down
CBOX: box "..." shaded "lightgreen"
move to FORLOOP + (0,-0.4)
"}" outline "bloatcode"
move to CLANG + (1.4,0)
Haskell: "Haskell"
move; move left 0.2; down
FMAP: "fmap" rjust
move to FMAP.c + (0.3,boxht/2)
FMAPBOX: box "..." shaded "lightgreen"
move to FMAPBOX.e + (0.3,0)
"\fIstructure\f[]"
line from CLANG + (0.8,0) to CLANG + (0.8,-1)
.\" Title
move to CLANG + (0.8,-1.3)
"manual structure manipulation vs fmap"
.PE
.BELLOWEXPLANATION1
(Bloat) code required in C to loop over the data in red.
Green boxes represent code for data manipulation.
Manipulated structure is in italics.
.BELLOWEXPLANATION2
.QUESTION "Why is this interesting" ?
First, mindless code should be removed from the source.
In this example, writing code to browse a list is a \fBvery common\f[] pattern, it should be abstracted\*[*].
.FS
Less code means less ways to screw everything, and more focus on the actual problem to solve.
That's a rule of thumb everybody should try to follow: write less code unless it makes the code cryptic.
.FE
Second, having an abstraction on "browsing a structure" allows to change the structure at no cost.
What if the structure wasn't a simple list anymore?
The C code should be rewritten completely.

.SECTION_NO_NUMBER Synonym: infix <$> operator
.PARAGRAPH_INDENTED
Finally, the
.FUNCTION fmap
function has a synonym: the infix operator
.BX "<$>"
.SOURCE Haskell ps=8 vs=9p
(+1) <$> Just 1
--> Just 2
.SOURCE
.BELLOWEXPLANATION1
This may not seem much right now, but Haskell is often all about chaining expressions.
Operators are very common, and often add readability with complex code.
This operator
.ft CW
<$>
.ft
actually is relevant for the next sections and to write idiomatic Haskell code.
.BELLOWEXPLANATION2

.SECTION_NO_NUMBER Conclusion on functors
.PARAGRAPH_INDENTED
The functor type class allows a great code abstraction.
First, it applies a function to a whole data structure with a single and simple function call.
There is no need for loops, and it is generic (works the same way for many types).
Second, it follows a general and expected behavior: the function only applies when relevent, depending on the
.UL semantic
of the data structure.
The function isn't propagated when the data type conveys an error (such as a
.CONSTRUCTOR Left
value in an Either data type).

And keep in mind the <$> operator!

.SUBSECTION Applicative: applying parameters to a functor
.PARAGRAPH_INDENTED
A functor is a type containing data that can be changed through the
.FUNCTION fmap
function.
The applied function may require several arguments, and applying it to a single argument creates another function.
Example:
.SOURCE Haskell ps=8 vs=9p
--remember, <$> is an infix `fmap`
(+) <$> Just 3
--> Just (+3)
.SOURCE
.BELLOWEXPLANATION1
Unfortunatelly, GHCi cannot print functions this way, but this is the right result.
.br
In functional programming, a data can be a function, as any other value.
The Maybe functor now contains a function, lacking an argument.
.BELLOWEXPLANATION2
An applicative functor is a way to provide a parameter to a functor.
The Applicative type class introduces the infix operator
.OPERATOR <*>
to
.I apply
a new parameter to a functor.
.SOURCE Haskell ps=8 vs=9p
(+) <$> Just 3 <*> Just 2
--> Just 5
.SOURCE
.BELLOWEXPLANATION1
The (+) function gains a first argument with
.FUNCTION fmap
(<$>). and creates the
.BX "Just (+3)"
value (which is (+3) in the
.MODULE Maybe
functor).
Then, the function
.I "(+3)"
is passed to the
.BX "Just 2"
value via the <*> operator.
And this completes the function call and the result is
.BX "Just 5"
.BELLOWEXPLANATION2

.QUESTION "Why is this a thing?"
Applicative functors present a way to handle a common code structure.

.TBD

.PS
reset
.defcolor lightgreen rgb 0.9 1.0 0.9
.defcolor lightblue  rgb 0.9 0.9 1.0
.defcolor bloatcode  rgb 1.0 0.1 0.1
down
boxht=0.2
CTITLE: "C"
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
move down 0.05
box "function3 (ret1, ret2)" wid 1.3 shaded "lightgreen"
move to CTITLE + (1.6,0)
HASKELL: "Haskell"
move
moveht=0.1
box "function3" shaded "lightgreen"
move; circle "<$>" rad 0.13; move
box "function1" shaded "lightgreen"
move; circle "<*>" rad 0.13; move
box "function2" shaded "lightgreen"
line from CTITLE + (0.8,0) to CTITLE + (0.8,-2.3)
.\" Title
move to CTITLE + (0.8,-2.5)
"getting \fIfunction3\f[] parameters ready, then call it"
.PE
.BELLOWEXPLANATION1
Code required in C to check for errors is in red, error managment is in blue, function calls are in green.
.BELLOWEXPLANATION2

.SECTION_NO_NUMBER Conclusion on applicative functors
.PARAGRAPH_INDENTED
Functors and Applicative functors encourage to create functions with a similar way of handling data or errors, by using data structures such as
.MODULE Maybe
or
.MODULE Either.

.SUBSECTION Monad: binding functions
.PARAGRAPH_INDENTED
Functional programming, and particularly in Haskell, a function is a single expression.
However, one may want to perform multiple function calls in this single expression.
A
.MODULE Monad
is about binding these function calls together\*[*].
.FS
It is frightening that nobody just says this to explain monads.
The mathematical explaination is incredibly useless when talking to developers, stop even trying.
.FE

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
they are operators (simple functions) binding function calls\*[*].
.FS
Also, monads are more generic than
.I "try and catch"
since the behavior can be changed (it depends on the monad) and do not require a compiler-supported mechanism.
.FE
In practice, a Monad is defined by three functions:
.BULLET
.I (>>=) ,
also known as the
.I bind
operator, which computes the first function and give the result to the second (as its last argument);
.BULLET
.I (>>) ,
also known as the
.I then
operator, which computes the first function and drop the result then computes the second;
.BULLET
.I return ,
which takes a value and puts it in the context of the monad (as the
.I pure
function in the
.MODULE Applicative
type class).
.ENDBULLET
The implementation of these operators depends on the monad.
The following examples, with
.MODULE Maybe
and
.MODULE Either
monads, provide the general idea behind monads.

.SECTION_NO_NUMBER The Maybe Monad
.PARAGRAPH_INDENTED
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

.SECTION_NO_NUMBER The Either Monad
.PARAGRAPH_INDENTED

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

.SECTION_NO_NUMBER Conclusion on monads

.SUBSECTION The IO monad
.PARAGRAPH_INDENTED

.SUBSUBSECTION To sort
.PARAGRAPH_INDENTED

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

.SUBSECTION Alternative
.PARAGRAPH_INDENTED
The
.MODULE Alternative
class helps chaining function calls and takes the first valid value returned by these functions.

.PARAGRAPH_UNINDENTED
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
.UL semantic \*[*]
is preserved.
.FS
Ok, maybe not
.UL exactly
the "semantic" but mostly the type, which is already a big step forward.
.FE
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

.SUBSECTION Arrows
.PARAGRAPH_INDENTED
Arrows are another way than monads to express a logical implication between function calls.
