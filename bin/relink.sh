#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#использование этого скрипта:
#find /home/newusername/ -lname '/home/oldusername/*' -exec relink.sh {} \;
link=$1
# grab the target of the old link
#захватите цель по старой ссылке
target=$(readlink -- "$1")

# replace the first occurrence of oldusername with newusername in the target string
#замените первое вхождение oldusername новым именем пользователя в целевой строке
target=${target/oldusername/newusername}

# Test the link creation
echo ln -s -- "$target" "$link"

# If the above echo shows the correct commands are being issued, then uncomment the following lines and run the command again
#если приведенное выше эхо показывает, что выполняются правильные команды, раскомментируйте следующие строки и снова запустите команду
#rm "$link"
#ln -s "$target" "$link"