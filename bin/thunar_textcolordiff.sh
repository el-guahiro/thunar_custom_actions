#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#Сравнить содержание скриптов или текстовых файлов
IFS=$'\#'
for i in "$@" ; do xfce4-terminal -H -e "colordiff $i | less" ; done
