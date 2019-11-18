#!/bin/bash
echo
for folder
do
gvfs-set-attribute -t stringv "${FOLDER}" metadata::emblems /home/user/.local/share/icons/elementary-xfce/emblems/22/emblem.png
done