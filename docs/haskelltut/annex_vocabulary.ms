.NH 1
Vocabulary
.LP

.KS
.BULLET
.UL Class :
category of types.
.br
Example: the class
.MODULE Show
represents all types that can be printed in the terminal.
.KE

.KS
.BULLET
.UL Constructor :
keyword to create a structure.
.br
Example:
.CONSTRUCTOR True
for a
.MODULE Bool.
.KE

.KS
.BULLET
.UL Method :
function in a class.
.br
Example:
.I fmap
in the type class
.MODULE Functor.
.KE

.KS
.BULLET
.UL Instance :
function implementation for a real type.
.br
Example:
.SOURCE Haskell
instance  Functor Maybe  where
  fmap _ Nothing   = Nothing
  fmap f (Just a)  = Just (f a)
.SOURCE
.KE

.KS
.BULLET
.UL Prelude :
standard library, available by default in every distribution of Haskell.
Even included by default in any Haskell code without any
.UL import
statement.
.KE

.KS
.BULLET
.UL Recursivity :
the definition of something (a function or a structure) includes itself.
.br
Example:
.SOURCE Haskell
data List = Element Int List | Void
.SOURCE
.KE

.KS
.BULLET
.UL "Referential transparency and purity" :
same parameters leads to same result.
A function will always provide the same result given a set of parameters.
.br
Example:
.BX "1 + 1"
always returns 2.
.br
These functions only work on their parameters and have
.UL "no side effects" ,
they are called
.I pure .
On the contrary, when a function requires side effects (through networking, printing something in the terminal or getting an input from somewhere), the function isn't pure and its result cannot be known from a previous call.
.KE

.KS
.BULLET
.UL Laziness :
compute a value only when necessary.
As a side effect, infinite lists are valid in Haskell.
An infinite list can be declared and used, unless the code tries to get all its values, they won't be computed.
.br
Example:
.SOURCE Haskell
--taking 5 elements of an infinite list
take 5 $ [1..]
--provides: 1, 2, 3, 4, 5
.SOURCE
.KE

.KS
.BULLET
.UL "High order function" :
treat functions as values.
.br
Example:
.SOURCE Haskell
apply :: (a -> b) -> a -> b
apply function value = function value
.SOURCE
.KE

.KS
.BULLET
.UL "Comprehension list" :
a way to create lists.
.br
Example:
.SOURCE Haskell
--create a list from 1 to infinity
[1..]

--create unique pairs of values
--from (1,1) to (10,10)
[(x,y) | x <- [1..10], y <- [x..10]]
.SOURCE
.KE

.ENDBULLET
