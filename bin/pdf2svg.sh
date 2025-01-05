#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do pdf2svg "$i" "${i%.pdf}_%d.svg" all
#rm "$i"
done
