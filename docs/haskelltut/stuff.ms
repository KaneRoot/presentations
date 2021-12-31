.SECTION To the point
.PARAGRAPH_INDENTED
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
.SUBSECTION Error cases
.SUBSUBSECTION Pure function, single parameter and potential erroneous parameter.
.PARAGRAPH_INDENTED
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
.SOURCE Haskell
foo :: Maybe Int -> Maybe Int
foo Nothing = Nothing
foo (Maybe x) = Just (x + 2)
.SOURCE
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
.UL "apply when semantically valid" \*[*].
.FS
One may refer to the
.I fmap
function is a
.I lift
function.
It takes a pure function
.BX "(a -> b)"
and lift it to be valid in a functor context
.BX "(f a -> f b)"
.FE

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

In this last version, our function is valid for many functors\*[*].
.FS
This is a bit like Java interfaces on steroids.
.FE
.
.
.SECTION Notes: quick and dirty
.PARAGRAPH_INDENTED
A list of the most used operators:
.SOURCE Haskell ps=8 vs=9p
 ($)   ::                (a -> b) ->   a ->   b
 (<$>) :: Functor f =>   (a -> b) -> f a -> f b
 (<*>) :: Functor f => f (a -> b) -> f a -> f b
.SOURCE
.ps 9

And how to use them\*[*]:
.FS
Remember:
.I Maybe
is a functor, and parameters
.I a
and
.I b
are simple types, such as
.I Integer .
.FE
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
.SECTION Pure theory
.
.
.SUBSECTION Covariant functor
.PARAGRAPH_INDENTED
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
.I f \*[*].
.FS
There are a lot of functors classes:
.MODULEX Applicative
.MODULEX Monad
.MODULEX Bifunctor
etc.
.TBD
.FE
.
.
.SUBSECTION Contravariant functor
.PARAGRAPH_INDENTED
A contravariant functor is defined as a covariant functor, but the function it takes as a first argument is from
.I b
to
.I a .

Whereas in Haskell, one can think of a
.MODULE Functor
as containing or producing values, a contravariant functor is a functor that can be thought of as consuming values\*[*].
.FS
This is a citation from the Haskell documentation on
.MODULE Data.Functor.Contravariant
and it deserves a read.
.FE

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
.SUBSECTION Bifunctor
.PARAGRAPH_INDENTED
A Bifunctor is a functor containing two functors.
.TBD
.
.
.SUBSECTION Profunctor
.PARAGRAPH_INDENTED
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
.SECTION Lenses: manipulate nested structures easily
.PARAGRAPH_INDENTED
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

.SECTION See also

.PARAGRAPH_INDENTED
Here is a list of things that got my attention and may be useful to you, too.

.SUBSECTION A few FP languages worth mentionning

.PARAGRAPH_INDENTED
.BULLET Haskell: FP without annoying parenthesis,
a lot of modules available,
purity,
conciseness,
laziness,
great compiler debugging capabilities,
etc.
.BULLET PureScript: (mostly) Haskell for the web, without the laziness.
Syntax and concepts are the same, base modules are mostly identical, etc.
PureScript also provides a very simple way of interacting with JavaScript.
.BULLET carp: statically typed lisp, no garbage collector and focused on performances.
Great for games, video and audio applications, etc.
.ENDBULLET

.SUBSECTION Modules
.PARAGRAPH_INDENTED
Here are some interesting modules, either for wide adoption in any kind of applications or in specific contexts.
Some already are included in base Haskell distributions.

What you need to know to use most of these modules:
.UL Functors ,
.UL Applicatives ,
.UL Monads .

.BULLET Data.ByteString: a replacement for
.MODULE String
focused on performances and binary representations.
It comes in two varieties: strict and lazy.
.TBD
.BULLET Data.Text: another replacement for
.MODULE String
but focused on Unicode text (contrary to
.MODULE String
which accepts any
.MODULE Char
input).
It comes in two varieties: strict and lazy, such as
.MODULE ByteString.
.BULLET prettyprinter: a simple way to create pretty outputs for your types.
.TBD
.BULLET MegaParsec: a library to create compilers.
There are many other libraries like this one,
but this is a nice balance between functionalities, performances and simplicity.
.BULLET PyF: a library to format strings, as the "f" operator in Python.
.ENDBULLET

.SUBSECTION Books, website and tutorials

.PARAGRAPH_UNINDENTED
For absolute beginners:
.BULLET Learn you a Haskell for Greater Good!
.[
Learn You a Haskell
.]
Good book about Haskell, for beginners.
There are a few examples to easily understand functions like
.UL zip ,
.UL zipWith ,
.UL sort ,
etc.
And the book presents a good part of what's actually in this document in a little more verbose way.
.ENDBULLET

Once you understand concepts presented in this document:
.BULLET Haskell wiki and its
.UL TypeClassOPedia
which helps understand type classes and how to use them.
There are many examples, great source to learn.
.BULLET Lenses for the mere Mortal
.[
lenses
.]
Great learning resource on lenses, with many explanations and examples.
.BULLET Nokomprendo:
.UL nokomprendo.gitlab.io ,
great tutorials on Haskell, in French.
The author also has a youtube channel I recommand.
.ENDBULLET
