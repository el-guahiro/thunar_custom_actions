#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do convert  -append -background white -gravity west -extent 101%x100% "$i" tmp"$i" ; convert -crop 33%x100% tmp"$i" ./%d_"$i" ; rm  tmp"$i" ; rm 3_"$i" ; done 
