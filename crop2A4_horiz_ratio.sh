#! /bin/bash
IFS=$'\#'
for i in "$@" ; do aspectcrop -a 842:595 -g c "$i" "$i" ; done 