#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
OPTION1=$(zenity --list --radiolist  --width 400 --height 400\
       --title="PDF конвертируем в DOCX" \
       --text="Выберите способ" \
       --column="Отметка выбора" --column="способ" \
       TRUE "PDF с картинками и таблицами" FALSE "OCR_PDF просто абзацы" FALSE "TEXT_PDF письмо или с колонками")
if [ "$OPTION1" = "PDF с картинками и таблицами"  ] ; then OPTION=pdf2formatted_docx-thunar.sh;
else  OPTION=ocredpdf2docx-thunar.sh; fi
if [ "$OPTION1" = "TEXT_PDF письмо или с колонками"   ] ; then OPTION=textpdf2docx-thunar.sh; fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)
