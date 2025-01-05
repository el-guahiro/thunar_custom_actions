#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
for a in "$@" ; do
cp "$a" /tmp/"$a"
cd /tmp
pdftoppm -jpeg "$a" 1 ;done
convert 1*.jpg -modulate 110,110,100 -median 1 -blur 0x0.4 -unsharp 0x12+2+0  "$a".pdf
mv "$a".pdf /$OLDPWD/"$a".pdf
cd /$OLDPWD
touch -r "$a" "$a".pdf
mv "$a".pdf "$a" 
rm /tmp/1-*.jpg
rm /tmp/"$a"