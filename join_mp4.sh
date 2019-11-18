#!/bin/bash
filesList=""
for file in $(ls *.mp4|sort -n);do
    filesList="$filesList -cat $file"
done
MP4Box $filesList -new merged_files_$(date +%Y%m%d_%H%M%S).mp4