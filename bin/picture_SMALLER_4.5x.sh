#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do convert  "$i" -filter Triangle -define filter:support=2 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality 50 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip  "$i".2 ; touch -r "$i" "$i".2 ; mv -v "$i".2 "$i" ; done |zenity --progress --width=400 --height=100 --title="Уменьшаю изображение" --text "работаю." --auto-close --pulsate;notify-send 'Готово!'

