#! /bin/bash
IFS=$'\#'
for a in "$@" ; do
cp  "$a" /tmp/"$a"
cd /tmp
pdftoppm -jpeg "$a"  1 | zenity --progress --width=400 --height=100 --title="Сжимаем PDF" --text "работаю." --auto-close --pulsate;done
for z in 1*.jpg; do cwebp -q 50 -m 6 -z 9 "$z" -o "${z%.jpg}_%02d.webp" ; done | zenity --progress --width=400 --height=100 --title="Сжимаем дальше PDF" --text "работаю." --auto-close --pulsate
convert  -resize '48%' -fuzz 6500 -trim *.webp "$a"
mv "$a"  $OLDPWD/"$a" 
rm  /tmp/1*.jpg
rm  /tmp/*.webp
for i in "$@" ; do ps2pdf -dUseFlateCompression=true -dOptimize=true -dProcessColorModel=/DeviceRGB -dDownsampleGrayImages=true -dAutoFilterColorImages=false -dDownsampleColorImages=true -dDownsampleMonoImages=true -dGrayImageDownsampleType=/Bicubic "$i" "$i"2 | zenity --progress --width=400 --height=100 --title="Сжимаем дальше PDF" --text "работаю." --auto-close --pulsate; mv -v "$i"2 "$i";
done