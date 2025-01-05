#!/bin/bash
#Search in PDF files in the directory
#el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
searching=`zenity  --width=350 --height=100 --entry --title="Найти текст в файлах PDF" --text="Введите что ищем" --entry-text="тут напишите, а это стереть"`; pdfgrep -H -i -n -r "$searching"
#Explanation of the last key:
# -r, --recursive                          Search directories recursively
 #-R, --dereference-recursive    Likewise, but follow all symlinks

#For LARGE dirs, search all .pdf files in the current directory in parallel on a multcore CPU:
#find . -name "*.pdf" -print0 | parallel -q0 pdfgrep -H foobar
