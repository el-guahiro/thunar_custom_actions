#! /bin/bash
IFS=$'\#'
for i in "$@" ; do  pdftoppm -jpeg "$i" "$i"tmp.jpg; 
for z in *tmp*.jpg; do convert "$z" -morphology Convolve DoG:2,20,0 -modulate 100,280,100 -negate -normalize -blur 0x0.7 -channel RBG -level 60%,91%,0.1 "$z".2  ; mv -v "$z".2 "$z" ; convert  *tmp*.jpg -page A4+0+0  2."$i" ; mv -v 2."$i" "$i" ; done
rm *tmp*.jpg
done