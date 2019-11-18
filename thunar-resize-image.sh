#!/bin/bash

# paths, constants, etc.
PICPATH="$1"
TOTALPICS="$((($# - 1)))"
STEP="$(((100 / $TOTALPICS)))"
PROGR=0
MINSIZE=12
MAXSIZE=2048

# Check if ImageMagick commands are found
for command in convert identify
do
    if [ ! $(which $command) ]
    then
        zenity --error --text "Could not find \"$command\" application.\n
Make sure ImageMagick is installed and \"$command\" is executable."
        exit 1
    fi
done


# Enter new width (12px-2048px) and check it - aspect ratio will be maintained...
SIZE=""
while [ -z "$SIZE" ]; do
    SIZE="$(zenity --entry --title="Picture Resize" --text="Enter maximum width...")"

    # exit if cancel pressed
    [[ $? != 0 ]] && exit 0

    # check range
    if [[ $SIZE -lt $MINSIZE ]] || [[ $SIZE -gt $MAXSIZE ]]; then
        zenity --error --text="$SIZE"px" is outside the accepted range: 12px - 2048px!"
        SIZE=""
    fi
done

# convert pics
while (( $# )); do
    convert "$PICPATH/$1" -resize "$SIZE" -quality 95 -interlace line "$SIZE"px"$1"
    ((PROGR+=$STEP))
    echo $PROGR
    shift
   
#show progress bar
done | zenity --progress --title="Picture Resize" --text="working..." --percentage=0 --auto-close

# check return value and print message depending on it
[[ $? == 0 ]] && zenity --info --title="Picture Resize" --text="All done!" || zenity -
       -error --text="Canceled!" 