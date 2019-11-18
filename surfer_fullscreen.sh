#!/bin/bash
for i in "$@" ; do surfer "$i" ; done &
sleep 0.3
#системная  горизонтальная панель в пикселях:
TOPMARGIN=34
#вертикальная панель в пикселях:
RIGHTMARGIN=0
# определим ширину и высоту экрана ноута:
SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')
#ЕСЛИ ХОТИМ В ПОЛ-ОКНА, раскомментируем команды ниже:
# если располагать окно в правой половине:
#W=$(( $SCREEN_WIDTH / 2 - $RIGHTMARGIN ))
#H=$(( $SCREEN_HEIGHT - 2 * $TOPMARGIN ))
# X меняет лево и право:
# сдвинем окон в правую часть экрана:
#X=$(( $SCREEN_WIDTH / 2 ))
# сдвинем окно в левую часть экрана::
X=0; 
Y=$TOPMARGIN
#ЕСЛИ ХОТИМ В ВО ВСЁ ОКНО:
W=$(( $SCREEN_WIDTH - $RIGHTMARGIN ))
H=$(( $SCREEN_HEIGHT -2*$TOPMARGIN ))

wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H