.NH 1
Misc
.NH 2
Vym: Mind Mapping
.NH 2
entr: run command on file change
.SH
Basic usage
.LP
.COMMAND1
find . -name "*.ms" | entr gmake build
.COMMAND2

.NH 2
Retroarch: retro gaming

.NH 2
nl: add line numbers
.SH
Usage
.LP
.COMMAND1
nl file
.COMMAND2

.NH 2
prename: renaming files with regex
.PP
Simple Perl script.

.NH 2
paste: concat files line-by-line
.SH
Usage
.LP
.COMMAND1
 echo a > a
 echo b > b
 paste a b
 > a b
.COMMAND2

.NH 2
sxiv: image viewer

.NH 2
zathura: pdfviewer

.NH 2
mocp: music player

.NH 2
scrot: taking screenshots
.SH
With selection
.COMMAND1
scrot -s my-image.png
.COMMAND2
.LP
Possible alternative: shutter

.NH 2
gs: compress a PDF
.COMMAND1
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=output.pdf input.pdf
.COMMAND2

.NH 2
Kdenlive: (Non Linear) Video Editing
.NH 2
Audacity: Audio Editing
.NH 2
Krita: Image Editing
.NH 2
pointtools: create presentations

.NH 2
rtorrent

.NH 2
powertop: change power settings on Linux

.NH 2
Tools I used to use, still fine
.LP
.BULLET
.UL "deluge and transmission" :
torrent.
.BULLET
.UL "LaTeX"
.BULLET
.UL ""
.ENDBULLET

.NH 2
Tools I never (or not often) used but seem fine
.LP
.BULLET
.UL inkscape
.BULLET
.UL "Enlightment Foundation Libraries (EFL)"
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

.NH 2
Games
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

.NH 1
Websites
.PP
.BULLET
.UL "explainshell.com"
.BULLET
.ENDBULLET

.NH 1
Work behind my first video
.LP
Not even counting the work about the subject itself (Zig).
.NH 2
tmux
.LP
.BULLET
.UL "switching between sessions" :
.BX "("
and
.BX ")"
.BULLET
.UL "moving and renaming windows"
.ENDBULLET
.NH 2
ffmpeg
.LP
.BULLET
.UL "record audio"
.BULLET
.UL "display camera" ,
my face is a window on my screen
.BULLET
.UL "record screen" ,
not camera directly but my whole screen
.BULLET
.UL "audio shifting" ,
to sync audio and video, and also one time the audio shifted
.FOOTNOTE1
The audio shifted at some point during a record, don't know why.
.FOOTNOTE2
.BULLET
.UL "file conversions" ,
from wav to opus for instance
.ENDBULLET
.NH 2
scrot: taking a few screenshots
.NH 2
Kdenlive
.LP
.BULLET
.UL "cut and mix video"
.BULLET
.UL "transitions" ,
fading in and out (audio and video)
.BULLET
.UL "inserts (text, image, video)"
.BULLET
.UL "effects" ,
fading some elements, bluring the screen while inserting an image
.BULLET
.UL "blur some parts" ,
to censor my pseudo, for example
.BULLET
.UL "audio correction" ,
mute noises, lower audio volume when speaking too loudly, that sort of things
.ENDBULLET
.NH 2
pointtools
.NH 2
vt animations
.LP
To print a beer animation, unix style.
.NH 2
Krita
.BULLET
.UL "insert image and text"
.BULLET
.UL "effects on image and text" ,
colors, texture (kinda), blur, sharpness
.BULLET
.UL "cropping an image"
.BULLET
.UL "G'MIC to crop an image"
.BULLET
.UL "image resize and rotation"
.ENDBULLET
