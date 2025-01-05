#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
OPTION1=$(zenity --list --radiolist  --width 400 --height 400\
       --title="Операции с тэгами" \
       --text="Выберите способ" \
       --column="Отметка выбора" --column="действие" \
       TRUE "Добавить описание к файлу" FALSE "Удалить описание к файлу" FALSE "Показать описание к файлу"  FALSE "Выполнить тэг")
if [ "$OPTION1" = "Добавить описание к файлу"  ] ; then OPTION=add_hiddennote2file.sh;
	else  OPTION=delete_hiddennote.sh; fi
if [ "$OPTION1" = "Показать описание к файлу"   ] ; then OPTION=view_hiddennote.sh; fi
if [ "$OPTION1" = "Выполнить тэг"   ] ; then OPTION=execute_tag.sh; fi

myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)
