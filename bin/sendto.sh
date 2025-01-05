#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#Добавляет АБСОЛЮТНУЮ ссылку на Рабочий стол
IFS=$'\#'
for i in "$@" ; do ln -s "$(realpath "$i")" ~/Рабочий\ стол ; notify-send "Ссылка на рабочем столе"
done
