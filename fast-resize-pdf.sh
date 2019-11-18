#! /bin/bash
IFS=$'\#'
for i in "$@" ; do ps2pdf -dUseFlateCompression=true -dOptimize=true -dProcessColorModel=/DeviceRGB  -r72 -dDownsampleGrayImages=true -dAutoFilterColorImages=false -dDownsampleColorImages=true -dDownsampleMonoImages=true -dGrayImageDownsampleType=/Bicubic "$i" "$i".2 ; mv -v "$i".2 "$i" ; done | zenity --progress --width=400 --height=100 --title="Сжимаем PDF" --text "работаю" --auto-close --pulsate;exiftool -r -overwrite_original -P -all= %N;notify-send 'Сжали PDF в три раза!'
 exit
                 fi)