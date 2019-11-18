#!/bin/bash
IFS='#'
n=0;
ll=`ls -1|tr '\n' '|'`
IFS='|'
for i in "$@"; do 
        echo i = $i
        fn=${i%.*}
        echo fn = "$fn"
        rsh="${i#*.}"
        echo rsh = "$rsh"
        if [ "$fn" = "$rsh" ]; then rsh=""; else rsh=".$rsh" ; fi
        mv -v  "$i" "$fn `date +%x`$rsh"

        n=$((n=n+1))
        done
