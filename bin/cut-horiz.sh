#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\n'
images=$@
size=`zenity --entry --text="величина части в процентах, например 50, это на 2 части, - 25 - на четыре"`
if [ "$size" -gt 0 -a "$size" -lt 100 ]; then
    for image in $images; do
        dn=`dirname  $image`
        bn=`basename $image`
        convert $image -crop 100%x${size}% ${dn}/${size}_$image
    done
fi