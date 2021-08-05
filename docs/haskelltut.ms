.\" .RP = report document
.\" .RP
.nr PO 0.5i   \" page offset default 1i
.nr LL 7.5i   \" line length default 6i
.nr FM 0.5i   \" page foot margin default 1i
.\" .nr FF 1
.R1
no-label-in-reference
accumulate
.R2
.nr DI 0
.nr FN 0
.de FOOTNOTE1
\*{[\\n(FN]\*}
.FS \*{[\\n(FN]\*}
..
.de FOOTNOTE2
.FE
.\" increment our footnote counter
.nr FN +1
..
.de BELLOWEXPLANATION1
.sp 0.5
.ps 7
.vs 8p
..
.de BELLOWEXPLANATION2
.ps 9
.vs 11p
..
.de ENDBULLET
.in -2
..
.defcolor darkgreen rgb 0.1 0.5 0.2
.defcolor darkblue  rgb 0.3 0.3 0.7
.defcolor darkred   rgb 0.7 0.3 0.3
.de CONSTRUCTOR
.gcolor darkred
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
..
.de TYPE
.gcolor darkgreen
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
..
.de MODULE
.gcolor darkblue
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
..
.de MODULEX
.MODULE "\\$1,"
..
.de RESETFOOTNOTES
.nr FN 0
..
.de TBD
.ft B
To be defined or to finish.
.ft R
..
\# Bullet points
.de BULLET
.IP \(bu 2
..
.
\# Begin code box
.de b1
.B1
.sp 0.2
.ft CW
..
.
\# End code box
.de b2
.sp 0.5
.B2
.ft
..
.TL
Haskell, Purescript and functional programming - my notes
.AU
Philippe P.
.\" .AI
.\" University
.AB no
.\" .LP
.\" .DS B
Haskell is a well-known functional programming language combining a unique set of features.
Purescript is another language, very close to Haskell, designed to be compiled into javascript code for web developement.
Both these languages will be presented in this document, as well as some of the core concepts of functional programming in general.

This document is a collection of notes about these languages and some of their helper libraries.
This is not intended for a large public.
.\" .DE
.AE
.2C
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
.NH 1
To the point
.PP
Pure and simple functions (such as addition) are great: they are independant from the rest of the code.
They always have the same set of parameters, and work always as expected.
.UL But ,
our program is way more complicated than that.
Sometimes, an error occurs and we have to deal with it.
We still want our application to be seen as a simple and beautiful mathematical expression.
To that end, we need to deal with errors and conditional computations in a way that can be semantically understood by a human.
We need to communicate the
.UL intent ,
not just say what must be done.

I'll describe a few cases and a good way to handle them in Haskell.
.NH 2
Error cases
.NH 3
Pure function, single parameter and potential erroneous parameter.
.PP
Let's see a first example of error management with the
.MODULE Maybe
module.
We create a function
.I foo
which takes a parameter.
The parameter is a
.MODULE "Maybe Int,"
it can be either a
.CONSTRUCTOR Nothing
(there is no value) or a
.CONSTRUCTOR Just
.TYPE Int.
We want to perform a computation our single parameter only in case it is valid.
Otherwise, we should return
.CONSTRUCTOR Nothing.

Here is a first way (but too verbose):
.b1
.SOURCE Haskell
foo :: Maybe Int -> Maybe Int
foo Nothing = Nothing
foo (Maybe x) = Just (x + 2)
.SOURCE
.b2
.BELLOWEXPLANATION1
We use pattern matching on the parameter, then apply the function (+2) on the Int contained in the Maybe Int.
.BELLOWEXPLANATION2

A better way:
.SOURCE Haskell
 foo :: Maybe Int -> Maybe Int
 foo f = (+2) <$> f
.SOURCE
.BELLOWEXPLANATION1
No more pattern matching, the function (+2) is applied to our functor
.I f
only when it makes sense: when it is not
.I Nothing.
The operator
.BX <$>
is an infix version of
.I fmap.
.BELLOWEXPLANATION2

Our second example is based on the
.BX <$>
operator (which is an infix version of
.I fmap ).
This operator is well-known and designed for this purpose:
.UL "apply when semantically valid" .
.FOOTNOTE1
One may refer to the
.I fmap
function is a
.I lift
function.
It takes a pure function
.BX "(a -> b)"
and lift it to be valid in a functor context
.BX "(f a -> f b)"
.FOOTNOTE2

The semantic of the
.BX <$>
operator depends on the functor.
The
.MODULE Maybe
functor applies the function to the content only when there is one.
The
.MODULE Either
functor applies the function to the content if it is a valid value, not an error.
Either can be a
.CONSTRUCTOR Right
.TYPE "a"
or a
.CONSTRUCTOR Left
.TYPE "b"
(let's say for example a
.CONSTRUCTOR Left
.TYPE String
with the string being an error message), in which case the function isn't applied.

Our last function is less verbose than the first version.
And since the
.BX <$>
operator is generic and works for many functors, the type of our function can be improved to be more generic too.
An even better version:
.SOURCE Haskell
 foo :: Functor f => f Int -> f Int
 foo f = (+2) <$> f
.SOURCE
.BELLOWEXPLANATION1
We only changed the type of the function.
Compare this to what you would have written in an imperative language.
.BELLOWEXPLANATION2

In this last version, our function is valid for many functors.
.FOOTNOTE1
This is a bit like Java interfaces on steroids.
.FOOTNOTE2
.
.
.NH 1
Notes: quick and dirty
.PP
A list of the most used operators:
.SOURCE Haskell
 ($)   ::                (a -> b) ->   a ->   b
 (<$>) :: Functor f =>   (a -> b) -> f a -> f b
 (<*>) :: Functor f => f (a -> b) -> f a -> f b
.SOURCE
.ps 9

And how to use them
.FOOTNOTE1
Remember:
.I Maybe
is a functor, and parameters
.I a
and
.I b
are simple types, such as
.I Integer .
.FOOTNOTE2
:
.ps 8
.SOURCE Haskell
 fun :: Maybe (Int -> Int)
 fun = (*) <$> Just 3

 app :: Maybe Int
 app = fun <*> Just 3
.SOURCE
.ps 9
.BELLOWEXPLANATION1
The function
.I fun
provides the value
.I 3
to the function
.BX "(*)"
and puts it in a
.MODULE "Maybe."
The result is
.BX "Just (2*)"
and the function in the Maybe functor isn't complete.
The function
.I app
takes
.BX "Just (2*)"
and provides another parameter to this function contained in a functor.
Operator
.BX "<*>"
is from the
.MODULE Applicative
functor, and helps chaining (potentially faulty) parameters to an "unfinished" function in a functor (Maybe, Either, etc.).
As with the operator
If the functor is a Maybe and In case of a problem with one of the parameters, the whole expression will be replaced by
.CONSTRUCTOR Nothing
in a Maybe context for example.
.BELLOWEXPLANATION2

In an imperative programming language, avoiding a function call in case of a previous faulty computation can be done in (mainly) two ways.
Either the language implements some sort of "try and catch" mechanism (Java, Python, Zig, C++, etc.), or the developer has to check each value by hand (C).
.
.
.
.NH 1
Pure theory
.
.
.NH 2
Covariant functor
.PP
A
.ft B
covariant functor
.ft R
is a functor with its first argument being a function like this:
.BX "(a -> b)"
followed by a functor 
.BX "f a"
and returning a functor
.BX "f b" "."
We can see the types of the function (from
.I "a"
to
.I "b" ")"
and the second parameter is
.I "f a"
meaning that we will apply the function to the content of
.I f
(a functor containing a value of type
.I a )
and this will result in another functor containing a value of type
.I b .
This is
.UL covariant
since the function given in parameter is from
.I a
to
.I b
and we have to apply it to the content of the second parameter (a functor of type
.I a )
to get our result.
Types are in the same
.UL direction .

In Haskell, the definition of a functor is as follow:
.SOURCE Haskell
 class Functor f where
   fmap :: (a -> b) -> f a -> f b
.SOURCE
The
.I fmap
function is covariant, as we described.
The function
.BX "a -> b"
is transformed into a function
.BX "f a -> f b"
, and we say that the function is
.UL lifted
into
.I f .
.FOOTNOTE1
There are a lot of functors classes:
.MODULEX Applicative
.MODULEX Monad
.MODULEX Bifunctor
etc.
.TBD
.FOOTNOTE2
.
.
.NH 2
Contravariant functor
.PP
A contravariant functor is defined as a covariant functor, but the function it takes as a first argument is from
.I b
to
.I a .

Whereas in Haskell, one can think of a
.MODULE Functor
as containing or producing values, a contravariant functor is a functor that can be thought of as consuming values.
.FOOTNOTE1
This is a citation from the Haskell documentation on
.MODULE Data.Functor.Contravariant
and it deserves a read.
.FOOTNOTE2

In Haskell, the
.MODULE Data.Functor.Contravariant
module includes this definition of a Contravariant functor:
.SOURCE Haskell
 class Contravariant f where
   contramap :: (b -> a) -> f a -> f b
.SOURCE
As we can see, the order of the types for the first parameter are inversed compared to a covariant functor.
.
.
.NH 2
Bifunctor
.PP
A Bifunctor is a functor containing two functors.
.TBD
.
.
.NH 2
Profunctor
.PP
.ft B
Profunctor
.ft R
is a bifunctor with a
.ft B
contravariant
.ft R
as its first argument and a
.ft B
covariant
.ft R
as its second.
.
.
.
.NH 1
Lenses: manipulate nested structures easily
.PP
This section is roughly a summary of some books and web pages.
.[
lenses
.]
.TBD
.
.bp
.1C
.TS
allbox expand tab(:);
c | c | c
r | l | c.
Optic:Meaning:Where it is used
_
Lens' s a:The type s contains a value of type a.:Product types like records and tuples.
Prism' s a:T{
The type s contains zero or one value of type a, and a is sufficient to produce an s.
T}:Sum types like Maybe and Either.
Traversal' s a:T{
The type s contains zero, one, or many values of type a.
T}:T{
Collections like arrays, maps, and any other member of the Traversable type class.
They are also a more general form of lenses and prisms;
traversals which focus on at most one element (like lenses, prisms, and their composition) are called affine traversals.
T}
Iso' s a:T{
The types s and a are isomorphic if an s is sufficient to produce an a and vice versa.
T}:T{
Newtypes, interchangeable structures like Array and List, and any other pair of types which can be converted back and forth without losing information.
T}
.TE

.2C

.NH 1
See also

.PP
A few functional programming languages worth mentionning:

.BULLET
Haskell: FP without annoying parenthesis,
a lot of modules available,
laziness,
great compiler debugging capabilities,
etc.
.BULLET
PureScript: (mostly) Haskell for the web, without the laziness.
Syntax and concepts are the same, base modules are mostly identical, etc.
PureScript also provides a very simple way of interacting with JavaScript.
.BULLET
carp: statically typed lisp, no garbage collector and focused on performances.
Great for games, video and audio applications, etc.
.ENDBULLET

.NH 2
Modules

.PP
.BULLET
ByteString: a replacement for
.MODULE String
focused on performances.

.\" Hello this is a paragraph.
.\" 
.\" Hello this is a column.
.\" .bc
.\" 
.\" Hello this is another column.
.\" 
.\" 
