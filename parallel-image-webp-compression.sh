#!/bin/bash

#this script needs imagemagick identify to fetch images dimensions, create a white background and composite on it
# images those are smaller than N pixels
#then, it needs cwebp installed to compress images larger than N pixels


repairandcompress()
{
	INPATH=${1%\/}
	DIM=$2
	OUTPATH=${3%\/}
	FILE=$4

	shopt -s nullglob extglob nocaseglob

	FILENAME=`basename -- "$FILE"`
	IMG=`identify "$FILE" 2>/dev/null`
	WIDTH=`expr "$IMG" : '.*\s[0-9]\{2,4\}x[0-9]\{2,4\}\s\([0-9]\{2,4\}\)x.*'`
	HEIGHT=`expr "$IMG" : '.*x\([0-9]\{2,4\}\)\s'`

	if [ "$WIDTH" -lt "$DIM" ] && [ "$HEIGHT" -lt "$DIM" ] ; then
	composite -gravity center "$FILE" "$INPATH"/canvas.jpg "$OUTPATH"/"$FILENAME"
	elif [ "$WIDTH" -gt "$DIM" ] ; then
	cwebp -q 80 -mt -quiet "$FILE" -o "$OUTPATH"/${FILENAME%${FILENAME##*'.'}}webp
	fi

}
export -f repairandcompress


INPATH=${1%\/}
OUTPATH=${2%\/}

mkdir -p "$OUTPATH"

if [ -d "$INPATH" ] ; then cd "$INPATH" ; else exit 118 ; fi

convert -size 550x550 xc:white canvas.jpg

find . -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" | parallel --no-notice -I% --max-args 1 repairandcompress "$INPATH" 550 "$OUTPATH" %

cd "$OUTPATH"

find . -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" | parallel --no-notice -I% --max-args 1 tar --append --file="$OUTPATH"/canvas.tar.gz %
find . -name "*.webp" | parallel --no-notice -I% --max-args 1 tar --append --file="$OUTPATH"/webp.tar.gz %

find . -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" | parallel --no-notice -I% --max-args 1 rm %
find . -name "*.webp" | parallel --no-notice -I% --max-args 1 rm %