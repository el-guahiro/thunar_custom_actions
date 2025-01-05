#! /bin/bash
#добавляет эффект "картина маслом" к изображениям
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@" ; do convert "$i" -noise 2 -median 3 -unsharp 3 -normalize -write painted_"$i" ; done

