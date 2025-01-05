#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
shopt -s globstar
a=$(zenity --entry --text "Какое слово заменить");
b=$(zenity --entry --text "На какое слово заменить"); 
rename "s/$a/$b/gi" ./**/*
rename "s/$a/$b/gi" ./**/*
rename "s/$a/$b/gi" ./**/*