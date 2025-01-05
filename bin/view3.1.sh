#!/bin/bash 
#idea by qqq https://forum.xubuntu-ru.net/index.php?msg=1282
# &by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#This script performs a simple viewing in the contents of files in all popular office formats.
#Search in PDF annotations

IFS=$'\#'
filename=$1

if [ "$(file -b --mime-type $1 | sed 's|.*/||')" = "html" ]; then
lynx -stdin -dump < $filename |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

if [ "${filename##*.}" = "docx" ]; then
docx2txt < $filename |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

if [ "${filename##*.}" = "odt" -o "${filename##*.}" = "ods" -o "${filename##*.}" = "odp" ]; then
odt2txt --width=80 $filename |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

if [ "${filename##*.}" = "doc" ]; then
catdoc $filename |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

if [ "${filename##*.}" = "rtf" -o "${filename##*.}" = "ppt" ]; then
catdoc $filename |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

if [ "${filename##*.}" = "xls" -o "${filename##*.}" = "xlsx" ]; then
ssconvert $filename $filename.csv; cat $filename.csv |  tr '.' '\n' |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
rm  $filename.csv
fi

if [ "$(file -b --mime-type $1 |sed 's%.*/%%' )" = "pdf" ]; then
pdftotext -q -layout $filename - |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

#view or search in annotations
if [ "$(file -b --mime-type $1 |sed 's%.*/%%' )" = "pdf" ]; then
python3 ~/.local/bin/pdf_extract_annotations.py $filename| sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

if [ "${filename##*.}" = "pptx" ]; then
pptx2txt.sh $filename |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

if [ "$(file -b --mime-type $1 | sed 's|/.*||')" = "text" ]; then
cat $filename |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

if [ "${filename##*.}" = "djvu" ]; then
djvutxt $filename|less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi

if [ "${filename##*.}" = "csv" ]; then
cat $filename |less | sed '/\S/!d; s/  / /g;s/  / /g;s/  / /g; s/,,/ /g'
fi
