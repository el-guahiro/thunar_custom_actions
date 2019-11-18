#! /bin/bash
IFS=$'\#'
for i in "$@" ; do convert  "$i"  -modulate 100,250,100 -sharpen 2 -morphology Convolve DoG:2,20,0 -negate -normalize -blur 0x0.8 -channel RBG -level 60%,91%,0.1  "$i".2  ; mv -v "$i".2 "$i" ; done