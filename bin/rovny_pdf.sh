#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for a in "$@" ; do
cp  "$a" /tmp/"$a"
cd /tmp
pdftoppm -jpeg "$a"  1 | zenity --progress --width=400 --height=100 --title="Выравниваю PDF" --text "работаю." --auto-close --pulsate;
done
convert  1-*.jpg  %02d.pnm
rm 1-*.jpg
for i in *.pnm ; do unpaper -v --deskew-scan-deviation 3.0  -dd 1.0 "$i"  "$i".pnm; mv -v "$i".pnm "$i"
done
convert  *.pnm $OLDPWD/rovny.pdf
mv $OLDPWD/rovny.pdf "$a"
rm  /tmp/*.pnm