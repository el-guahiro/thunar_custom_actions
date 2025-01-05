#!/bin/bash
#Search in PDF files in the directory
#el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#Search in main content of the file
searching=`zenity  --width=350 --height=100 --entry --title="Найти текст в файлах PDF" --text="Введите что ищем" --entry-text="тут напишите, а это стереть"`; pdfgrep -H -i -n -r "$searching"
#and search in anotations
find . -iname "*.pdf" | 
while read i ; do python3 ~/.local/bin/pdf_extract_annotations.py "$i" | less |
rg -i -C 2 "$searching" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done


echo -e "\033[1m\033[38;5;11m"Время поиска $SECONDS секунд"\033[0m"

#Explanation of the last key:
# -r, --recursive                          Search directories recursively
 #-R, --dereference-recursive    Likewise, but follow all symlinks

#For LARGE dirs, search all .pdf files in the current directory in parallel on a multcore CPU:
#find . -name "*.pdf" -print0 | parallel -q0 pdfgrep -H foobar
