#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
for a in "$@" ; do
cp  "$a" /tmp/"$a"
cd /tmp
pdftoppm -jpeg "$a"  1 | zenity --progress --width=400 --height=100 --title="Сжимаем PDF" --text "работаю." --auto-close --pulsate;done
mogrify -quality 28 -normalize  -filter Triangle -define jpeg:dct-method=float -channel RBG -dither None  1-*.jpg | zenity --progress --width=400 --height=100 --title="Почти закончил" --text 'нажми Ok, когда дойдёт до конца'
convert  1-*.jpg "$a"
mv "$a"  $OLDPWD/"$a" 
rm  /tmp/1-*.jpg