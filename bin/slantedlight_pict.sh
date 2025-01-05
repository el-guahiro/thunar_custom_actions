#! /bin/bash
#добавляет эффект "наклонного освещения" к изображениям
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do slantedlight -a 0 -i 100 -d 30 -s 0 -p 2 -c white "$i" slantedlight_"$i" ; done
