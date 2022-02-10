.SECTION Misc
.SUBSECTION Vym: Mind Mapping
.SUBSECTION entr: run command on file change
.SH
Basic usage
.LP
.COMMAND1
find . -name "*.ms" | entr gmake build
.COMMAND2

.SUBSECTION Retroarch: retro gaming

.SUBSECTION nl: add line numbers
.SH
Usage
.LP
.COMMAND1
nl file
.COMMAND2

.SUBSECTION prename: renaming files with regex
Simple Perl script.

.SUBSECTION paste: concat files line-by-line
.SH
Usage
.LP
.COMMAND1
 echo a > a
 echo b > b
 paste a b
 > a b
.COMMAND2

.SUBSECTION Faster key inputs
xset r rate 200 50

.SUBSECTION sxiv: image viewer

.SUBSECTION zathura: pdfviewer

.SUBSECTION mocp: music player

.SUBSECTION scrot: taking screenshots
.SH
With selection
.COMMAND1
scrot -s my-image.png
.COMMAND2
.LP
Possible alternative: shutter

.SUBSECTION gs: compress a PDF
.COMMAND1
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=output.pdf input.pdf
.COMMAND2

.SUBSECTION Kdenlive: (Non Linear) Video Editing
.SUBSECTION Audacity: Audio Editing
.SUBSECTION Krita: Image Editing
.SUBSECTION pointtools: create presentations

.SUBSECTION rtorrent

.SUBSECTION powertop: change power settings on Linux

.SUBSECTION Tools I used to use, still fine
.LP
.BULLET
.UL "deluge and transmission" :
torrent.
.BULLET
.UL "LaTeX"
.BULLET
.UL ""
.ENDBULLET

.SUBSECTION Tools I never (or not often) used but seem fine
.LP
.BULLET
.UL "jot"
to replace
.B seq
.BULLET
.UL inkscape
.BULLET
.UL "Enlightment Foundation Libraries (EFL)"
.BULLET
.UL openscad :
3d modeling with a language similar to
.I pic .
.BULLET
.UL "Seeks and searx" ,
to replace search engines.
.BULLET
.UL Pinta ,
may be a valid alternative to Krita.
.BULLET
.UL guitarix :
sadly using JACK, which I refuse to use on my main OpenBSD machine.
.BULLET
.UL timidity :
play MIDI with SoundFount2.
.BULLET
.UL hydrogen :
rythmbox.
.BULLET
.UL "Ardour"
.BULLET
.UL gdb
.ENDBULLET

.SUBSECTION Games
.LP
.BULLET
.UL "Caph and Numpty Physics" ,
games with a good physic engine.
.BULLET
.UL "Teeworlds"
.BULLET
.UL "zero-k"
.BULLET
.UL "0AD"
.ENDBULLET

.SECTION Websites
.BULLET
.UL "explainshell.com"
.BULLET
.ENDBULLET
