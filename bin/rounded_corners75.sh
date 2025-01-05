#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\n'
for i in "$@";
do convert "$i" \
\( +clone -alpha extract \
-draw 'fill black polygon 0,0 0,75 75,0 fill white circle 75,75 75,0' \
\( +clone -flip \) -compose Multiply -composite \
\( +clone -flop \) -compose Multiply -composite \
\) -alpha off -compose CopyOpacity -composite "$i"
done