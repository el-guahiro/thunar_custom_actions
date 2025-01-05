#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
OPTION1=$(zenity --list --radiolist  --width 400 --height 250\
       --title="ИСПРАВИТЬ ПАНОРАМУ" \
       --text="Выберите тип панорамы" \
       --column="Отметка выбора" --column="тип панорамы" \
       TRUE "ландшафт, линза" FALSE "квартал" FALSE "средняя"  FALSE "широкая" FALSE "очень широкая")
if [ "$OPTION1" = "ландшафт, линза"   ] ; then OPTION=landscape.sh ;
	else  OPTION=quarter.sh ; fi
if [ "$OPTION1" = "средняя"   ] ; then OPTION=medium_width_pano.sh ; fi
if [ "$OPTION1" = "широкая"   ] ; then OPTION=wide_pano.sh ; fi
if [ "$OPTION1" = "очень широкая"   ] ; then OPTION=very_wide_pano.sh ; fi
for i in "$@" ; do
	"$OPTION" "$i" ; done 
 exit
                 fi)