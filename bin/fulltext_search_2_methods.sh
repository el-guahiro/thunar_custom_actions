#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
OPTION1=$(zenity --list --radiolist  --width 400 --height 450\
       --title="ПОЛНОТЕКСТОВЫЙ ПОИСК" \
       --text="Ищем в таблицах?" \
       --column="Отметка выбора" --column="ДА или НЕТ" \
       TRUE "ДА" FALSE "НЕТ"  )
if [ "$OPTION1" = "ДА"   ] ; then OPTION=fulltext_search_pro2.sh ;
	else  OPTION=fulltext_search_pro2_onlytext.sh ; fi
	xfce4-terminal -H -e  "bash -c "$OPTION""
