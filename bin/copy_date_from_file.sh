#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#transfers the creation date from a photo with an optimized *.webp file
IFS=$'\#'
for f in "$@"; do touch -r "$f" "${f%.*}".webp ;  done