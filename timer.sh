#!/bin/bash
timer=`zenity --entry --title="ТАЙМЕР" --text="сингал через.... минут, например" --entry-text="10"`; echo "mpv /home/user/Музыка/Звуки_уведомлений/alarm_clock_труба.mp3" | at now + $timer min
