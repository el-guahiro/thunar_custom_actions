#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in $@; do convert -matte -virtual-pixel transparent -distort Barrel "0.0 0.0 0.0 1.0   0.0 0.0 -0.075 1.25" -resize 100%%x120%% -gravity Center -crop 100%%x83%%+0+0 "$f" 111_"$f" ; done 