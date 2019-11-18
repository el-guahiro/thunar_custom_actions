#!/bin/bash
IFS=$'\#'
for a in "$@" ; do
cp  "$a" /tmp/"$a"
cd /tmp
pdftoppm -jpeg "$a"  1 | zenity --progress --width=400 --height=100 --title="Сжимаю PDF" --text "работаю." --auto-close --pulsate;
done
convert  1-*.jpg  %02d.pnm
rm 1-*.jpg
for i in *.pnm ; do unpaper -v --deskew-scan-deviation 3.0 "$i"  "$i".pnm; mv -v "$i".pnm "$i"
done
convert -resize 595 x 842 *.pnm $OLDPWD/rovny.pdf
rm  /tmp/*.pnm