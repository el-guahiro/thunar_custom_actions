#!/bin/bash
IFS=$'\#'
for i in "$@" ; do pdf2svg "$i" "${i%.pdf}_%d.svg" all
#rm "$i"
done
