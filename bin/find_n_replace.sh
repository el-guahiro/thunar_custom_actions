#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#один из трёх таких зкриптов. Сейчас использую find_n_replace2.sh
IFS=$'\#'
a=$(zenity --entry --text "Какое выражение заменить");
b=$(zenity --entry --text "На какое выражение заменить");   
find . -type f -print0 | xargs -0 rename "s/$a/$b/gi" {} \;
find ./ -type d -print0 | xargs -0 rename "s/$a/$b/gi" {} \;