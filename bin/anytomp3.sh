#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do ffmpeg -i "$i" -acodec libmp3lame "${i%.*}.mp3"
done