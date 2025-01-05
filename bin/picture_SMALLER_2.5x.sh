#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do convert  "$i" --strip -interlace Plane -gaussian-blur 0.05 -quality 85%  "$i".2 ; touch -r "$i" "$i".2 ; mv -v "$i".2 "$i" ; done | zenity --progress --width=400 --height=100 --title="Уменьшаю изображение" --text "работаю." --auto-close --pulsate;notify-send 'Готово!'

