#!/bin/bash

OPTION1=$(zenity --list --radiolist \
       --title="Повернуть PDF на 90°" \
       --text="-по или -против часовой стрелки" \
       --column="отметка выбора" --column="направление" \
       TRUE "по часовой" FALSE "против часовой")
#по часовой="rotate-right.sh"
#против часовой="rotate-left.sh"
if [ "$OPTION1" = "по часовой" ] ; then OPTION=270;
	else  OPTION=90 ; fi
myArray=( "$@" )
for i in "$@"; do
	pdfjam --outfile "$i" --angle "$OPTION" --fitpaper true --rotateoversize true "$i" ; done 
 exit
                 fi)