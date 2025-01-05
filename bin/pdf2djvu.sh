#!/bin/bash
#el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@";
do pdf2djvu -o "$(basename -s .pdf "$i")".djvu -d 300  "$i"  | zenity --progress --width=400 --height=100 --title="Конвертирует" --text "работаю." --auto-close --pulsate; mpv /usr/share/sounds/muchcacha_night/stereo/network-connectivity-established.ogg; notify-send "Получили DJVU файл" 
done
