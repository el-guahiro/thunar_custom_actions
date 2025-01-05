#!/bin/sh
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#распаковка сжатых сообщений MS Outlook формата *.msg
#должны быть установлены (устанавливаются из репозиториев): msgconvert, uudeview, unoconv, lynx
#Этот скрипт устарел, сейчас всё реализовано на базе одной утилиты: msg2txt
IFS=$'\n'
for i in "$@"
do mkdir ./"$i"_
mv "$i" "$i"_
cd "$i"_
msgconvert "$i"
mhonarc -single *.eml> "$i".html
find . -type f -not -name "*.eml" -and ! -name "*.html" -delete
mu extract "$(abspath "$(basename --suffix=msg "$i")"eml)" --save-all
cat "$(basename --suffix=msg "$i")"msg.html 1.msgpart > e-mail_"$(basename --suffix=msg "$i")"html
#rm "$i"
rm "$(basename --suffix=msg "$i")"eml
rm "$(basename --suffix=msg "$i")"msg.html
rm *.msgpart
#unoconv --format=txt e-mail*.html
done
