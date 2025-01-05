#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do convert "$i" -modulate 110,110,100 -median 1 -blur 0x0.4 -unsharp 0x12+2+0 -density 300 "$i"2 ; touch -r "$i" "$i"2  ; mv "$i"2 "$i" ; done |zenity --progress --width=400 --height=100 --title="Делаем читабельно" --text "работаю." --auto-close --pulsate;notify-send 'Теперь годится для печати!'
 exit
                 fi)