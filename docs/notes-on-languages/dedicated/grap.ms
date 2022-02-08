.SUBSECTION grap
.B grap
is a language to create graphs.
.G1
GROWTHFACTOR=0.07
grid bot  dotted from 0 to 100 by 10
grid left dotted from 0 to 800 by 50
frame ht 2.5 wid 2.8
define expo { $1+$1*GROWTHFACTOR }
value = 1
draw LINEAR solid
for i from 1 to 100 by 1 do {
  next LINEAR at i, i
  times at i, value
  value = expo(value)
}
l1legend=650
l2legend=600
line from 0,l1legend to 3,l1legend
times at 1,l2legend
"linear curve" ljust at 8,l1legend
"exponential curve" ljust at 8,l2legend
label top "Exponential curves: growth over time (7%)" up -.2
.G2

.METAINFO1
Produced by
 GROWTHFACTOR=0.07
 grid bot  dotted from 0 to 100 by 10
 grid left dotted from 0 to 800 by 50
 frame ht 2.5 wid 2.8
 define expo { $1+$1*GROWTHFACTOR }
 value = 1
 draw LINEAR solid
 for i from 1 to 100 by 1 do {
   next LINEAR at i, i
   times at i, value
   value = expo(value)
 }
 l1legend=650
 l2legend=600
 line from 0,l1legend to 3,l1legend
 times at 1,l2legend
 "linear curve" ljust at 8,l1legend
 "exponential curve" ljust at 8,l2legend
 label top "Exponential curves: growth over time (7%)" up -.2
.METAINFO2
