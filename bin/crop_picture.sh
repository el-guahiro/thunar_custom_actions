#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
shave=`zenity --entry --title="обрезать картинку" --text="Введите число пикселей первое - слева-справа, второе - верх-низ, например 200x0, или поставьте пробел (родной размер)" --entry-text="200x0"`; 
for f in $@; do convert -shave "$shave" "$f" "$f" ; done 