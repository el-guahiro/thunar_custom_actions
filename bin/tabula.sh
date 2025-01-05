#!/bin/bash
#For Thurnar custom actions by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#https://tabula.technology/
#Таблица из PDF в XLS, с GUI
java -Dfile.encoding=utf-8 -Xms256M -Xmx1024M -jar ~/tabula/tabula.jar | zenity --progress --width=400 --height=100 --title="Открытие программы" --text "Tabula загружается" --auto-close --pulsate; exo-open --launch WebBrowser http://127.0.0.1:8080
