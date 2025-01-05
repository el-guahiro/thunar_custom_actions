#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do  pdftoppm -jpeg "$i" .1 
for z in .1*.jpg; do convert -depth 4 -fuzz 6500 -transparent White "$z" "$z".png ;done
convert  .1*.png "$i".pdf
mv -v "$i".pdf "$i" 
rm .1*.jpg
rm .1*.png
done