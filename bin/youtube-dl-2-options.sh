#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#xтобы youtube-dl работал, надо его обновить
OPTION1=$(zenity --list --radiolist  --width 900 --height 300\
       --title="ВИДЕО ИЛИ АУДИО" \
       --text="Выбрать, что Вам надо" \
       --column="Отметка выбора" --column="тип файла" \
       TRUE "Видео" FALSE "Аудио")
if [ "$OPTION1" = "Видео"  ] ; then OPTION=youtube-dl $(xclip -o) ;
	else  OPTION=`youtube-dl -x $(xclip -o)` ; fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)
