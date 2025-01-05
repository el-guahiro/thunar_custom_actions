#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#В терминале: simply_watermark_all_in_folder.sh *
lab=`zenity --entry --title="Добавить водяной знак" --text="Напишите что-то например ОБРАЗЕЦ" --entry-text="ОБРАЗЕЦ"`;
for image in  *.JPG *.jpg *.jpeg *.JPEG *.png *.PNG; do 
  echo "converting $image"; 
  convert "$image" --strip -interlace Plane -gaussian-blur 0.05 -quality 85%  -pointsize 60 -draw \
          "gravity south fill red text 0,12 '$lab' fill grey text 0,7 '$lab' " "$image".2;
  mv "$image".2 "$image" 

done

cd $current