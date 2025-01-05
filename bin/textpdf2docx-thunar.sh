#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#Превращает PDF с текстовым слоем во вполне себе нрмальный файл DOCX. Но без картинок.
#Работет с PDF с колонками
for i in "$@";
do
extension="${i##*.}" 
filename="${i%.*}" 
#pdftotext -layout -enc UTF-8 "$i"  #для текста в одну колонку
mutool convert -o "$filename".txt "$i"
sed -i 's/[^[:print:]]//' "$filename".txt; sed -i -r 's/\xC2\xA0/ /g' "$filename".txt; sed -i -r 's/^[  \t]*|[ \t]*$//' "$filename".txt ; sed -i '$d' "$filename".txt ; sed -i -r 's/  */ /g' "$filename".txt ; sed -i -r '/^\s*$/d' "$filename".txt ; sed -i -r 's/^[[:upper:]].*/♫&/g'  "$filename".txt ; sed -i -r 's/[[:upper:]]$/&♫/' "$filename".txt ; sed -i -r -z 's/[.]\n|[;]\n|[:]\n|[?]\n|[!]\n/&♫/g' "$filename".txt; sed -i -r 's/^[0-9]|^[а-я]\)|^[-] /♫&/g' "$filename".txt ; sed -i -r -z 's/\n/ /g' "$filename".txt ; sed -i -r -z 's/♫/\n/g' "$filename".txt ; sed -i -r '/^\s*$/d' "$filename".txt ; sed -i -r 's/^[  \t]*//;s/[ \t]*$//' "$filename".txt ; sed -i -r  's/[0-9]$|[0-9]\.$/&♫/g' "$filename".txt ; sed -i -r -z 's/♫\n|♫\r/ /g' "$filename".txt ; sed -i 's/--|—/-/gi' "$filename".txt ; sed -i 's/  */ /gi' "$filename".txt ; #sed -i '$d' "$filename".txt 
abiword --to=docx "$filename".txt; mv "$filename".docx текст_"$filename".docx
rm "$filename".txt
	done
