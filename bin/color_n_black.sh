#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in "$@"  ; do
fn=$(basename "$f")
convert "$f" -negate -lat 15x15+5% -contrast-stretch 0 -negate  "$fn" ; done