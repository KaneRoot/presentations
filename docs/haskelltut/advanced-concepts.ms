.SECTION Advanced concepts
Some concepts are derived from previous properties of the language.
The following explores a few concepts that are useful in some contexts.

.SUBSECTION Continuation: a nice side-effect of composition
.METAINFO1
WARNING: the following is a draft.
NOTHING IS FINISHED HERE.
.METAINFO2

You say what comes next, specially when there is a fail.
The side-effect is that no exception system is required\*[*].
.FS
Conferences about continuation by Scott Wlaschin are great learning resources.
.FE

.SOURCE sh ps=8 vs=9p
safeDivide :: Num a => a -> a -> Maybe a
safeDivide _ 0 = Nothing
safeDivide x y = Just $ divide x y
.SOURCE

.SECTION_NO_NUMBER Continuation Passing Style vs Monads
.METAINFO1
WARNING: the following is a draft.
NOTHING IS FINISHED HERE.
.METAINFO2
.PARAGRAPH_INDENTED
Continuation Passing Style and Monads are actually similar.
In both cases, the idea is to control the behavior of a function, whether it works or fails.

Continuation Passing Style is more direct, it is a by-product of high order functions.
Monads are a way to ensure the same behavior for multiple function calls, that's a shared, recognizable pattern.
.SUBSECTION Arrow operator

.SUBSECTION Closure
.METAINFO1
WARNING: the following is a draft.
NOTHING IS FINISHED HERE.
.METAINFO2
.SUBSECTION Free monads
.METAINFO1
WARNING: the following is a draft.
NOTHING IS FINISHED HERE.
.METAINFO2
First, a
.I "Free Foo"
happens to be the simplest thing that satisfies all of the
.I Foo
laws.
It satisfies exactly the laws necessary to be a Foo and nothing extra.

A Free Monad is a way to create a Monad from any Functor.

Let's say we have a functor f.
.SOURCE Haskell ps=7 vs=9p
liftFree :: Functor f => f a -> Free f a
foldFree :: Functor f => (f r -> r) -> Free f r -> r
.SOURCE
.BELLOWEXPLANATION1
The first function put your functor f into a Free monad.
The second function gets the value from your functor inside the Free monad.
.BELLOWEXPLANATION2


.SUBSECTION Dependency injection (OOP) vs Continuation Passing Style
.\" Free monads and effect handlers
.PARAGRAPH_INDENTED
Dependency injection is an OOP concept.
.UL "The general idea" :
you have two classes, A and B, and B needs an instance of A to work.
B depends on A.
There are two ways to handle this: either B creates its own instance of A, or it is provided to B in some way (during the construction of B or later).

Dependency injection mostly allows to provide an encapsulated state to B.
The behavior is changed if the provided instance is a subclass of A with a different implementation.

In any case, dependency injection offers a limited control over the behavior of the functions (methods).

.TBD

Stolen from https://danidiaz.medium.com/free-monads-and-effect-handlers-vs-dependency-injection-bca2eb95e580

Suppose you have a piece of business logic which uses various high-level interfaces.
You don’t want the business logic to care about how the interfaces are implemented, or where to get hold of the implementations.

If you are a functional programmer, you might resort to a free monad, or to some form of effect handlers.
If you are an object-oriented programmer, you turn to dependency injection.

So, are these aproaches basically the same in the end?

I see a couple of differences:
.BULLET With free monads/effect handlers, the computation cedes more control to the interpreter than it would cede to the dependency injector. Consider errors for example. If you have an interface for database access injected into your object, and you call some operation on it, you can catch any exception the operation throws. With a free monad, you are at the mercy of the interpreter, which may choose to terminate the computation right away, force a retry, etc. (Quote from Reddit user: “DI doesn’t allow controlling the continuation”.)
.BULLET With free monads/effect handlers, you can pass around and manipulate at runtime values representing abstract computations not yet tied to any interpreter. This doesn’t seem to be the case with dependency injection. With dependency injection, you must provide the implementations as you construct your enterprise beans; only afterwards you can pass those beans around.
.BULLET With free monads/effect handlers, the interfaces required by the business logic are reflected in the type signature. With dependency injection, sometimes you have to stoop down to inspect a bean’s internal attributes.

.SUBSECTION S-Expression (symbolic expression)
.METAINFO1
WARNING: the following is a draft.
NOTHING IS FINISHED HERE.
.METAINFO2

A symbolic expression is a convention to represent data.
The core property is the prefixed notation with parenthesis.
Example:
.SOURCE Scheme ps=7 vs=9p
(+ 1 2)

(defun hello-function ()
  (print "hello world!"))
.SOURCE

.SUBSECTION Homoiconicity
.METAINFO1
WARNING: the following is a draft.
NOTHING IS FINISHED HERE.
.METAINFO2

Homoiconicity is "code as data".

Said otherwise, code is represented as a series of primitive structures of the language.
For example, in Lisp, the code is a series of nested lists.
This allows very powerful metaprogrammation: developers can write code that modifies the code (maybe even at runtime) in a very concise way.
All thanks to the use of primitive structures to represent the code itself.

Example in LISP:
.SOURCE Lisp ps=8 vs=9p
(defmacro print-parameters (f)
	`(print (cdr '(,@f))))
(print-parameters (+ 1 2))
; (1 2)
.SOURCE

.SUBSECTION Futures, Monads, Reactive Programming and Functors

