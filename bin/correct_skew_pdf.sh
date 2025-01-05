#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in $@; do  pdftoppm -png "$f" /tmp/1 ; 
done
for i in /tmp/1*.png ; do python /home/user/.local/bin/correct_skew.py -i "$i" ; mv rotated.png "$i"
done
 convert  /tmp/1*.png  "$f"
 rm /tmp/1*.png