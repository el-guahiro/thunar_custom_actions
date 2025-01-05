#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
ratio=`zenity --entry --title="ImageMagick-quality" --text="Введите процент сжатия" --entry-text="80"`;if [ $? = 0 ];then for file in %F;do convert "$file" -quality $ratio "$file";done;fi