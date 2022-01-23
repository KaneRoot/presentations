.SECTION Useful functions

.SUBSECTION show and read

.SUBSECTION list functions

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

.SUBSUBSECTION Const and (:)
.SUBSUBSECTION length and null
.SUBSUBSECTION (!!)
.SUBSUBSECTION elem
.SUBSUBSECTION (++)
.SUBSUBSECTION take and drop
.SUBSUBSECTION takeWhile and dropWhile
.SUBSUBSECTION reverse
.SUBSUBSECTION cycle
.SUBSUBSECTION repeat
.SUBSUBSECTION replicate
.SUBSUBSECTION sum product maximum minimum

.SUBSUBSECTION map

.SUBSUBSECTION fold

.SUBSECTION_NO_NUMBER foldl
.SUBSECTION_NO_NUMBER foldr
.SOURCE Haskell ps=8 vs=9p
--the following produces [], the list identity
foldr (:) []
.SOURCE
catamorphism is when a function produces an identity given a constructor for a data type.
.B foldr
is the list catamorphism.
.SUBSECTION_NO_NUMBER foldl vs foldr
.BULLET foldl is an imperative loop
.BULLET foldr is a constructor replacement
.ENDBULLET

.SUBSUBSECTION scan

.SUBSECTION Functions on tuples

.SUBSUBSECTION zip and zipWith

.SOURCE Haskell ps=8 vs=9p
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
.SOURCE

.SUBSECTION String manipulation

.SUBSUBSECTION chr and ord

.SOURCE Haskell ps=8 vs=9p
chr :: Int  -> Char
ord :: Char -> Int
.SOURCE
