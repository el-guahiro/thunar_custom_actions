#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
ls -ARgoh "$@" | awk '{q += $3} END {print q}'