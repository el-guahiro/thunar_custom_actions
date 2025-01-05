#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
xclip -selection clipboard -o | trans -b :ru -no-ansi -b -l | xclip -selection clipboard ; notify-send  -t 30000 ' ' "`xclip -selection clipboard -o`" ; mpv /usr/share/sounds/muchcacha_night/stereo/message-new-email.ogg