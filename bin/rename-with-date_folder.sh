#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#adds any date of your choice to the file name
for i in "$@";
do
filename="$i" 
pickdate=$(zenity --width 500 --height 200 --calendar --title "выбираем дату"); echo $date|tr -d "\r\n"|xclip -selection clipboard
mv "$i" "${filename} $pickdate"
	done
