#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\n'
for i in "$@";
do mv "$i" "${i%.*}.zip";
done
unzip "${i%.*}.zip" -d "${i%.*}"
cd "${i%.*}"/word/media/
mogrify -resize 500x500 ./*
picture_SMALLER_4.5x.sh ./*
cd "${i%.*}"
zip -r "${i%.*}.zip" ./*
cd ../
mv "${i%.*}.zip" "$i"
rm -R "${i%.*}"