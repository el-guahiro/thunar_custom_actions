#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
size=`zenity --entry --text="Сколько процентов, 200?"`
for image in $@
         do
        bn=`basename $image`
        name="${bn%.*}" 
        extension="${bn##*.}" 
        convert $image -resize ${size}% ${name}_${size}.${extension}
    done