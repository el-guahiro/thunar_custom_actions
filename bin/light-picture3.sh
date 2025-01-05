#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do convert  "$i" -morphology Convolve DoG:15,100,0 -modulate 100,150,100 -negate -normalize -blur 0x0.7 -channel RBG -level 30%,100%,0.4  "$i".2 ; touch -r "$i" "$i".2 ; mv -v "$i".2 "$i" ; done |zenity --progress --width=400 --height=100 --title="Делаем читабельно" --text "работаю." --auto-close --pulsate;notify-send 'Теперь годится для печати!'
 exit
                 fi)
