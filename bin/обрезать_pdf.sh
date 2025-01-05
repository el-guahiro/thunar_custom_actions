#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
shave=`zenity --entry --title="обрезать картинку" --text="Введите формат процент обрезки с каждой стороны, например 5 (это 10 с двух), или поставьте пробел (родной размер)" --entry-text="5"`; 
for f in $@; do  pdftoppm -jpeg "$f" /tmp/1 ;  convert -shave "$shave"% /tmp/1*.jpg  "$f".pdf ; rm /tmp/1*.jpg ; mv "$f".pdf "$f" ; done