#! /bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
IFS=$'\#'
for f in "$@" ; do
fn=$(basename "$f")
Fn=${fn^}
rename "s/$f/$Fn/gi" ./*
done