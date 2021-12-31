.SECTION Misc
.PARAGRAPH_INDENTED
This section is a way to provide some unordered informations.

.SUBSECTION Kinds
.PARAGRAPH_UNINDENTED
A simple value (such as a number) and a polymorphic type without specified type parameters are not the same
.UL kind
of data.
In the first case, a value is directly usable, in the second this is a way to create a value.
.UL Kinds
were introduced to mark this difference, and a
.I kind
can be seen as a type of types.

The Kind
.BX *
means it is an actual, directly usable type.
The Kind
.BX "* -> *"
means the type requires a parameter.
Here is a list of examples:

.SOURCE haskell ps=8 vs=9p
Int :: *               --directly usable
Maybe :: * -> *        --needs an argument
Maybe Bool :: *        --directly usable
Either :: * -> * -> *  --takes 2 arguments
a -> a :: *            --function: directly usable
[] :: * -> *           --empty list: lacks a type
[Int] :: *             --list of integers: usable
(->) :: * -> * -> *    --arrow operator needs 2 types
.SOURCE
.BELLOWEXPLANATION1
Kinds of types can be verified with ghci by typing
.BX ":kind"
then the type to check.
Example:
.BX ":kind Maybe"
.BELLOWEXPLANATION2

.TBD

.SECTION_NO_NUMBER A simple note...
.PARAGRAPH_UNINDENTED

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
