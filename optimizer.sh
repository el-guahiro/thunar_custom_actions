#!/bin/bash
find ~/ -size +100k -type f -print0 | \
while read -d '' FILE; do
 abs_file_name=$(readlink -f "$FILE")
 headfile=`head -c 15 "file_name"`;
 if [ "$headfile" = "SQLite format 3" ]; then
 file_size_do=`du -b "$abs_file_name"|cut -f1`;
 sqlite3 "$abs_file_name" "VACUUM; REINDEX;" > /dev/null 2>&1
 file_size_posle=`du -b "$abs_file_name"|cut -f1`;
 echo "$abs_file_name";
 echo "Размер ДО $file_size_do";
 echo "Размер ПОСЛЕ $file_size_posle";
 echo -n "Процент "
 echo "scale=2; ($file_size_posle/$file_size_do)*100"|bc -l
 fi
done
sleep 2
exit 0
echo "Старт Создание кэша иконок и шрифтов"
# обновление кэша иконок в своей папке
for d in ~/.icons/*; do gtk-update-icon-cache -f $d; done
# обновление кэша иконок в системе
for d in /usr/share/icons/*; do sudo gtk-update-icon-cache -f $d; done
# обновление кэша шрифтов
sudo fc-cache -fv
fc-cache ~/.fonts
echo "Окончание Создания кэша иконок и шрифтов"