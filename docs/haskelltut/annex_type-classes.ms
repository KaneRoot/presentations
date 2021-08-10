.1C
.NH 1
Annex: a bunch of type classes

.PP
Here is a list of the most used type classes.

.\" TODO: find out how to reduce margin size
.TS
allbox tab(:);
c2 | c2 | c
r2 | lew(5i)2 | c.
Type class:Meaning:Provided methods
Num:Numbers:T{
.BX "+ - * /"
etc.
T}
Eq:Types that can be tested for equality: eq
Ord:Types that can be ordered:sort, max, etc
Semigroup:Types that can be concatened: (<>)
Monoid:T{
Types with a default value on a an operation
.br
Examples: (Num, 0, +), or (Num, 1, *)
T}: mempty, mconcat
Functor:T{
Types containing data on which we can apply functions
.br
Examples: Array, List, Maybe, Either
T}:T{
.I fmap
(<$>)
T}
Applicative:Add a parameter to a function in a Functor:(<*>)
Alternative:T{
Can be different values
.br
Example:
.ps 7
.ft CW
getUser x = searchLocalUser x <|> searchRemoteUser x
.ft
.ps
T}:(<|>)
Monad:T{
Chaining function calls
.br
Example:
.br
.ps 7
.ft CW
putStrLn "Your name?" >> getLine >>= (\\name -> putStrLn ("Your name: " <> name))
.ft
.ps
.br
.UL "Same example"
but with the
.I do
notation:
.br
.ps 7
.ft CW
do putStrLn "Your name?"
   name <- getLine
   putStrLn ("Your name: " <> name)
.ft
.ps
T}:T{
.I bind
(>>=) and
.I then
(>>)
T}
.TE

.NH 1
TODO

.PP

.SOURCE Haskell
(+) <$ Just 5 <* Nothing <*> Just 4 <*> Just 3
.SOURCE

.2C
