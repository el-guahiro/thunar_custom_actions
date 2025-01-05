#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
echo -e "\n
Поиск слова в файле, введите запрос \n
Результаты поиска по введенному далее запросу \n"
echo -e "\033[37;1;41m  "СЛОВО:" \033[0m" 

read response
for i in "$@"; do view3.1.sh "$i" | rg -i -C 2 "$response" && echo -e "\033[37;1;41m  "в файле $(realpath "$i")"\033[0m" ; done

echo -e "\033[1m\033[38;5;11m"Время поиска $SECONDS секунд"\033[0m"
