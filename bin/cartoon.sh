#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do cartoon -e 0 "$i" cartoon_"$i" ; done
#Опции можно менять, см.http://www.fmwconcepts.com/imagemagick/cartoon/index.php
