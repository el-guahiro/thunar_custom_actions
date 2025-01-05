#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
rm -fr out; mkdir out;
for i in image*.wmf; do
unoconv -f pdf -o t.pdf "$i";
pdfimages t.pdf out;
convert out-000.ppm -trim out/$(basename "$i").jpg;
done