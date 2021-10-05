.NH 1
Useful functions

.NH 2
show and read

.NH 2
list functions

.\" 0.15  = height box when move, half boxht
.\" 0.375 = half a horizontal move
.\" text = half box

.PS
boxht=0.3
right
HEAD: "Head"
move 0.375*4
TAIL: "Tail"
down
move 0.5
left
move 0.375*5
right
A: box "a"
B: box "b"
C: box "c"
D: box "d"
down
move 0.5
left
move 0.375*5
"Init"
right
move
move
move
"Last"
LINE_HEAD: line <- -> from A.nw + (0,0.2) to A.ne + (0,0.2)
LINE_TAIL: line <- -> from B.nw + (0,0.2) to D.ne + (0,0.2)
LINE_INIT: line <- -> from A.sw + (0,-0.2) to C.se + (0,-0.2)
LINE_LAST: line <- -> from D.sw + (0,-0.2) to D.se + (0,-0.2)

line from LINE_HEAD.end + (0,-0.1) to \
          LINE_HEAD.end + (0, 0.1)
line from LINE_INIT.end + (0,-0.1) to \
          LINE_INIT.end + (0, 0.1)
."line from HEAD.s + (0,-0.1) to A.nw
."line from HEAD.s + (0,-0.1) to A.ne
."line from TAIL.s + (0,-0.1) to B.nw
."line from TAIL.s + (0,-0.1) to D.ne
.PE

.NH 3
Const and (:)
.NH 3
length and null
.NH 3
(!!)
.NH 3
elem
.NH 3
(++)
.NH 3
take and drop
.NH 3
takeWhile and dropWhile
.NH 3
reverse
.NH 3
cycle
.NH 3
repeat
.NH 3
replicate
.NH 3
sum product maximum minimum

.NH 3
map

.NH 3
fold

.NH 3
scan

.NH 2
Functions on tuples

.NH 3
zip and zipWith

.SOURCE Haskell ps=8 vs=9p
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
.SOURCE

.NH 2
String manipulation

.NH 3
chr and ord

.SOURCE Haskell ps=8 vs=9p
chr :: Int  -> Char
ord :: Char -> Int
.SOURCE
