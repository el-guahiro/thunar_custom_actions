#!/bin/bash -v
#Created by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#This script performs a recursive search for the contents of files in all popular office formats.
#to speed up the script, don't search in search in PDF annotations
/bin/echo -e "\n
Поиск слова во всех файлах этой папки, введите запрос \n
Результаты поиска по введенному далее запросу \n"
/bin/echo -e "\033[1m\033[38;5;11m"Чтобы открыть найденный файл, выдели название этого файла и закрой терминал"\033[0m"


/bin/echo -e "\033[37;1;41m  "СЛОВО:" \033[0m" 
read response

find . -print | file -if - | grep html | awk -F: '{print $1}'| 
while read i ; do lynx -stdin -dump < "$i"| 
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -iname "*.doc" | 
while read i ; do catdoc "$i" |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -iname "*.docx" | 
while read i ; do docx2txt < "$i" |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -iname "*.xls" | 
while read i ; do ssconvert "$i" "$i".csv; cat "$i".csv |  tr '.' '\n' |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; rm "$i".csv ; done

find . -iname "*.xlsx" | 
while read i ;  do ssconvert "$i" "$i".csv; cat "$i".csv  |  tr '.' '\n' |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ;  rm "$i".csv ; done

find . -iname "*.pdf" | 
while read i ; do pdftotext -q -layout "$i" - | less |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -iname "*.odt" | 
while read i ; do odt2txt "$i" |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -iname "*.odp" | 
while read i ; do odt2txt "$i" |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -iname "*.ods" | 
while read i ;  do ssconvert "$i" "$i".csv; cat "$i".csv  |  tr '.' '\n' |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ;  rm "$i".csv ; done

find . -iname "*.rtf" | 
while read i ; do catdoc "$i" |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -iname "*.pptx" | 
while read i ; do pptx2txt.sh "$i" |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -iname "*.csv" | 
while read i ; do cat "$i" | tr '.' '\n' |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -iname "*.djvu" | 
while read i ; do djvutxt "$i" |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done

find . -print | file -if - | grep text | awk -F: '{print $1}'| 
while read i ; do cat "$i" |
rg -i -C 2 "$response" && /bin/echo -e "\033[37;1;41m  "$(realpath "$i")"\033[0m" ; done


/bin/echo -e "\033[1m\033[38;5;11m "Время поиска $SECONDS секунд"\033[0m"
