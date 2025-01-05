#!/bin/bash
#from https://www.linux.org.ru/forum/desktop/15406056
link="$(xclip -selection c -o)"
/usr/bin/mpv --really-quiet --force-window -- $link
play_status=$?
if [ $play_status -ne 0 ]; then
    msg='Ошибка открытия '$link
    notify-send 'ЧТО-ТО ПОШЛО НЕ ТАК' "$(echo $msg)" --icon=dialog-information
fi