#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
a=$(zenity --title="НАЧАЛО ЧАС:МИН:СЕК" --width 400 --entry --text "НАЧАЛО клипа или рингтона
формат час:мин:сек");
b=$(zenity --title="КОНЕЦ ЧАС:МИН:СЕК" --width 400 --entry --text "КОНЕЦ клипа или рингтона
формат час:мин:сек"); 
for f in $@; do ffmpeg -i  "$f" -ss "$a" -to "$b" -async 1 -c copy "${f%.*} "$a"_"$b".${f##*.}" ; done