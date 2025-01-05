#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in $@; do convert -append -background white -gravity center -extent 200%%x200%%  -matte -virtual-pixel transparent -distort Barrel "0.0 0.0 0.0 1.0  0.0 0.0 -0.26 1.25" -resize 80%%x350%% -gravity Center -crop 50%%x50%%+0+0  "$f" 1111_"$f" ; done 