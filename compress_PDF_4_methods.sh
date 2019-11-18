#!/bin/bash
OPTION1=$(zenity --list --radiolist  --width 700 --height 300\
       --title="СЖИМАЕМ PDF ФАЙЛ" \
       --text="Выберите способ" \
       --column="Отметка выбора" --column="способ сжатия" \
       TRUE "Универсальный, быстро, без потерь качества" FALSE "Медленнее, сильнее сжатие, без потерь качества" FALSE "Чуть быстрее, сильное сжатие, чуть хуже качество"  FALSE "Медленнее, очень сильное сжатие, заметная потеря качества")
if [ "$OPTION1" = "Универсальный, быстро, без потерь качества"  ] ; then OPTION=compress-pdf-standart.sh;
	else  OPTION=compress-pdf-experimental1.sh; fi
if [ "$OPTION1" = "Чуть быстрее, сильное сжатие, чуть хуже качество"   ] ; then OPTION=compress-pdf-experimental.sh; fi
if [ "$OPTION1" = "Медленнее, очень сильное сжатие, заметная потеря качества"   ] ; then OPTION=compress-pdf-experimental2.sh; fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)