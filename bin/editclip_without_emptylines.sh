#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
xclip -o | rg -N "\S" | xclip -selection clipboard ; notify-send "буфер обмена БЕЗ пустых строк!!"
#преобразовывает содержимое буфера обмена , удаляя пустые строки
#Посадил на CTRL+Б