#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in "$@"  ; do
#Грязный с точками - 30% и 4, почти чистый 60% и 5. 
threshold=`zenity --entry --title="Порог" --text=" 30 сильно грязный, 60 чуть-чуть" --entry-text="60"`
areathreshold=`zenity --entry --title="Порог площади" --text="4 сильно грязный, 5 чуть-чуть" --entry-text="5"`
connectedcomponents=`zenity --entry --title="ХЗ что это, но можете поменять" --text="4 по умолчанию" --entry-text="4"`
convert "$f" \( +clone -threshold "$threshold"% -negate -type bilevel -define connected-components:area-threshold="$areathreshold" -define connected-components:mean-color=true -connected-components "$connectedcomponents" \) -alpha off -compose copy_opacity -composite -compose over -background white -flatten  cleaned_"$f" ; done