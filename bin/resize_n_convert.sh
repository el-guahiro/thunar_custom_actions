#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
size=`zenity --entry --title="Задать размер в пикселях" --text="Введите размер, например 500x500 или поставьте минус (родной размер)" --entry-text="1920x1920"`
type=`zenity --entry --title="Задать тип файла" --text="Введите тип, например png или поставьте впишите входное расширение БОЛЬШИМИ БУКВАМИ (тот же формат файла)" --entry-text="png"`
for i in "$@" ; do convert "$i" -resize $size -format $type "${i%.*}".$type ; done