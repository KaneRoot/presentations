.SECTION Annex: vocabulary
.PARAGRAPH_INDENTED
Browsing through different documentations of the Haskell language (and FP in general) can be really hard.
The technical corpus one must know prior to the reading of some of the explanations is almost preposterous\*[*].
.FOOTNOTE1
And sometimes you get pure garbage descriptions.
What's an applicative functor?
According to the Haskell wiki: "An applicative functor has more structure than a functor but less than a monad.".
Seriously, is this trolling at an academic level?
.FOOTNOTE2
So, in order to tackle this problem, here is a list of technical terms explained in a simple way.

.VOCABULARY1 Class
category of types.
.br
Example: the class
.MODULE Show
represents all types that can be printed in the terminal.
.VOCABULARY2

.VOCABULARY1 Constructor
keyword to create a structure.
.br
Example:
.CONSTRUCTOR True
for a
.MODULE Bool.
.VOCABULARY2

.\".VOCABULARY1 Method
.\"function in a class.
.\".br
.\"Example:
.\".I fmap
.\"in the type class
.\".MODULE Functor.
.\".VOCABULARY2

.VOCABULARY1 Instance
function implementation for a real type.
.br
Example:
.SOURCE Haskell
instance  Functor Maybe  where
  fmap _ Nothing   = Nothing
  fmap f (Just a)  = Just (f a)
.SOURCE
.VOCABULARY2

.VOCABULARY1 Functor
structure implementing the
.FUNCTION fmap
function, to change its inner value(s).
.br
Example:
.SOURCE Haskell ps=7 vs=9p
--fmap :: Functor f => (a -> b) -> f a -> f b

--Previous code snippet shows an instance of fmap.
--Usage example (Maybe functor):
fmap (+2) Just 2
--> Just 4

--Usage example (Either functor):
fmap (+2) Right 2
--> Right 4
.SOURCE
.VOCABULARY2

.VOCABULARY1 Applicative Functor
structure implementing the
.OPERATOR <*>
operator, allowing to pass arguments to a function in a functor.
.br
Example:
.SOURCE Haskell ps=7 vs=9p
--<*> :: Applicative f => f (a -> b) -> f a -> f b

--Usage example (Maybe applicative functor):
Just (+2) <*> Just 2
--> Just 4

--Usage example (Either applicative functor):
Right (+2) <*> Right 2
--> Right 4
.SOURCE
.VOCABULARY2

.VOCABULARY1 Monad
structure implementing the
.OPERATOR >>=
operator, allowing to bind function calls together.
Said otherwise: the infix operator
.OPERATOR >>=
takes a monad (containing a value of type
.TYPE a )
and a function taking a value of type
.TYPE a
and returning another monad (containing a value of type
.TYPE b ).
.br
Example:
.SOURCE Haskell ps=7 vs=9p
-->>= :: Monad m => m a -> (a -> m b) -> m b

--Usage example (Maybe monad):
Just 2 >>= \x -> Just (2+x)
--> Just 4

--Usage example (Either monad):
Right 2 >>= \x -> Right (2+x)
--> Right 4
.SOURCE
.VOCABULARY2

.VOCABULARY1 Variadic
undefined number of something (mostly used to describe undefined number of parameters for a function).
Functions can have an undefined number of parameters in C, LISP and many other languages, not in Haskell.
.TBD
(TODO: maybe reword a bit)
.VOCABULARY2

.VOCABULARY1 Prelude
standard library, available by default in every distribution of Haskell.
Even included by default in any Haskell code without any
.I import
statement.
.VOCABULARY2

.VOCABULARY1 Recursivity
the definition of something (a function or a structure) includes itself.
.br
Example:
.SOURCE Haskell
data List = Element Int List | Void
.SOURCE
.VOCABULARY2

.VOCABULARY1 "Referential transparency and purity"
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
.VOCABULARY2

.VOCABULARY1 Laziness
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
.VOCABULARY2

.VOCABULARY1 "High order function"
treat functions as values.
.br
Example:
.SOURCE Haskell
apply :: (a -> b) -> a -> b
apply function value = function value
.SOURCE
.VOCABULARY2

.VOCABULARY1 Predicate
function (or expression) whose range consists of truth values.
See guards for example, they are used to chose the right function body.
.VOCABULARY2

.VOCABULARY1 Coroutine
function that can be interrupted by
.I yielding
(providing a value or not) then resumed where it stopped.
.VOCABULARY2

.VOCABULARY1 Closure
.TBD
.VOCABULARY2

.VOCABULARY1 "Continuation Passing Style (CPS)"
to add to each function an extra
.I continuation
argument, a function to call to continue the program instead of simply returning a value.
.TBD
.VOCABULARY2

.VOCABULARY1 Continuation
functions take an extra parameter corresponding to the following function to execute, the rest of the application.
Thus, functions do not really end, they jump to the next function, it is a goto.
.TBD
(why this can be useful)
.VOCABULARY2

.VOCABULARY1 "Applicative order"
execute code within inner list first.
Example:
.SOURCE Haskell ps=7 vs=9p
x = f (g)
.SOURCE
In an
.I Applicative
order, g is executed first.
This is the case in most programming languages, and in LISP by default.
.VOCABULARY2

.VOCABULARY1 "Normal order"
evaluate an expression only when needed.
Example:
.SOURCE Haskell ps=7 vs=9p
x = f (g)
.SOURCE
In a
.I Normal
order, g is executed only if required by f.
It is
.I lazy
and it is the way Haskell works.
.VOCABULARY2

.VOCABULARY1 "Comprehension list"
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
.VOCABULARY2

.VOCABULARY1 "Point free"
writing a function without explicit parameters.
.br
Example:
.SOURCE haskell ps=8 vs=9p
add1 = + 1          --no explicit integer param
h = reverse . sort  --no explicit list param
.SOURCE
.VOCABULARY2

.VOCABULARY1 "Eta conversion"
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
.VOCABULARY2

.VOCABULARY1 "Lambda lifting"
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
.VOCABULARY2

.VOCABULARY1 "Free variable"
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
.VOCABULARY2

.VOCABULARY1 "Free expression"
an expression in which every variable is a Free variable. 
.VOCABULARY2

.VOCABULARY1 Thunk
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
.VOCABULARY2

.VOCABULARY1 "Normal form"
fully evaluated value.
.VOCABULARY2

.VOCABULARY1 "Weak head normal form"
partially evaluated expression.
Any intermediate evaluation between a thunk and a normal form.
.VOCABULARY2

.VOCABULARY1 Persistence
when a value is updated, older versions are still there, the update isn't
.I "in place" .
.VOCABULARY2

.VOCABULARY1 Amortization
distribute unequal running times across a sequence of operations.
.TBD
.VOCABULARY2

.VOCABULARY1 "Bottom (\[pp])"
a computation which never completes successfully.
This notation isn't used in Haskell code, but rather in documentation to explain the behavior of a function.
The code equivalent of \[pp] is
.B undefined .
.br
Example:
the function
.I zip
takes two lists as parameters.
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
.VOCABULARY2


.ENDBULLET
