#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
OPTION1=$(zenity --list --radiolist  --width 400 --height 300\
       --title="ИСПРАВИТЬ ПАНОРАМУ" \
       --text="Выберите тип панорамы" \
       --column="Отметка выбора" --column="тип панорамы" \
       TRUE "ландшафт, экстремальная линза" FALSE "квартал" FALSE "средняя"  FALSE "широкая" FALSE "очень широкая"  FALSE "рыбий глаз" )
if [ "$OPTION1" = "ландшафт, экстремальная линза"   ] ; then OPTION=landscape.sh ;
	else  OPTION=quarter.sh ; fi
if [ "$OPTION1" = "средняя"   ] ; then OPTION=medium_width_pano.sh ; fi
if [ "$OPTION1" = "широкая"   ] ; then OPTION=wide_pano.sh ; fi
if [ "$OPTION1" = "очень широкая"   ] ; then OPTION=very_wide_pano.sh ; fi
if [ "$OPTION1" = "рыбий глаз"   ] ; then OPTION=lens_pano.sh ; fi
for i in "$@" ; do
	"$OPTION" "$i" ; done 
 exit
                 fi)