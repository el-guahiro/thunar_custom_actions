#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
# Внимание! Это эксперимент. Потом эмблему не убрать через GUI
IFS=$'\n'
for i in "$@";
do gvfs-set-attribute -t stringv "$i" metadata::emblems $(zenity --file-selection --directory --title="Выбери файл")
done
