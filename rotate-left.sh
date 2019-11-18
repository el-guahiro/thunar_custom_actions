#!/bin/sh
IFS=#
for i in "$@" ; do ps2pdf -dUseFlateCompression=true -dOptimize=true -dProcessColorModel=/DeviceRGB -dUseCIEColor=true -r72 -dDownsampleGrayImages=true -dAutoFilterColorImages=false -dDownsampleColorImages=true -dDownsampleMonoImages=true -dGrayImageDownsampleType=/Bicubic "$i" "$i".2 ; mv -v "$i".2 "$i"; pdftk $i cat 1-endwest output "$i".2 ; mv -v "$i".2 "$i"; done
      exit
                 fi)