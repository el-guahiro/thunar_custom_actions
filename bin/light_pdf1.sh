#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in $@; do  pdftoppm -jpeg "$f" /tmp/1 ; convert -morphology Convolve DoG:15,100,0 -modulate 100,150,100 -negate -normalize -blur 0x0.3 -channel RBG -level 30%,100%,0.6 /tmp/1*.jpg "$f".pdf ; touch -r "$f" "$f".pdf ; rm /tmp/1*.jpg ; mv "$f".pdf "$f" ; done
for f in "$@" ; do ps2pdf -dUseFlateCompression=true -dOptimize=true -dProcessColorModel=/DeviceRGB -dDownsampleGrayImages=true -dAutoFilterColorImages=false -dDownsampleColorImages=true -dDownsampleMonoImages=true -dGrayImageDownsampleType=/Bicubic "$f" "$f"2 ; touch -r "$f" "$f"2 ; mv -v "$f"2 "$f";
done