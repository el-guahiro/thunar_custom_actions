#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
theme=$(zenity --list --radiolist  --width 600 --height 650\
       --title="Сменить звуковую тему" \
       --text="Выберите тему" \
       --column="Отметка выбора" --column="тема" \
       TRUE "Smooth" FALSE "Fresh" FALSE "muchcacha_sight"  FALSE "Enchanted" FALSE "freedesktop" FALSE "muchcacha_light" FALSE "muchcacha_night" FALSE "выйти из программы")
if [ "$theme" = "Smooth"  ] ; then THEME=Smooth;fi
if [ "$theme" = "Fresh"  ] ; then THEME=Fresh;fi
if [ "$theme" = "muchcacha_sight"  ] ; then THEME=muchcacha_sight;fi
if [ "$theme" = "Enchanted"  ] ; then THEME=Enchanted;fi
if [ "$theme" = "freedesktop"  ] ; then THEME=Default;fi
if [ "$theme" = "muchcacha_light"   ] ; then THEME=muchcacha_light; fi
if [ "$theme" = "muchcacha_night"   ] ; then THEME=muchcacha_night;fi
if [ "$theme" = "выйти из программы" ] ; then   THEME=0; fi
xfconf-query -c xsettings -p /Net/SoundThemeName -s "$THEME"
