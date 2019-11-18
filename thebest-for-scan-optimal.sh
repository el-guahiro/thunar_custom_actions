#! /bin/bash
IFS=$'\#'
for i in "$@" ; do convert  "$i" -normalize -modulate 110,110,100 -median 2 -blur 0x0.6 -unsharp 0x9+6+0 "$i".2  ; mv -v "$i".2 "$i" ; done