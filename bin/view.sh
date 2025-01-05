#!/bin/bash
#by qqq https://forum.xubuntu-ru.net/index.php?msg=12823
IFS=$'\#'
filename=$1

if [ "${filename##*.}" = "docx" ]; then
docx2txt.pl < $filename | less
fi

if [ "${filename##*.}" = "odt" -o "${filename##*.}" = "ods" -o "${filename##*.}" = "odp" ]; then
odt2txt --width=80 $filename | less
fi

if [ "${filename##*.}" = "doc" ]; then
antiword -f -w 0 $filename | less
fi

if [ "${filename##*.}" = "rtf" -o "${filename##*.}" = "ppt" ]; then
catdoc $filename | less -s
fi

if [ "${filename##*.}" = "xls" ]; then
xls2csv $filename | less
fi

if [ "${filename##*.}" = "xlsx" ]; then
python3 /usr/local/lib/python3/site-packages/xlsx2csv.py $filename | less
fi

if [ "${filename##*.}" = "txt" -o "${filename##*.}" = "md" ]; then
cat $filename | less
fi

if [ "${filename##*.}" = "png" -o "${filename##*.}" = "jpg" ]; then
w3m $filename
fi

if [ "${filename##*.}" = "html" ]; then
html2text $filename | less
fi

if [ "${filename##*.}" = "pdf" ]; then
pdftotext -q -layout $filename - | less
fi