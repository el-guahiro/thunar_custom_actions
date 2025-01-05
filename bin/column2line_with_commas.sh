#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#----------------------------------
# создать временный файл
tmp="$(mktemp)"
 # скопировать содержимое клипбоарда в созданный файл
xclip -sel clip -o > "$tmp"
# колонку - в текст с запятыми
sed -i "s/$/, /g" "$tmp"
cat "$tmp" | tr -d '\r\n' > "$tmp"2
mv "$tmp"2 "$tmp"
sed -i 's/..$//' "$tmp"
# открыть файл в нужном редакторе
mousepad "$tmp"
# скопировать содержимое файла обратно в клипбоард
cat "$tmp" | xclip -sel clip
# удалить временный файл
rm "$tmp"
# на базе скрипта от автора https://habrahabr.ru/users/asmolianinov/ 