#!/bin/sh
#распаковка сжатых сообщений MS Outlook формата *.msg
#el guahiro 79201111365@yandex.ru
#должны быть установлены (устанавливаются из репозиториев): msgconvert, uudeview, unoconv, lynx
IFS=$'\n'
for i in "$@"
do mkdir ./"$i"_
mv "$i" "$i"_
cd "$i"_
msgconvert "$i"
mhonarc -single *.eml> "$i".html
find . -type f -not -name "*.eml" -and ! -name "*.html" -delete
uudeview -i "$(basename --suffix=msg "$i")"eml
rm "$i"
rm "$(basename --suffix=msg "$i")"eml
unoconv --format=html UNKNOWN.001
cat "$(basename --suffix=msg "$i")"msg.html UNKNOWN.html > e-mail_"$(basename --suffix=msg "$i")"html
rm UNKNOWN.html UNKNOWN.001 "$(basename --suffix=msg "$i")"msg.html
#lynx --dump e-mail_"$(basename --suffix=msg "$i")"html > e-mail_"$(basename --suffix=msg "$i")"txt
#sed -i -e "/^\s*$/d" -e "s/ */ /g" -e '/^[[:space:]]*$/d' e-mail_"$(basename --suffix=msg "$i")"txt
#rm e-mail_"$(basename --suffix=msg "$i")"html
#unoconv --format=docx e-mail_"$(basename --suffix=msg "$i")"txt
#rm e-mail_"$(basename --suffix=msg "$i")"txt
done
