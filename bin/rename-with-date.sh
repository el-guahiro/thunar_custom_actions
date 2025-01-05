#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
for i in "$@";
do
extension="${i##*.}" 
filename="${i%.*}" 
mv "$i" "${filename} `date +%x`.${extension}"
	done
