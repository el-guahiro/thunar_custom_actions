#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#один из трёх таких зкриптов. Сейчас использую find_n_replace2.sh
IFS=$'\#'
#shopt -s globstar  в оболочке фалового менеджера не работает
a=$(zenity --entry --text "Какое выражение заменить");
b=$(zenity --entry --text "На какое выражение заменить");   
for i in "$@" ; do rename "s/$a/$b/gi" "$i" ; done
