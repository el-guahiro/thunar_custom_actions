#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
OPTION1=$(zenity --list --radiolist  --width 400 --height 500\
       --title="ИСПРАВИТЬ ТЕКСТОВЫЙ СКАН" \
       --text="Выберите способ" \
       --column="Отметка выбора" --column="чёткость" \
       TRUE "Просто чётче" FALSE "Чётче, потолще линии" FALSE "Чётче, ещё толще линии"  FALSE "Для слепых сканов" FALSE "БЕЛЫЙ ФОН"  FALSE "выйти из программы")
if [ "$OPTION1" = "Просто чётче"  ] ; then OPTION=light_pdf0.sh;
	else  OPTION=light_pdf1.sh; fi
if [ "$OPTION1" = "Чётче, ещё толще линии"   ] ; then OPTION=light_pdf2.sh; fi
if [ "$OPTION1" = "Для слепых сканов"   ] ; then OPTION=light_pdf3.sh; fi
if [ "$OPTION1" = "БЕЛЫЙ ФОН"   ] ; then OPTION=white_background_PDF.sh; fi
if [ "$OPTION1" = "выйти из программы" ] ; then   OPTION=0 ;  rm -rvf ./backup;   fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)
