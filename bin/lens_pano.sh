#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in $@; do convert -append -background white -gravity center -extent 115%x100% -distort barrel "0.057 -0.16 -0.05" keyboards -resize 85%x100%  "$f"   0_"$f" ; done 