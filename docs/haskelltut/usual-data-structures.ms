.SECTION Usual data structures
.PARAGRAPH_INDENTED
Haskell provides some very simple and ubiquitous data structures.
This very brief section covers some of them.

.SUBSECTION Bool
.PARAGRAPH_INDENTED
A boolean value is either true or false.
Haskell has probably one of the simplest way to express this.
.SOURCE Haskell ps=8 vs=9p
data Bool = True | False
.SOURCE
.BELLOWEXPLANATION1
This is a sum data type.
.BELLOWEXPLANATION2

.SUBSECTION List
.PARAGRAPH_INDENTED
A list in Haskell is as simple as one can expect.
.SOURCE Haskell ps=8 vs=9p
data List a = Nil | Cons a (List a)
.SOURCE
.BELLOWEXPLANATION1
This is a polymorphic, recursive data type.
.BELLOWEXPLANATION2

However, lists do have special notations in Haskell.
.I "List a"
is written as
.I "[a]" ,
the empty list
.I Nil ) (
as
.I []
and the constructor
.I Cons
is found as an infix operator
.I "(:)"
about everywhere in Haskell code.

.SUBSECTION String
.PARAGRAPH_INDENTED
A
.MODULE String
is a list of characters.
.SOURCE Haskell ps=8 vs=9p
type String = [Char]
.SOURCE
.BELLOWEXPLANATION1
This isn't a data structure but a type synonym.
Still, it made sense to show this here.
.BELLOWEXPLANATION2

.SUBSECTION Maybe
.PARAGRAPH_INDENTED
The
.MODULE Maybe
data structure is simple: either there is a value (stored with the
.CONSTRUCTOR Just
constructor) or there is nothing.

.SOURCE Haskell ps=8 vs=9p
data Maybe a = Just a | Nothing
.SOURCE
.BELLOWEXPLANATION1
This is a polymorphic algebraic data type.
Those words aren't so scary now, heh?
.BELLOWEXPLANATION2

.SUBSECTION Either
.PARAGRAPH_INDENTED
A computation can work or fail, which already can be represented by a
.MODULE Maybe
value.
However, uppon failure, an error value could be interesting to get instead of
.CONSTRUCTOR Nothing.
The
.MODULE Either
data type is exactly that, a way to convey a potential error value.
.SOURCE Haskell ps=8 vs=9p
data Either a b = Left a | Right b
.SOURCE
.BELLOWEXPLANATION1
This is a polymorphic algebraic data type, as Maybe.
.BELLOWEXPLANATION2

