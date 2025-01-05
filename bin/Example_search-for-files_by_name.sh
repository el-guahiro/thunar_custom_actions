#!/bin/bash
#fulltext search-for-files by el guahiro

# измените эту цифру по своему усмотрению - zenity умирает примерно на 1000 результате
maxresults=500

# этот сценарий будет работать в любой среде, в которой есть bash и zenity, поэтому файловый менеджер полностью зависит от вас! вы можете добавить в строку дополнительные аргументы, если последний аргумент - это путь к папке, которую вы открываете

filemanager="thunar"

window_title="Полнотекстовый поиск"

fragment=`zenity --entry --title="$window_title - Слово для поиска:" --text="Search strings less than 2 characters are ignored"`
if ! [ ${#fragment} -lt 2 ] ; then

(

echo 10
O=$IFS IFS=$'\n' files=( `find . -iname "*$fragment*" -printf \"%Y\"\ \"%f\"\ \"%k\ KB\"\ \"%t\"\ \"%h\"\\\n | head -n $maxresults` ) IFS=$O
echo 100

selected=`eval zenity --list --title=\"${#files[@]} Files Found - $window_title\"  --width="900" --height="1049"  --text=\"Результаты поиска:\" --print-column=5 --column \"Тип\" --column \"Имя файла\" --column \"Размер\" --column \"Дата\" --column \"Путь\" ${files[@]}`
if [ -e "$selected" ] ; then xdg-open "$selected" ; fi

) | zenity --progress --auto-close --pulsate --title="Ищу..." --text="Поиск в  \"$fragment\""

fi

fi

exit