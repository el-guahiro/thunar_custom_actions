#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
basedir="$(dirname $(realpath "$0"))"
thunar "$basedir"
disown -h %1  
bg 1