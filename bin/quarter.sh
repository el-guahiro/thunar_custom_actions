#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in $@; do convert -matte -virtual-pixel transparent -distort Barrel "0.0 0.0 0.0 1.0   0.0 0.0 -0.35 1.8" -resize 97%%x135%% -gravity Center -crop 100%%x63.5%%+0+0  "$f" 1_"$f" ; done 