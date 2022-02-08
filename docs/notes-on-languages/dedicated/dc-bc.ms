.SUBSECTION Algebraic computations: dc and bc
Both
.COMMANDNAME dc
(desk calculator) and
.COMMANDNAME bc
(arithmetic language and calculator) provide a way to perform calculus.
.SUBSUBSECTION dc
The first one is the most basic.
This language is a stacking (reverse Polish) calculator: numbers are stored on a stack\*[*].
.FOOTNOTE1
The choice of stacking values and the reverse Polish notation can be surprising as of today, but is memory efficient.
I guess this language had its place on computers in a time where memory was very scarce.
.FOOTNOTE2
.SOURCE Perl ps=7 vs=9p
2 2 + p   # computes then prints 4
c         # flushes all values on the stack, which
          # corresponds to the 4 previously computed
1 2 f     # prints values on the stack: 2 then 1
.SOURCE
.SUBSUBSECTION bc
The
.COMMANDNAME bc
language is a preprocessor for
.COMMANDNAME dc .
It provides a more classical language paradigm since its syntax is C-like.
Also,
.COMMANDNAME bc
is an interactive tool, easy to pick-up when we need a calculator.
.SOURCE Perl ps=7 vs=9p
1 + 2     # prints 3

scale=2   # precision (2 after decimal)
5/4       # prints 1.25

scale=3   # precision (3 after decimal)
5/4       # prints 1.250

for (x=0; x < 10; x++) {
	x     # prints consecutively values from 0 to 9
}

quit      # stops the program (bc is interactive)
.SOURCE
.BELLOWEXPLANATION1
The language allows to create functions, and with the
.BX -l
parameter provides a few mathematical functions, such as
.FUNCTION log ,
.FUNCTION sine
and
.FUNCTION cosine ,
.FUNCTION exponential ,
etc.

.BELLOWEXPLANATION2

.COMMANDNAME bc
is a good calculator, simple to use and with arbitrary precision.
.SOURCE shell ps=7 vs=9p
echo "scale=3; 5/3" | bc
# 1.666
.SOURCE
