#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do bokeh -s ring -r 12 -p 85 -t 90 -g 7 -S 10 "$i" bokeh_"$i" ; done

