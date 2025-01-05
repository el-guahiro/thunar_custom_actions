#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#Объединить все mp4 в папке
filesList=""
for file in $(ls *.mp4|sort -n);do
    filesList="$filesList -cat $file"
done
MP4Box $filesList -new merged_files_$(date +%Y%m%d_%H%M%S).mp4
