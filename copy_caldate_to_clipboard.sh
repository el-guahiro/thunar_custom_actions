#!/bin/sh
date=$(zenity --calendar --text "который день?" --title "выбираем дату"); 
echo $date|tr -d '\r\n'|xclip -selection clipboard