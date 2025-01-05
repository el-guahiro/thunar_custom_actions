#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
xclip -o | sed -e 's/[^[:print:]]//' | sed -re 's/\xC2\xA0/ /g' | sed -re 's/^[  \t]*|[ \t]*$//' | sed -e '$d' | sed -re 's/  */ /g' | sed -re '/^\s*$/d' | sed -re -z 's/[.]\n|[;]\n|[:]\n|[?]\n|[!]\n/&♫/g' | sed -re 's/^[0-9]|^[а-я]\)|^[-] /♫&/g' | sed -re -z 's/\n/ /g' | sed -re -z 's/♫/\n/g' | sed -re '/^\s*$/d' | sed -re 's/^[  \t]*//;s/[ \t]*$//' | sed -re  's/[0-9]$|[0-9]\.$/&♫/g' | sed -re -z 's/♫\n|♫\r/ /g' | sed -e 's/--|—/-/gi' | sed -e 's/  */ /gi'| xclip -selection clipboard; notify-send "исправили буфер обмена" 
