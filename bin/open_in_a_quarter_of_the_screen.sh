#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
WIDTH=`xdpyinfo | grep 'dimensions:' | cut -f 2 -d ':' | cut -f 1 -d 'x'`
HEIGHT=`xdpyinfo | grep 'dimensions:' | cut -f 2 -d ':' | cut -f 2 -d 'x' | cut -f 1 -d ' '`
OFFSET=10       #CHANGE THIS
HALFWIDTH=$(($WIDTH/2))
HALFHEIGHT=$(($HEIGHT/2-$OFFSET))
wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
#TOP RIGHT
wmctrl -r :ACTIVE: -e 0,$HALFWIDTH,0,$HALFWIDTH,$HALFHEIGHT

#TOP LEFT
#wmctrl -r :ACTIVE: -e 0,0,0,$HALFWIDTH,$HALFHEIGHT

#BOTTOM LEFT
#wmctrl -r :ACTIVE: -e 0,0,$HALFHEIGHT,$HALFWIDTH,$HALFHEIGHT

#BOTTOM RIGHT
#wmctrl -r :ACTIVE: -e 0,$HALFWIDTH,$HALFHEIGHT,$HALFWIDTH,$HALFHEIGHT
