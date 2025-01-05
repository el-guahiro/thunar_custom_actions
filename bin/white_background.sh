#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do convert -fuzz 50% -fill white -opaque white "$i" "$i".2 ; touch -r "$i" "$i".2 ;  mv -v "$i".2 "$i" ; done |zenity --progress --width=400 --height=100 --title="Фон текста делаю чище!" --text "работаю." --auto-close --pulsate;notify-send 'Теперь годится для печати!'
 exit
                 fi)
