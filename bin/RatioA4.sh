#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
OPTION1=$(zenity --list --radiolist  --width 400 --height 200\
       --title="Вписать картинку, обрезав до пропорций A4" \
       --text="Как расположена картинка?" \
       --column="Отметка выбора" --column="Положение" \
       TRUE "вертикально" FALSE "горизонтально"  FALSE "выйти из программы")
if [ "$OPTION1" = "вертикально"  ] ; then OPTION=crop2A4_vert_ratio.sh;
	else  OPTION=crop2A4_horiz_ratio.sh; fi
if [ "$OPTION1" = "выйти из программы" ] ; then   OPTION=0 ;  fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)