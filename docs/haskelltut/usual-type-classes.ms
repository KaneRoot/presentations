.NH 1
Usual Haskell type classes
.PP
A type class is the set of functions.
Each type needs to implement them to be part of the type class.
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

.NH 2
Monad
.PP
Functional programming, and particularly in Haskell, a function is a single expression.
However, one may want to perform multiple function calls in this single expression.
A
.MODULE Monad
is about binding these function calls together.
.FOOTNOTE1
And I seriously find it frightening that nobody on the freaking planet just say this to explain monads.
The mathematical explaination is incredibly useless when talking to developers, stop even trying.
.FOOTNOTE2

Binding function calls is like a
.I "try and catch"
in other languages.
In Java for example, when a function returns an exception, the remaining function calls are ignored and the exception is
.I catched ,
meaning that this exception is the result of the function calls.
Monads are just a generalization of this principle.

.SH
Example: Maybe
.PP
A monad was created from the Maybe data structure.
And this can be summarized this way: either there is a value and the next function is called, or the computation stops and returns Nothing.

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
.SOURCE Python
if True or 1 or some_structure:
	serious(fuckingsly)

# or, in some languages:

val = True or 1 or some_structure
.SOURCE
.BELLOWEXPLANATION1
Both examples are valid in Python.
.BELLOWEXPLANATION2
.KE
