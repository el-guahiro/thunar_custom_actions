#!/bin/bash
OPTION1=$(zenity --list --radiolist  --width 900 --height 300\
       --title="Во сколько раз сжать видео?" \
       --text="Выберите во сколько раз" \
       --column="во сколько раз" --column="значение" \
       TRUE "в 25 раз" FALSE "в 15 раз" FALSE "в 10 раз"  FALSE "в 5 раз" FALSE "в 3 раза" FALSE "выйти из программы")
if [ "$OPTION1" = "в 25 раз"  ] ; then OPTION=0.23;
	else  OPTION=0.3; fi
if [ "$OPTION1" = "в 10 раз"   ] ; then OPTION=0.355; fi
if [ "$OPTION1" = "в 5 раз"   ] ; then OPTION=0.491; fi
if [ "$OPTION1" = "в 3 раза"   ] ; then OPTION=0.75; fi
if [ "$OPTION1" = "выйти из программы" ] ; then  OPTION="-v 0"; fi
myArray=( "$@" )
for i in "$@"; do
	ffmpeg -i "$i" -vf scale=iw*$OPTION:-1 -codec:a copy compressed_`date +%F_%H-%M`_"$i" ; done 
 exit
                 fi)