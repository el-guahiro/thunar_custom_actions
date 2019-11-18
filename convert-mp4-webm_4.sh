#!/bin/bash
IFS=$'\#'
for i in "$@" ; do ffmpeg -i "$i" -cpu-used 4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${i%.mp4}.webm"
#rm "$i"
done