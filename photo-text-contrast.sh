#!/bin/bash
OPTION1=$(zenity --list --radiolist  --width 500 --height 200\
       --title="Делаем читаемо фото текста. СДЕЛАТЬ БЭКАП !!!" \
       --text="Выберите способ" \
       --column="Отметка выбора" --column="мутность текста" \
       TRUE "средне мутное, строго НЕ СО СКАНА" FALSE "очень мутное фото (скан) или есть фон")
#средне мутное, не для сканов="fast-resize-pdf.sh"
#очень мутное и есть фон="light-picture.sh"
if [ "$OPTION1" = "средне мутное, строго НЕ СО СКАНА" ] ; then OPTION=light-picture-experimental.sh;
	else  OPTION=light-picture.sh ; fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION" "$i" ; done 
 exit
                 fi)