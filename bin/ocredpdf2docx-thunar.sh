#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#не работает для текста с колонками, см. другой скрипт с Mutool
for i in "$@";
do
extension="${i##*.}" 
filename="${i%.*}" 
pdftotext -q -nopgbrk -layout "$i" ; sed -i 's/[^[:print:]]//' "$filename".txt; sed -i -r 's/\xC2\xA0/ /g' "$filename".txt; sed -i -r 's/^[  \t]*|[ \t]*$//' "$filename".txt ; sed -i -r 's/  */ /g' "$filename".txt ; sed -i -r '/^\s*$/d' "$filename".txt ;sed -i -r 's/^[[:upper:]].*/♫&/g'  "$filename".txt ; sed -i -r 's/[[:upper:]]$/&♫/' "$filename".txt ;  sed -i -r -z 's/[.]\n|[;]\n|[:]\n|[?]\n|[!]\n/&♫/g' "$filename".txt; sed -i -r 's/^[0-9]|^[а-я]\)|^[-] /♫&/g' "$filename".txt ; sed -i -r -z 's/\n/ /g' "$filename".txt ; sed -i -r -z 's/♫/\n/g' "$filename".txt ; sed -i -r '/^\s*$/d' "$filename".txt ; sed -i -r 's/^[  \t]*//;s/[ \t]*$//' "$filename".txt ; sed -i -r  's/[0-9]$|[0-9]\.$/&♫/g' "$filename".txt ; sed -i -r -z 's/♫\n|♫\r/ /g' "$filename".txt ; sed -i 's/--|—/-/gi' "$filename".txt ; sed -i 's/  */ /gi' "$filename".txt 
abiword --to=docx "$filename".txt; mv "$filename".docx текст_"$filename".docx
rm "$filename".txt
	done
