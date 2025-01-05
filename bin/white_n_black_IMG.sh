#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in "$@"  ; do
fn=$(basename "$f")
convert "$f" -negate -lat 10x10+10% -contrast-stretch 0 -negate  -colorspace Gray "$fn" ; done