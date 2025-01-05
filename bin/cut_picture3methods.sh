#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
OPTION1=$(zenity --list --radiolist  --width 900 --height 300\
       --title="картинку на 2,3,4 части" \
       --text="Выберите, как режем" \
       --column="Отметка выбора" --column="Направление реза" \
       TRUE "горизонтальное" FALSE "вертикальное на 3 части"  FALSE "вертикальное на 2 или 4 части" FALSE "выйти из программы")
if [ "$OPTION1" = "горизонтальное"  ] ; then OPTION=cut-horiz.sh;
	else  OPTION=split_mage_into_3_parts.sh; fi
if [ "$OPTION1" = "вертикальное на 2 или 4 части"   ] ; then OPTION=cut-vert.sh; fi
if [ "$OPTION1" = "выйти из программы" ] ; then   OPTION=0 ;  fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)