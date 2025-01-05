#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\n'
baspath="$(readlink -f "${1}")"
thunar "$baspath"
disown -h %1  
bg 1