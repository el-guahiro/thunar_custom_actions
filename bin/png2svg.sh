#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
if [ "$1" == "" ]; then
  echo Usage: $0 pngfile
  exit 0;
fi

FILE=`basename $1 .png`

if [ ! -e $FILE.png ]; then
  echo $FILE.png does not exist
  exit 1;
fi

convert $FILE.png $FILE.pnm
potrace -s -o $FILE.svg $FILE.pnm
rm $FILE.pnm