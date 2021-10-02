.\" .RP = report document
.\" .RP
.nr PO 0.5i   \" page offset default 1i
.nr LL 7.5i   \" line length default 6i
.nr FM 0.5i   \" page foot margin default 1i
.\" .nr FF 1
.R1
no-label-in-reference
accumulate
.R2
.nr DI 0
.nr FN 0
.de FOOTNOTE1
\*{[\\n(FN]\*}
.FS        \" start footnote
.ll +.6i   \" line length
\*{[\\n(FN]\*}
..
.de FOOTNOTE2
.ll        \" line length
.FE        \" end of footnote
.\" increment our footnote counter
.nr FN +1
..
.de BELLOWEXPLANATION1
.sp 0.5
.ps 7     \" point size (~= font size)
.vs 8p    \" vertical spacing between lines
..
.de BELLOWEXPLANATION2

.ps 9
.vs 11p
..
.de ENDBULLET
.in -2   \" indent
..
.defcolor darkgreen rgb 0.1 0.5 0.2
.defcolor darkblue  rgb 0.3 0.3 0.7
.defcolor darkred   rgb 0.7 0.3 0.3
.de CONSTRUCTOR
.gcolor darkred
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
..
.de TYPE
.gcolor darkgreen
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
..
.de MODULE
.gcolor darkblue
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
..
.de SHINE
.gcolor darkblue
.ft B
\\$1
.ft R
.gcolor
..
.de MODULEX
.MODULE "\\$1,"
..
.de RESETFOOTNOTES
.nr FN 0
..
.de TBD
.ft B
To be defined or to finish.
.ft R
..
\# Bullet points
.de BULLET
.IP \(bu 2
..
.
\# Begin code box
.de b1
.B1
.sp 0.2
.ft CW
..
.
\# End code box
.de b2
.sp 0.5
.B2
.ft
..
.de HORIZONTALLINE
\l'15'
..
.de SMALLFONT
.ps 8
.vs 9p
..
.de NORMALFONT
.vs
.ps
..
.de COMMAND1
.b1
..
.de COMMAND2
.b2
..
.de COMMANDNAME
.I "\\$1"
..
.de FUNCTION
.I "\\$1" "\\$2"
..
.de TYPECLASS
.I "\\$1" "\\$2"
..
.de OPERATOR
.I "\\$1" "\\$2"
..
.de QUESTION
.I "\\$1" "\\$2"
\h'5p'
..
