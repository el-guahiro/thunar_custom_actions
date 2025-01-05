#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#абсолютный путь симлинка
IFS=$'\n'
for i in "$@";
do readlink -e "$i" 
#do readlink -f "$i" 
done
