#!/bin/sh
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#Better to use the little "true calendar" program by el guahiro instead
date=$(zenity --width 400 --height 300 --calendar --text "который день?" --title "выбираем дату"); echo $date|tr -d '\r\n'|xclip -selection clipboard