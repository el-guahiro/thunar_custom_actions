#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#Штамп "К производству работ" в файле ~/Изображения/Штампы К ПРОИЗВОДСТВУ РАБОТ/stamp.png (прозрачном)
#Предварительно создать папку ~/Изображения/Штампы К ПРОИЗВОДСТВУ РАБОТ и файл stamp.png
IFS=$'\#'
for f in $@; do  pdftoppm -jpeg "$f" /tmp/1 ; 
done
for i in /tmp/1*.jpg ; do convert "$i" -gravity SouthEast ~/Изображения/Штампы\ К\ ПРОИЗВОДСТВУ\ РАБОТ/stamp.png -composite "$i" ;
done
 convert  /tmp/1*.jpg  "$f"
 rm /tmp/1*.jpg