#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
OPTION1=$(zenity --list --radiolist  --width 400 --height 300\
       --title="Вписать PDF в формат" \
       --text="Задать формат" \
       --column="Отметка выбора" --column="A4 или A3" \
       TRUE "A4" FALSE "A3"  )
if [ "$OPTION1" = "A4"   ] ; then OPTION="210mm 297mm" ;
	else  OPTION="420mm 297mm" ; fi
	for a in "$@" ; do 
	cpdf -scale-to-fit  $OPTION "$a" -o _"$a" ; mv _$a $a ; notify-send "вписали  файл PDF в $OPTION1"
done
