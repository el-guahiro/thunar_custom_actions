#!/bin/bash
#el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#After Google's unfriendly actions against all russians, Gmail is most likely not recommended
IFS=$'\#'
exo-open --launch WebBrowser https://mail.google.com/mail/?view=cm&fs=1&to=someone@example.com&su=SUBJECT&body=BODY&bcc="$1"
