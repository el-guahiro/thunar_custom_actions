#!/bin/bash
IFS=$'\#'
for i in "$@" ; do  ffmpeg -i "$i" -vn -c:a libmp3lame -y "${i%.wma}.mp3"
rm "$i"
done