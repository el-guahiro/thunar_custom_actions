#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
OPTION1=$(zenity --list --radiolist  --width 700 --height 300\
       --title="Исправляем поворот страниц PDF" \
       --text="Выберите способ" \
       --column="Отметка выбора" --column="способ" \
       TRUE "Python" FALSE "Unpaper")
if [ "$OPTION1" = "Python"  ] ; then OPTION=correct_skew_pdf.sh ;
	else  OPTION=rovny_pdf2.sh ; fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)