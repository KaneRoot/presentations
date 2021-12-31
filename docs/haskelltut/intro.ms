.SECTION Functional programming
.PARAGRAPH_INDENTED
FP can be seen as an
.ft I
"everything is a function"
.ft R
paradigm, an attempt to create programs as single mathematical expressions.
In that regard, each line of code represents the
.UL intent
of the developer more than
.I "how to perform stuff" .

.SUBSECTION Why this document?
.PARAGRAPH_UNINDENTED
.BULLET
FP is great, let's talk about it.
.BULLET
Haskell is great because it helps express the code with more nuances than other languages, but is a bit overwhelming on first try, so let's summary stuff.
.BULLET
Everyone can learn something in this paper, even reading only the first pages and still writing in imperative languages.
.BULLET
Explain Haskell, its main API and a few useful modules.
.BULLET
Provide a few real-life examples.
.ENDBULLET

.SUBSECTION Why FP and Haskell?
.PARAGRAPH_UNINDENTED
.BULLET
.UL Declarative :
the language requires to write
.I "what is"
instead of
.I "how to perform an action" .
This simplifies the code tremendously, in most cases.
.BULLET
.UL Simple :
the language actually is easy to grasp.
There are many libraries and different ways to code, and this is what's actually hard to handle at first.
.BULLET
.UL "Great type system" :
Haskell has one of the easiest ways to create types and constraints on types (equality, order, non empty collection, etc.).
Many types are available in the standard distribution of Haskell, and are basic enough to be widespread in libraries.

While strict, the type system also allows a very generic coding style
.B "by default" .
Code reuse is (near?) optimal.
.BULLET
.UL "Concise" :
functions can be
.I composed
together, meaning that the result of a function is the parameter of another.
In practice, this allows to write very short functions by removing unnecessary code\*[*].
.FS
Also, parenthesis aren't all over the place like in other FP languages (personal preference).
.FE
.BULLET
.UL "Purity (or referential transparency)" :
a function only needs its parameters to work, no global variables.
A pure function called twice with the same parameters will always provide the same result.
Other
functions (called
.I unpure ),
managing events outside the application (such as IO in general), have a distinctive type.
Consequently, investigation is easy when an error occurs: only a fraction of the functions handles hazardous operations.
Furthermore, pure functions are great candidates for
.I memoization ,
see the section on performances.
.ENDBULLET

.CITATION1
The purpose of abstraction is not to be vague, but to create a new semantic level in which one can be absolutely precise.
.CITATION2
.NAMECITATION Edsger W. Dijkstra

.SUBSECTION Sections
.PARAGRAPH_UNINDENTED
First, we'll talk about base concepts in FP, which will provide everything one need to start with both FP and Haskell.
This will be quick, there is very little theory in this document.

Then the Haskell syntax: an introduction to the type system, basic types available in any Haskell distribution, how to write a function, etc.

Usual type classes will be presented to get some sense of the default Haskell library.
This includes the main classes such as Functor, Applicative and Monad, and many others.
The understanding of them is crutial: this is required to know how to use most of the third party libraries.

Some of the most basic functions in the Haskell distribution will be presented.
This includes functions around lists (such as
.I fold ,
.I head
and
.I tail ,
.I map
and
.I filter )
a few functions around the
.MODULE Text
module and how to manage user interaction in general, etc.

Then, a few ways to create complex data structures will be presented.
This includes a clever hack (phantom type), some conventions to write data structures (tagless final, generalized algebraic data type) and the reuse of a generic data structure (Free monad).

After these sections, a few advanced topics are very briefly introduced:
.BULLET
.UL Lenses ,
to handle complex or nested data structures.
This was one of the worst aspects of Haskell, until Lenses made nested structures so simple to manage that it became an asset.
.BULLET
.UL Networking ,
to exchange packets with widespread protocols.
.BULLET
.UL "Profiling applications" ,
to know what function actually takes time or memory to compute.
As we will see, this is very empirical.
.BULLET
.UL "Performances" ,
to gain massive computation boosts with some tips.
This includes rewriting functions in an optimizable way or use proper types, for example.
.BULLET
.UL "Parallelism and concurrency" ,
to either make several computations at the same time on different cores,
or switch between two computations that require pauses\*[*].
.FS
For example, receiving network packets takes time, and a packet can be received only partially and requires to wait to retrieve the rest, and with concurrency the application can perform other actions while waiting for the packet to arrive.
This improves performances by a large margin without even requiring parallelism.
.FE
.ENDBULLET

Then, a
.I misc
section, for everything that is useful but doesn't belong anywhere else.

Finally, this document provides a few pointers on useful documentations to dig more advanced concepts.

.SECTION_NO_NUMBER How to read this document
.PARAGRAPH_UNINDENTED
The following presents a typical function declaration.
.SOURCE haskell ps=8 vs=9p
multBy2 :: Int -> Int  --Function's type
multBy2 x = x * 2      --its name, param and body
.SOURCE
.BELLOWEXPLANATION1
Function
.I multBy2
takes an integer and returns an integer.
.BELLOWEXPLANATION2

Another function declaration, with a slightly different syntax.
.SOURCE haskell ps=8 vs=9p
add :: Int -> Int -> Int  --Function's type
add x y                   --its name and parameters
  = x + y                 --its body
.SOURCE
.BELLOWEXPLANATION1
The first line is the function's type:
.I add
takes two integers and returns another one.
The second line is the function name and named parameters (x and y).
The last line is the body of the function.
In Haskell, indentation is important to know what is the context of the function or not, but it isn't strict on the number of spaces.
.BELLOWEXPLANATION2

This document will sometimes present function results, example:
.SOURCE haskell ps=8 vs=9p
1 + 2   --some function call
--> 3     --and its result
.SOURCE
