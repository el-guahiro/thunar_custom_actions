#!/bin/sh
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
for dir in * do					# join MP4 per subdir
	txt="$dir.txt"; gfind $dir/*.mp4 -fprintf $txt "file '%p'\\n"
	ffmpeg -f concat -safe 0 -i $txt -c copy $dir.mp4; rm -v $txt
done

# ffmpeg -f concat -safe 0 -i <(printf "file '$PWD/%s'\n" ./*.mp4) -c copy output.mp4