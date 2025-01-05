#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
# to convert doc 2 odt : libreoffice --headless --convert-to odt file.doc
IFS=$'\n'
for i in "$@";
do mv "$i" "${i%.*}.zip";
done
unzip "${i%.*}.zip" -d "${i%.*}"
mogrify -resize 500x500 "${i%.*}"/Pictures/*
cd "${i%.*}"
zip -r "${i%.*}.zip" ./*
cd ../
mv "${i%.*}.zip" "$i"
rm -R "${i%.*}"