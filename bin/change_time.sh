#! /bin/bash
#https://unix.stackexchange.com/questions/86674/how-can-i-change-the-date-modified-of-a-folder-to-the-last-changed-file-inside
# Change mtime of directories to that of latest file (or dir) under it, recursively
# Empty leaf directories, or dirs with only symlinks get the $default_timestamp

default_timestamp='1980-01-01 00:00:00'

dir="$1"

[ -d "$dir" ] || { echo "Usage: $0 directory" >&2; exit 1; }

find "$dir" -depth -type d | while read d; do
    latest=$(find "$d" -mindepth 1 -maxdepth 1 \( -type f -o -type d \) -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-)
    if [ -n "$latest" ]; then
        touch -c -m -r "$latest" "$d" \
            || echo "ERROR setting mtime of '$d' using ref='$latest'" >&2
    else
        touch -c -m -d "$default_timestamp" "$d" \
            || echo "ERROR setting mtime of '$d' to default '$default_timestamp'" >&2
    fi
done