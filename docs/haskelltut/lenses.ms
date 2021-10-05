.NH 1
Lenses: getters and setters on steroids

.PP
Lenses help manipulate complex, nested data structures.
Let's consider the following types.

.SOURCE Haskell ps=8 vs=9p
data Task = Task
  { taskName :: String
  , taskExpectedMinutes :: Int
  , taskCompleteTime :: UTCTime }

data Project = Project
  { projectName :: String
  , projectCurrentTask :: Task
  , projectRemainingTasks :: [Task] }
.SOURCE

.NH 2
The problem

.PP
How to edit the content of the task (let's say, its name)?
Pattern matching is great for simple tasks, but becomes really verbose in nested structures.

.TBD

.NH 2
A first attempt to tackle the problem

.PP
Let's define a modifying function.

.SOURCE Haskell ps=8 vs=9p
truncateName :: Task -> Task
truncateName task
  = task { taskName = take 15 originalName }
  where
    originalName = taskName task
.SOURCE

This code is near the verbosity of a imperative (or Object-Oriented) language. 
This is near JavaScript code.
And the code isn't even nested yet: the function becomes even harder to write when the parameter is a
.MODULE Project
instead of directly getting the
.MODULE Task.

.NH 2
Lenses to the rescue!

.PP
Another way to proceed is to create
.CONSTRUCTOR lenses
functions, helping us to easily reach inner structure values.
Lenses come in different flavors:
.BULLET
.CONSTRUCTOR lenses
for
.UL record
structures.
.br
Example:
.BX "Foo = Foo { x :: Int, y :: Int }"
.BULLET
.CONSTRUCTOR prisms
for
.UL sum
structures.
.br
Example:
.BX "X = A | B | C"
.BULLET
.CONSTRUCTOR transversal
for
.UL collections
types.
.br
Examples:
.MODULEX Lists
.MODULEX Array
.MODULEX Map
etc.
.ENDBULLET



.NH 3
Actual lenses

.PP
Now, given the
.MODULE lens
package, let's rewrite our structures.

.SOURCE Haskell ps=8 vs=9p
data Task = Task
  { _taskName :: String
  , _taskExpectedMinutes :: Int
  , _taskCompleteTime :: UTCTime }

--generate lenses for Task
makeLenses ''Task

data Project = Project
  { _projectName :: String
  , _projectCurrentTask :: Task
  , _projectRemainingTasks :: [Task] }

--generate lenses for Project
makeLenses ''Project
.SOURCE

As shown, Haskell can generate lenses for our records:
it only requires each element to start with an underscore.
This really is helpful not to have to write many mindless functions.
.LP
Our code now has new functions, such as
.CONSTRUCTOR taskName
and
.CONSTRUCTOR projectRemainingTasks
for example.
These functions allow to get and set values.
To illustrate, some examples:

.SOURCE Haskell ps=8 vs=9p
--Let's rewrite our last function.
truncateName :: Task -> Task
truncateName task
  = task { _taskName = take 15 originalName }
  --getting originalName is now simpler with 
  where originalName = view taskName task
.SOURCE
.BELLOWEXPLANATION1
.UL view
is a function to retrieve a value from a structure through a lens and
.UL taskName
is the lens function to get (or set) _taskName from a Task type.
.BELLOWEXPLANATION2

In practice, chaining operations will be common, such as getting a value from an inner structure and apply a function to it.
To that end, operators are more idiomatic to use than functions.
So let's see a few operators.
.SOURCE Haskell ps=8 vs=9p
view taskName task
--is equivalent to
task ^. taskName
.SOURCE

And this is convenient for unnamed structures as well:
.SOURCE Haskell ps=8 vs=9p
(1,3) ^. _2
--> 3
.SOURCE
.BELLOWEXPLANATION1
.I _2
is a generic lens to get the second element of a tuple.
.BELLOWEXPLANATION2

Changing a value inside a structure is easy, too.
The right value has to be selected, then a function can be applied to it.
.SOURCE Haskell ps=8 vs=9p
(1,3) & _2 %~ (+3) --modify second element
--> (1,6)
.SOURCE
.BELLOWEXPLANATION1
The & operator allows to prefix the value, such as
.ft CW
^.
.ft
did for the
.CONSTRUCTOR view
function, but this time the value is changed (or only some parts).
In this example, & combined to the operator
.ft CW
%~
.ft
allowed to easily modify part of the value (the second element of the tuple).
The operator
.BX .~
takes the new value,
.BX %~
takes a function to modify the selected value.
.BELLOWEXPLANATION2

Handling complex structures is one of the few parts of FP where introducing operators is essential to keep the code clean.
Lenses introduce an overwhelming amount of operators\*[*], only a very few are necessary for a start and for most operations.
.FS
The
.MODULE lens
module currently has 109 operators.
Apparently there is never enough!
Again, no need to feel overwhelm, most of it is very specialized and you won't need it.
Also, a lot of them are related to each other, there is a logic behind it.
.FE
Chaining operations is easy, and the more operations there is, the simpler it is compared to other programmation paradigms.

.SOURCE Haskell ps=8 vs=9p
(1,3)
  & _1 %~ (+2) --modify first element
  & _2 %~ (+3) --modify second element
--> (3,6)
.SOURCE
.BELLOWEXPLANATION1
Operations can be chained, easily.
.BELLOWEXPLANATION2

Now, let's try nested structures.
.UL "Important note" :
lenses have to be composed in reverse order from the nesting.
.SOURCE Haskell ps=8 vs=9p
("hello", (1,3))
  & (_2._1) %~ (+2)    --1 -> 3
  & (_2._2) %~ (+3)    --3 -> 6
  &  _1     %~ (++ " world!")
--> ("hello world!", (3,6))
.SOURCE
.BELLOWEXPLANATION1
Again, operations can be easily chained.
.BELLOWEXPLANATION2

.NH 3
Prisms: lenses for sum types

.LP

.NH 3
Transversals: lenses for collections

.LP
Transversals help browse all elements of a collection, such as lists, arrays and maps.
It sounds a lot like a
.BX fmap
function, but there are a couple of differences.


.NH 4
At
.LP
Get and set values at a given index.

.SOURCE Haskell ps=8 vs=9p
Map.fromList [(1,"world")] ^.at 1
--> Just "world"

--iat: 'at' with an index
Map.fromList [(1,"world")] ^@. iat 1
--> (1,Just "world")

at 1 ?~ "hello" $ Map.empty
--> fromList [(1,"hello")]

--reverse order, easier to chain stuff! ;)
Map.empty
  & at 1 ?~ "hello"
  & at 2 ?~ "world!"
--> fromList [(1,"hello"), (2,"world!")]
.SOURCE
.\".BELLOWEXPLANATION1
.\".BELLOWEXPLANATION2

.NH 4
Contains

.LP
Lens to test for an index in a container (such as a set).

.SOURCE Haskell ps=8 vs=9p
IntSet.fromList [1,2,3,4] ^. contains 3
--> True

IntSet.fromList [1,2,3,4] & contains 3 .~ False
--> fromList [1,2,4]

--icontains: 'contains' with an index
IntSet.fromList [1,2,3,4] ^@. icontains 3
--> (3,True)
.SOURCE
.\".BELLOWEXPLANATION1
.\".BELLOWEXPLANATION2


.NH 3
Logic behind operators

.LP
This document only shown a few operators out of more than a hundred in the
.MODULE lens
package.
This may seem like this completely went out of control, but there is a logic behind all that.
Here is a little recap.

.TS
allbox tab(:);
c2 | c
c2 | lew(2.5i).
Operator:Meaning
-
^. : infix view
containing %  : usually take a function
ending with ~ : over (%~) and set (.~)
containing =  :T{
like operators ending with ~ but working with a
.MODULE State
monad
T}
containing @ : result contains a value and an index
.TE
.BELLOWEXPLANATION1
Vague categorization of lens operators.
.BELLOWEXPLANATION2



.TS
allbox tab(:);
c1 | c1 | c1 | c
c1 | c1 | c1 | lew(1.7i).
Function:Operator:Meaning:Use
_
view:T{
.ft CW
^.
.ft
T}:Getter:T{
view
.CONSTRUCTOR lens
.MODULE structure
.br
view
.CONSTRUCTOR _1
.MODULE (1,2,3)
.br
.ft CW
(1,2,3) ^. _1
.ft
T}
set:T{
\f[CW].~\f
T}:Setter:T{
set
.CONSTRUCTOR lens
value
.MODULE structure
.br
set
.CONSTRUCTOR _1
1
.MODULE (0,2,3)
.br
.ft CW
.MODULE (0,2,3)
&
.CONSTRUCTOR _1
\f[CW].~ 1
.ft
T}
over:T{
\f[CW]\f
T}:T{
Get or Set on collections
T}:T{
over
.CONSTRUCTOR lens
f
.MODULE structure
.br
over
.CONSTRUCTOR mapped
(+3)
.MODULE [1..5]
.br
over
.CONSTRUCTOR (traverse._1)
(+1)
.MODULE [(0,2),(3,4)]
T}
.TE
.BELLOWEXPLANATION1
Basic functions on lenses (and their friends: prisms, transversals, etc.).
.BELLOWEXPLANATION2

.\" : &  : : (1,2,3) & _2

