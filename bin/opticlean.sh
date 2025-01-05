#!/bin/sh
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#очистка файла, когда его не видит Mupdf или Llpp
IFS=#
for i in "$@" ; do ps2pdf -dUseFlateCompression=true -dOptimize=true -dProcessColorModel=/DeviceRGB -dUseCIEColor=true -r72 -dDownsampleGrayImages=true -dAutoFilterColorImages=false -dDownsampleColorImages=true -dDownsampleMonoImages=true -dGrayImageDownsampleType=/Bicubic "$i" "$i".2 ; mv -v "$i".2 "$i"; done