#!/bin/bash

# создать временный файл
tmp="$(mktemp)"
 # скопировать содержимое клипбоарда в созданный файл
xclip -sel clip -o > "$tmp"
# открыть файл в нужном редакторе
mousepad "$tmp"
# скопировать содержимое файла обратно в клипбоард
cat "$tmp" | xclip -sel clip
# удалить временный файл
rm "$tmp"
# спасибо автору скрипта https://habrahabr.ru/users/asmolianinov/ 