#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in $@; do pdftoppm -jpeg "$f" /tmp/1 ; convert -sharpen 1x14 -unsharp 0x16+5+0 -contrast -contrast -contrast -quality 100 /tmp/1*.jpg  "$f".pdf ; rm /tmp/1*.jpg ; mv "$f".pdf "$f" ; done
