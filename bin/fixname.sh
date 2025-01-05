#!/bin/sh
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#Исправляет имена файлов
dir=$(dirname "$1")
name=$(basename "$1")

newname=$(echo "$name" | sed -e 's/[^A-Za-z0-9А-Яа-я._-]/_/g')
if [ "$name" != "$newname" ]; then
    if [ ! -e "$newname" ]; then
        mv "$1" "$dir/$newname"
    else
        echo >&2 "$newname already exist for $1"
    fi
fi