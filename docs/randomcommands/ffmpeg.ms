.SECTION FFMPEG
.SECTION_NO_NUMBER slideshow from a couple of images
.COMMAND1
ffmpeg -y -r 1/3 -framerate 1 -i %1d.jpg  -c:v libx264 -vf fps=5 -pix_fmt yuv420p out.mp4
.COMMAND2
Or use another option to provide images:
.COMMAND1
-pattern_type glob -i "./photos/*.jpg"
.COMMAND2

.SECTION_NO_NUMBER add audio to a video
.COMMAND1
ffmpeg -i mute-video.mp4 -i music.wav -c:v copy -c:a aac -strict -2 -shortest output.mp4
.COMMAND2
