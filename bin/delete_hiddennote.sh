#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for i in "$@"
do setfattr -x user.info "$i"; notify-send 'Описание удалено'
done