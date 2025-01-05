#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3) 
IFS=$'\#'
for i in "$@" ; do cwebp -q 50 -m 6 -z 9 "$i"  -o "${i%.*}.webp" ;  touch -r "$i" "${i%.*}.webp" 
done