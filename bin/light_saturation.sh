#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do convert "$i" -modulate 107,155,101 sat_"$i" ; done
 exit
                 fi)
