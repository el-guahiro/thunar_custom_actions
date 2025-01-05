#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\n'
for i in "$@";
do attr=`zenity --entry --title="добавить скрытую заметку к файлу" --text="Введите текст заметки, например" --entry-text="от Иванова $(date +%x) "`
setfattr -n user.info -v $attr "$i"
notify-send "Описание добавлено"
done