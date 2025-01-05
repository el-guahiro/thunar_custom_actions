#!/bin/bash
#преобразование текста в буфере обмена
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)

# создать временный файл
tmp="$(mktemp)"
 # скопировать содержимое клипбоарда в созданный файл
xclip -sel clip -o > "$tmp"
# tmp файл преобразуем через sed
command=`zenity --entry --title="Команда" --text="Напишите сюда команду или поставьте пробел,чтобы выйти" --entry-text="sed -i 's/[^[:print:]]//' "$tmp"; sed -i -r 's/\xC2\xA0/ /g' "$tmp"; sed -i -r 's/^[  \t]*|[ \t]*$//' "$tmp"; sed -i -r 's/  */ /g' "$tmp"; sed -i -r '/^\s*$/d' "$tmp"; sed -i -r -z 's/[.]\n|[;]\n|[:]\n|[?]\n|[!]\n/&♫/g' "$tmp"; sed -i -r 's/^[0-9]|^[а-я]\)|^[-] /♫&/g' "$tmp"; sed -i -r -z 's/\n/ /g' "$tmp"; sed -i -r -z 's/♫/\n/g' "$tmp"; sed -i -r '/^\s*$/d' "$tmp"; sed -i -r 's/^[  \t]*// "$tmp";s/[ \t]*$//' "$tmp"; sed -i -r  's/[0-9]$|[0-9]\.$/&♫/g' "$tmp"; sed -i -r -z 's/♫\n|♫\r/ /g' "$tmp"; sed -i 's/--|—/-/gi' "$tmp"; sed -i 's/  */ /gi' "$tmp""`; bash -c "$command"
# скопировать содержимое файла обратно в клипбоард
cat "$tmp" | xclip -sel clip
# удалить временный файл
rm "$tmp"
# спасибо автору скрипта https://habrahabr.ru/users/asmolianinov/  
