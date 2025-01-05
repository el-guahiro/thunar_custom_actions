#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in "$@"  ; do
#для преобразования страниц в файле PDF в формат A1-A4
format=`zenity --entry --title="Формат чертежа PDF" --text="Если A3, то 3, и т.д. или поставьте пробел, чтоб выйти" --entry-text="4"`
lev=`zenity --entry --title="Ориентация ландшафтная?" --text="Если ландшафтная - сотрите текст в окне, чтоб  выйти - поставьте  пробел" --entry-text="no-"`
pdfjam "$f" --"$lev"landscape  --a"$format"paper  --outfile "$f" 
done