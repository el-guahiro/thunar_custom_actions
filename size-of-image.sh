Изменить разрешение изображений
AAA=`zenity --entry --title="ImageMagick-resize" --text="Введите ширину в пикселях" --entry-text="800"`;if [ $? = 0 ];then for file in "$@";do mogrify -resize $AAA "$file"; done
      exit
                 fi)