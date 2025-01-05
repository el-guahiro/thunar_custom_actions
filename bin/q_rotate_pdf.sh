#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for a in "$@" ; do 
degree=`zenity  --list --text="Повернуть PDF" --radiolist --column "Выбрать" --column "Угол"  TRUE "90"   FALSE "270"  FALSE "180" FALSE "не поворачивать"  --height=350`; qpdf --rotate=$degree:1-z "$a" ".$a" ; mv .$a $a ; notify-send "повернули  файл PDF"
done
#в отличие от j_rotate_pdf.sh не поворачивает кратно 1 градусу