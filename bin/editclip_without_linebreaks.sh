#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
xsel -b -o | tr -s "\r\n" " " | xsel -ib  ; notify-send "В одну строку"
#tr -s &quot;\r\n&quot; &quot; &quot;|xsel -ib

#берём буфер обмена и передаем дальше
 #удаляем перевод строки и передаем дальше
 # возвращаем текст в буфер обмена
 # всплывает уведомление, что всё получилось
 #повесил на CTRL+Ю
 #Как альтернатива : sed ':a;N;$!ba;s/\n/ /g'
 #Как альтернатива : tr -s "\r\n" " "