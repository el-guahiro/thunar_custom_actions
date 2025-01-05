#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#This script takes geolocation data from the exif metadata of the photo and automatically opens the place on Google Maps where this photo was taken
IFS=$'\#'
for f in "$@" ; do
coords=$(exiftool "$f" | grep Latitude | grep deg | cut -d : -f 2 | sed -e 's/deg/°/g' -e 's/ //g')$(exiftool "$f" | grep Longitude | grep deg | cut -d : -f 2 | sed -e 's/deg/°/g' -e 's/ //g')
done
[[ -z "$coords" ]] && { notify-send  "Нет координат!" ; mpv /usr/share/sounds/purple/alert.wav ; exit 2; }
 notify-send "Готово!"
sensible-browser https://www.google.com/maps/place/$coords 
