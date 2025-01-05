#!/bin/bash
IFS=$'\#'
rm -fr out; mkdir out;
for i in image*.emf; do
unoconv -f pdf -o t.pdf "$i";
pdfimages t.pdf out;
convert out-000.ppm -trim out/$(basename "$i").jpg;
done