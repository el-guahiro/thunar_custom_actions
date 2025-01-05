#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for a in "$@" ; do 
degree=`zenity  --list --text="Повернуть PDF" --radiolist --column "Выбрать" --column "Угол"  TRUE "90"   FALSE "270"  FALSE "180"  FALSE "не поворачивать" FALSE "0.5" FALSE "1" FALSE "359.5" FALSE "359" --height=350`; pdfjam  --outfile "$a" --angle -$degree --fitpaper true --rotateoversize true "$a"  ; notify-send "повернули  файл PDF"
done