#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do convert "$i" -fuzz 6500 -transparent White "$i".2 ; touch -r "$i" "$i".2 ; mv -v "$i".2 "$i" ; done 
 exit
                 fi)
