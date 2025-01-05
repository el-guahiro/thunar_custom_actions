#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
filename=$1
if [[ -L $1 ]]; then ln -s "$(realpath $filename)" /tmp/true_$filename  ; mv /tmp/true_$filename . ; rm -r  $filename ; mv true_$filename $filename
fi