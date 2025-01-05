#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for a in "$@" ; do 
degree=`zenity  --list --text="Повернуть PDF" --radiolist --column "Выбрать" --column "Угол"  TRUE "90"   FALSE "270"  FALSE "180" FALSE "не поворачивать"  --height=350`; cpdf "$a" -rotate "$degree" -o "$a" ; notify-send "повернули  файл PDF"
done
#Поворот не сохраняется, если прогоняем через программу сжатия или очистки, лучше q_rotate_pdf.sh
#в отличие jот _rotate_pdf.sh не поворачивает кратно 1 градусу