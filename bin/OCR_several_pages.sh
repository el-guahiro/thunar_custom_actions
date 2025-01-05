#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
firtspage=`zenity --entry --title="Первая распознанная страница" --text="По умолчанию один (поставить пробел) или номер" --entry-text=" "`
lastpage=`zenity --entry --title="Последняя распознанная страница" --text="По умолчанию последняя (поставить пробел) или номер" --entry-text=" "`
for i in "$@" ; do pdfsandwich -first_page $firtspage -last_page $lastpage -lang  rus+eng -rgb -o распознаны_стр."$firtspage"-"$lastpage"_"$i" "$i"; done