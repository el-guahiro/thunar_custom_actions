#! /bin/sh
#https://unix.stackexchange.com/questions/294341/shell-script-to-separate-and-move-landscape-and-portrait-images
#Необходимо установить:  >>>>   sudo apt install leptonica-progs
#remastered by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
mkdir "portraits"; mkdir "landscapes"; 
for f in "$@"
do
    if fileinfo "$f" 2>&1 | awk '/w =/{w=$3+0; h=$6+0; if (h>w) exit; else exit 1}'
    then
        mv "$f" portraits/
    else
        mv "$f" landscapes/
    fi
done