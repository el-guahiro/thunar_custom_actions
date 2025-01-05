#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
OPTION1=$(zenity --list --radiolist  --width 400 --height 500\
       --title="сделать картинку легче" \
       --text="Выбери, степень сжатия" \
       --column="Отметка выбора" --column="Сжатие" \
       TRUE "2.5" FALSE "4.5" FALSE "3_and_sharp_and_0.8"  FALSE "выйти из программы")
if [ "$OPTION1" = "2.5"  ] ; then OPTION=picture_SMALLER_2.5x.sh;
	else  OPTION=picture_SMALLER_4.5x.sh; fi
if [ "$OPTION1" = "3_and_sharp_and_0.8"   ] ; then OPTION=picture_SMALLER_3x.sh; fi
if [ "$OPTION1" = "выйти из программы" ] ; then   OPTION=0 ;  fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)
