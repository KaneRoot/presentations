.SECTION Annex: code deduplication (OOP < type classes)
.PARAGRAPH_INDENTED
Avoiding duplication is a noble but difficult exercise.
Let's see how this works in C, C++ and Haskell with some examples.

.SUBSECTION Trivial example
.PARAGRAPH_INDENTED
Let's say we have a function with a structure that can satisfy several types of arguments.
Example, in pseudo code:
.b1
 function sum (a, b) {
   return a + b
 }
.b2

In C, functions have arguments with a defined type: no abstraction, whatsoever.
A function taking an integer won't work with anything else.
To make this a bit more generic, macros can generate functions replacing the types.
This is not, by any mean, a good abstraction, but a quick and dirty hack to avoid to write several times the same function.

.I "Why is this a problem" ?
Since there isn't abstraction, functions have to be duplicated in the code.
At the end of the day, the function will be duplicated in the final executable binary.
But C compilers cannot figure out themselves how to create this function for other types, the developer has to take care.

.HORIZONTALLINE

In C++,
.I classes
and
.I inheritance
allow some deduplication.
The function takes a parameter with a class implementing the right
.I method
(in our case, the
.I plus
function)\*[*].
.FOOTNOTE1
The class can be
.I abstract
or an
.I interface ,
in which case the actual implementation comes from another class that inherits from this one.
Naming conventions vary depending on the language, but the idea is more or less the same.
.FOOTNOTE2
.SOURCE cpp ps=8 vs=9p
class Sumable {
public:
  int value;
  int sum (Sumable x) {
    return value + x.value;
  }
};
.SOURCE
.gcolor black
In this example, the function
.I sum
doesn't require a particular type.
Actual object passed to the
.I sum
function is an instance of the class
.MODULE Sumable
or from a class that inherits from it\*[*].
.FOOTNOTE1
OOP requires
.I "multiple inheritance"
(C++) or
.I interfaces
(Java), otherwise classes would need to duplicate a lot of code.
.FOOTNOTE2

.HORIZONTALLINE

In Haskell, this really is trivial.

.SOURCE Haskell ps=8 vs=9p
type Value = Float

class Sumable a where
  sum :: a -> a -> a

instance Sumable Value where
  sum = +
.SOURCE

The actual value is just a type synonym for a floating-point number.
The type isn't repeated anywhere in the code, refactoring is easier this way.
Then the type class
.MODULE Sumable
is declared and is composed of a single function
.I sum .
This function takes two parameters and returns a value, all of the same type (whatever the actual type is).
And finally, the implementation is a synonym of the + function.

.SUBSECTION Less trivial code
.PARAGRAPH_INDENTED

The problem: represent both a
.CONSTRUCTOR car
and a
.CONSTRUCTOR boat.
Both vehicles can start and stop their engine, and have a
.CONSTRUCTOR radio
to play some music.

First, let's forget about C, this would be very long and uninteresting to write the actual code.
Code deduplication is a massive failure in C, no need to spend more time on it.

.HORIZONTALLINE

In C++, the code can be written this way.

.SOURCE cpp ps=8 vs=9p
class Vehicle {
  int running = 0; // the engine's state
public:
  void startEngine() { running=1; }
  void stopEngine()  { running=0; }
};

class Radio {
  int running = 0; // the radio's state
public:
  void playRadio() { running=1; }
  void stopRadio() { running=0; }
};

class Boat: public Vehicle, public Radio {
};

class Car: public Vehicle, public Radio {
};
.SOURCE
.gcolor black

Both a car and a boat can start their engine and play radio.
But this isn't possible to create a function that take either a boat or a car and start their engine and play radio.
To do that, either the function has to be duplicated in both
.MODULE Car
and
.MODULE Boat
classes, or a new class has to be implemented.
Since functions cannot freely ask for multiple criteria, a lot of code has to be in a class and thought in everything has to be an object, even simple things.

.HORIZONTALLINE

In Haskell, again, this is trivial code.

.SOURCE Haskell ps=8 vs=9p
data State = On | Off
type Engine = State
type Radio  = State
data Car  = Car  Engine Radio
data Boat = Boat Engine Radio
--data Vehicle = Car | Boat

class OwnEngine where
  startEngine :: a -> a
  stopEngine :: a -> a

class OwnRadio where
  startRadio :: a -> a
  stopRadio :: a -> a

instance OwnEngine Car where
  startEngine (Car _ r) = Car On r
  stopEngine  (Car _ r) = Car Off r

instance OwnEngine Boat where
  startEngine (Boat _ r) = Boat On r
  stopEngine  (Boat _ r) = Boat Off r

instance OwnRadio Car where
  startRadio (Car e _) = Car e On
  stopRadio  (Car e _) = Car e Off

instance OwnRadio Boat where
  startRadio (Boat e _) = Boat e On
  stopRadio  (Boat e _) = Boat e Off

goToWork :: OwnRadio a, OwnEngine a => a -> a
goToWork = startRadio . startEngine
.SOURCE
.BELLOWEXPLANATION1
What a verbose way of doing things.
.BELLOWEXPLANATION2

.TBD

.SOURCE Haskell ps=8 vs=9p
data State = On | Off
type Engine = State
type Radio  = State
data Car  = Car  { _carEngine  :: Engine, _carRadio  :: Radio }
data Boat = Boat { _boatEngine :: Engine, _boatRadio :: Radio }
--data Vehicle = Car | Boat

class OwnEngine where
.SOURCE
.TS
allbox tab(:);
c2 | c2 | c
r2 | lew(1.7i)2 | c.
Lang    : Code deduplication            : Problem
C       : macros                        : no abstraction
C++     : Objects, multiple inheritence :T{
single criterion in functions
T}
Java    : Objects, interfaces           :T{
single criterion in functions
T}
Haskell : type classes                  : about none
.TE

.SUBSECTION Conclusion
.PARAGRAPH_INDENTED
C is an abstraction over assembly, nothing more.
This has its use: C developers can make an educated guess how the code will be compiled into assembly.
However, code is constantly duplicated, and the tools at our disposal to make it more generic are flawed on many points (static code analysis, type verifications, etc.).

OOP allows some code deduplication.
A function can ask for its parameter to comply with a list of methods (a class).
However, a function cannot ask for many more criteria, which forces to create new classes or interfaces.
The code is more complex than it has to be\*[*].
.FOOTNOTE1
Actually, OOP is broken beyond repair, never have been a great solution and never will be, but this deserves its own document.
.FOOTNOTE2

FP 
The language allows to write code without caring for the 
