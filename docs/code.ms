.so macros.ms   \" First, let's import some macros.
.mso fr.tmac
.mso hdtbl.tmac
.nr legendps 2
.de LEGEND1
.QP
.vs -\\n[legendps]p
.ps -\\n[legendps]
.br
..
.de LEGEND2
.br
.vs +\\n[legendps]p
.ps +\\n[legendps]
.br
.LP
..
.defcolor color_ressenti      rgb 0.6 0.2 0.2
.defcolor color_interet       rgb 1 0 0
.defcolor color_prisme        rgb 0 0 1
.defcolor color_faitpartiel   rgb 0.2 0.6 0.2
.defcolor color_liens         rgb 0.2 0.2 0.6
.defcolor color_contraintes   rgb 0.9 0 0.6
.
.TITLE Code de la route : quelques notes
.AUTHOR Philippe Pittoli
.ABSTRACT1
Quelques notes sur le code de la route.

.INFORMATIONS_FR \\*[WEBSITE]/research_fr.pdf \\*[EMAIL]
.ABSTRACT2
.TWO_COLUMNS
.\".vs -\n[table_size_offset]p
.\".ps -\n[table_size_offset]
.PS
x = 0.5
y = x
r  = 0.02
rt = 0.02
marge = 0.05
iconsep = 0.3

DANGER:
L1: line from Here to Here + (x,0)
L2: line from Here + (0,marge/2) to Here + (-(x/2)+marge/2,y)
L3: line from L1.w + (0,marge/2) to L2.n + (-marge/2,0)
arc rad r  from L1.e to L2.s
arc rad rt from L2.w to L3.e
arc rad r  from L3.w to L1.w

OBLIG: circle rad x/2 with .n at L1 .c + (0,-iconsep)
INDIC: box rad 0.02 width x with .n at OBLIG .s + (0,-iconsep)

# En cas de ligne jaune
#LJAUNE_DIS: circle rad x/2 with .n at INDIC.s + (0,-iconsep)
#line from 
#LJAUNE_CON: circle rad x/2 with .n at LJAUNE_DIS.s + (0,-iconsep)

"Danger"     ljust at DANGER.e  + (x/2,x/2)
"Obligation" ljust at OBLIG.e   + (x/2,0)
"Indication" ljust at INDIC.e   + (x/2,0)
.PE
.\".vs +\n[table_size_offset]p
.\".ps +\n[table_size_offset]

ligne jaune
.BULLET discontinue : stationnement interdit
.br
panneau = cercle (obligation) avec trait oblique
.BULLET continue : stationnement + arrêt interdit
.br
panneau = cercle (obligation) avec double trait oblique
.ENDBULLET
