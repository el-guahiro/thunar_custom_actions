#!/bin/bash
#берёт дату с названия фото
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3) 
#пояснение тут https://forum.xubuntu-ru.net/index.php?msg=12501
IFS=$'\#'
for i in "$@" ; do  touch -t $(echo ${i::-7} | tr -cd '[[:digit:]]') $i ; done #for *.webp
for i in "$@" ; do  touch -t $(echo ${i::-6} | tr -cd '[[:digit:]]') $i ; done  #for *.jpg or *.png
