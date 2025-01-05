#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in $@; do convert "$f" -append -background white -gravity center -extent 200%%x110%%  -matte -virtual-pixel transparent -distort Barrel "0.0 0.0 0.0 0.6   0.0 0.0 -0.26 1.25" -resize 50%%x75%% -gravity Center -crop 83%%x88.5%%+0+0 11111_"$f" ; done 