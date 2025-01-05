#!/bin/bash
# to convert doc 2 odt : libreoffice --headless --convert-to odt file.doc
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\n'
for i in "$@";
do libreoffice --headless --convert-to odt "$i" 
done
mv "${i%.*}.odt" "${i%.*}.zip"
unzip "${i%.*}.zip" -d "${i%.*}"
mogrify -resize 500x500 "${i%.*}"/Pictures/*
picture_SMALLER_4.5x.sh "${i%.*}"/Pictures/*
cd "${i%.*}"
zip -r "${i%.*}.zip" ./*
cd ../
mv "${i%.*}.zip" "${i%.*}.odt"
unoconv --format=doc "${i%.*}.odt"
rm -R "${i%.*}"
 if [ -f "${i%.*}.doc" ]; then
rm "${i%.*}.odt"
fi
 if [ -f "${i%.*}.DOC" ]; then
rm "${i%.*}.odt"
fi
 if [ -f "${i%.*}.docx" ]; then
rm "${i%.*}.odt"
fi
 if [ -f "${i%.*}.DOCX" ]; then
rm "${i%.*}.odt"
fi