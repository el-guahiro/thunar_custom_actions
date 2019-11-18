#! /bin/bash
IFS=$'\#'
for i in "$@" ; do  pdftoppm -jpeg "$i" "$i"tmp.jpg; 
for z in *tmp*.jpg; do convert "$z" -median 2 -unsharp 0x16+5+0 -level 10%,70%,0.8 -density 300 "$z".2  ; mv -v "$z".2 "$z" ; convert  *tmp*.jpg -page A4+0+0  2."$i" ; mv -v 2."$i" "$i" ; done
rm *tmp*.jpg
done