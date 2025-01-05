#!/bin/bash
while true
 do
   if FN=`inotifywait -e close_write,moved_to --format %f .`
   then
find ./ -type d -exec cp  -nu folder.jpg {} \;
find ./ -type d -exec cp  -nu .hidden {} \;
   fi
 done