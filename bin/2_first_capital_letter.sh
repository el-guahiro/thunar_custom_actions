#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#If you have Bash 4:
IFS=$'\#'
for i in "$@" ; do mv "$i" "${i^}"; done