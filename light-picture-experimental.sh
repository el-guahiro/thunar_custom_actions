#! /bin/bash
#from el guahiro, USSR
IFS=$'\#'
for i in "$@" ; do convert "$i" -modulate 120,250,100 -unsharp 0x8+5+0 -median 7 -negate -lat 15x15+5% -contrast-stretch 0 -negate "$i".2 ; mv -v "$i".2 "$i" ; done | zenity --progress --width=400 --height=100 --title="улучшаем фотку" --text "работаю" --auto-close --pulsate;notify-send 'Теперь годится для печати!'
 exit
                 fi)