#!/bin/sh
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\n'
for i in "$@" ; do mogrify -resize 70% "$i" ; done