#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for a in "$@" ; do
pdftoppm -jpeg "$a"   /tmp/1 | zenity --progress --width=400 --height=100 --title="Выравниваю PDF" --text "работаю." --auto-close --pulsate;
done
for i in /tmp/1-*.jpg ; do textdeskew "$i" "$i"
done
img2pdf -o /tmp/rovny.pdf  -S A4 --auto-orient /tmp/1-*.jpg
mv /tmp/rovny.pdf "$a"
rm /tmp/1-*.jpg