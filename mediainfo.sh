#!/bin/sh
mediainfo "$1" | zenity --title=Mediainfo --width 1200 --height 800 --font='Terminus Re33' --text-info

