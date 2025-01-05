#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#in the future, I plan to change this script using "zenity -- radiologist" for input and output parameters to change any color to any other
IFS=$'\#'
for i in "$@" ; do convert  "$i" -fuzz 45%% -fill darkblue -opaque '#03060a' "$i".2 ; touch -r "$i" "$i".2 ; mv -v "$i".2 "$i" ; done
