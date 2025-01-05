#!/bin/bash
#from https://unix.stackexchange.com/questions/3037/is-there-an-easy-way-to-replace-duplicate-files-with-hardlinks
find "$PWD" -type f -exec md5sum {} \; | sort > /tmp/sums-sorted.txt
OLDSUM=""
IFS=$'\n'
for i in `cat /tmp/sums-sorted.txt`; do
 NEWSUM=`echo "$i" | sed 's/ .*//'`
 NEWFILE=`echo "$i" | sed 's/^[^ ]* *//'`
 if [ "$OLDSUM" == "$NEWSUM" ]; then
  echo ln -f "$OLDFILE" "$NEWFILE"
 else
  OLDSUM="$NEWSUM"
  OLDFILE="$NEWFILE"
 fi
done