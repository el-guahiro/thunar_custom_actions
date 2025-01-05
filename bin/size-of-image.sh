#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#Изменить разрешение изображений
width=`zenity --entry --title="ImageMagick-resize" --text="Введите ширину в пикселях" --entry-text="800"`;if [ $? = 0 ];then for file in "$@";do mogrify -resize $width "$file"; done
      exit
                 fi)