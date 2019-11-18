#!/bin/bash
IFS=$'\#'
for i in "$@" ; do pdf2svg "$i" "${i%.pdf}.svg"
cairosvg "${i%.pdf}.svg" -o "$i"
rm *.svg
done