#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do softening=`zenity --entry --title="Ретро-свечение" --text="Коэффициент, от 0 до 150, 108 - это день, 12 - это ночь  или поставьте пробел" --entry-text="36"`; glow -a 1.7 -s $softening  "$i" glow"$softening"_"$i" ; done

