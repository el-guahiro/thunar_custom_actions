#!/bin/bash
IFS=$'\#'
for i in "$@" ; do cwebp -q 50 -m 6 -z 9 "$i"  -o "$i".webp
rename 's/jpg.webp|jpeg.webp|png.webp|JPG.webp/webp/gi' *.webp 
done