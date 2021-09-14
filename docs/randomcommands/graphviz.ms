.NH 1
Graphviz: drawing graphs

.NH 2
Tools
.PP
.BULLET
.UL dot :
a command-line tool to produce layered drawings of directed graphs.
Output formats: PostScript, PDF, SVG, annotated text and so on.
.BULLET
.UL neato :
useful for undirected graphs.
"spring model" layout, minimizes global energy.
Useful for graphs up to about 1000 nodes.
.BULLET
.UL fdp :
useful for undirected graphs.
"spring model" which minimizes forces instead of energy.
.BULLET
.UL sfdp :
multiscale version of fdp for the layout of large undirected graphs.
.BULLET
.UL twopi :
for radial graph layouts.
Nodes are placed on concentric circles depending their distance from a given root node.
.BULLET
.UL circo :
circular layout.
Suitable for certain diagrams of multiple cyclic structures, such as certain telecommunications networks.
.BULLET
.UL dotty :
a graphical user interface to visualize and edit graphs.
.BULLET
.UL lefty :
a programmable widget that displays DOT graphs and allows the user to perform actions on them with the mouse.
Therefore, Lefty can be used as the view in a model-view-controller GUI application that uses graphs.
.BULLET
.UL gml2gv ,
.UL gv2gml ,
.UL graphml2g ,
.UL gxl2gv
and
.UL gv2gxl :
file converters.
.\".BULLET
.\".UL "gml2gv - gv2gml" :
.\"convert to/from GML, another graph file format.
.\".BULLET
.\".UL graphml2g :
.\"convert a GraphML file to the DOT format.
.\".BULLET
.\".UL "gxl2gv - gv2gxl" :
.\"convert to/from GXL, another graph file format.
.ENDBULLET

.NH 2
Basic usage
.PP

