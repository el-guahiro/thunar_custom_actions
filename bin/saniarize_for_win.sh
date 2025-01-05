#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3) 
IFS=$'\#'
for i in {0..20} ; do find . -maxdepth $i -mindepth $i -name '*[<>\:\\|?*]*' -o -name '*[ \.]' | rename 's/[\\?*:><|"]*|[ \.?]*$//g' ; done 