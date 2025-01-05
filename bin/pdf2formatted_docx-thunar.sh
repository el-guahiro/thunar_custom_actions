#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
for i in "$@";
do
pdf2docx convert "$i" "текст_${i%.*}.docx" multi_processing=True 
	done
