#!/bin/bash
# спасибо автору скрипта https://habrahabr.ru/users/asmolianinov/ 
#improves clipboard handling in gtk applications
# создать временный файл
tmp="$(mktemp)"
 # скопировать содержимое клипбоарда в созданный файл
xclip -sel clip -o > "$tmp"
# открыть файл в нужном редакторе
cat "$tmp" | xclip -sel clip
# удалить временный файл
rm "$tmp"
