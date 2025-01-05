#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@"
do notify-send  -t 30000 ' ' "`getfattr --only-values "$i"`"
getfattr --only-values "$i"|xclip -selection clipboard
notify-send "Текст в буфере обмена"
done
