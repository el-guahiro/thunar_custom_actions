#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do  ffmpeg -i "$i" -vn -c:a libmp3lame -y "${i%.*}.mp3"
rm "$i"
done