#! /bin/bash
#from el guahiro, USSR
IFS=$'\#'
for i in "$@" ; do mogrify -unsharp 10x4+1+0 "$i" ; done
 exit
                 fi)
