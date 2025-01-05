#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do echo "$i" | parallel -eta cwebp -q 50 -m 6 -z 9 {} -o {.}.webp ; touch -r "$i" "${i%.*}.webp" ; done
#параллельно не заработал, т.к. выбор для одного файла