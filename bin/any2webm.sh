#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do ffmpeg -i "$i" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${i%.*}.webm"
rm "$i"
done