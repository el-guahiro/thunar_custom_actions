#! /bin/bash
IFS=$'\#'
for i in "$@" ; do aspectcrop -a 595:842 -g c "$i" "$i" ; done