#!/bin/sh
IFS=$'\n'
for i in "$@" ; do mogrify -resize 70% "$i" ; done
      exit
                 fi)