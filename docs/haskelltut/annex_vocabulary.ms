.NH 1
Annex: vocabulary
.PP
Browsing through different documentations of the Haskell language (and FP in general) can be really hard.
The technical corpus one must know prior to the reading of some of the explanations is almost preposterous.
So, in order to tackle this problem, here is a list of technical terms explained in a simple way.

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

.\".KS
.\".BULLET
.\".UL Method :
.\"function in a class.
.\".br
.\"Example:
.\".I fmap
.\"in the type class
.\".MODULE Functor.
.\".KE

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

.KS
.BULLET
.UL "Point free" :
writing a function without explicit parameters.
.br
Example:
.SOURCE haskell ps=8 vs=9p
add1 = + 1          --no explicit integer param
h = reverse . sort  --no explicit list param
.SOURCE
.KE

.KS
.BULLET
.UL "Eta conversion" :
making a function either more abstract (eta expansion) or less abstract (eta reduction).
.br
Example:
.SOURCE Haskell
\x -> abs x  --more abstract
abs          --less abstract
.SOURCE
.BELLOWEXPLANATION1
From the first to the second notation:
.I "eta reduction" .
From the second to the first notation:
.I "eta expansion" .
.BELLOWEXPLANATION2
.KE

.KS
.BULLET
.UL "Lambda lifting" :
taking an inner function (in the
.I where
part of another function) and making it top-level.
.br
Example:
.SOURCE Haskell
--from
f x y = g
  where g = x + y
--to
f x y = g x y
g x y = x + y
.SOURCE
.BELLOWEXPLANATION1
.BELLOWEXPLANATION2
.KE

.KS
.BULLET
.UL "Free variable" :
when a value doesn't come from the context of the function.
A free variable is neither passed as parameter or computed within the function.
.br
Example:
.SOURCE Haskell
f x y = g
  where g = x + y
.SOURCE
.BELLOWEXPLANATION1
Function
.I g
contains two free variables:
.I x
and
.I y .
These values aren't parameters of the
.I g
function, they're from the function
.I f .
.BELLOWEXPLANATION2
.KE

.KS
.BULLET
.UL "Free expression" :
an expression in which every variable is a Free variable. 
.KE

.KS
.BULLET
.UL "Thunk" :
unevaluated code in a non-strict environment.
.SOURCE Haskell ps=8 vs=9p
snd (undefined, 2)
--> 2
.SOURCE
.BELLOWEXPLANATION1
First element isn't evaluated since it isn't required.
The value could have been the result of a very long and complex code, but since it isn't used, the code behind this value isn't evaluated.
When the expression
.BX "snd (undefined, 2)"
is evaluated, the
.I snd
function takes the second element of the tuple, so the tuple itself is being evaluated, and the first element is dropped since it won't be useful later in the code.
.BELLOWEXPLANATION2
.KE

.KS
.BULLET
.UL "Normal form" :
fully evaluated value.
.KE

.KS
.BULLET
.UL "Weak head normal form" :
partially evaluated expression.
Any intermediate evaluation between a thunk and a normal form.
.KE

.KS
.BULLET
.UL "Persistence" :
when a value is updated, older versions are still there, the update isn't
.I "in place" .
.KE

.KS
.BULLET
.UL "Amortization" :
distribute unequal running times across a sequence of operations.
.TBD
.KE

.KS
.BULLET
.UL "Bottom (\[pp])" :
a computation which never completes successfully.
This notation isn't used in Haskell code, but rather in documentation to explain the behavior of a function.
The code equivalent of \[pp] is
.B undefined .
.br
Example:
the function
.I zip
takes two list as parameters.
When its left list is empty, the function works even if the right list can't be computed.
However,
.I zip
crashes when its left list can't be computed.
This can be said in the documentation this way:
.b1
.DS I
.fam C
.ps 8
.vs 9p
\m[darkred]remember: this is documentation, not code\m[]
zip \m[darkred][]\m[] \m[darkgreen]\[pp]\m[] \m[darkred]=\m[] \m[darkred][]\m[]     
zip \m[darkgreen]\[pp]\m[] \m[darkred][]\m[] \m[darkred]=\m[] error
.vs
.ps
.fam
.DE
.b2


.ENDBULLET
