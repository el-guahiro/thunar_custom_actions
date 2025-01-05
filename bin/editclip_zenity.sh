#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#преобразование текста в буфере обмена

# создать временный файл
tmp="$(mktemp)"
 # скопировать содержимое клипбоарда в созданный файл
xclip -sel clip -o > "$tmp"
# tmp файл преобразуем через sed
command=`zenity --entry --title="Команда" --text="Напишите сюда команду или поставьте пробел,чтобы выйти" --entry-text="sed -i 's/\w/\L&/'"`; bash -c "$command "$tmp""
# скопировать содержимое файла обратно в клипбоард
cat "$tmp" | xclip -sel clip
# удалить временный файл
rm "$tmp"
# спасибо автору скрипта https://habrahabr.ru/users/asmolianinov/ 
