#!/bin/bash
# By Ferux, 26 June 2016.
# Script for renaming photos and videos based on their date.
# Useful for watching slideshows with the videos at the moment they were shot instead of all at the end.
# Also useful for combining pictures of multiple sources into the correct order.
# For jpg's, the exif date 'taken on' will be used. If that's not found, the date of last change is used.
# For all other files, date of last change is used. Only following extensions are affected: mp4, mpg, png, avi, mov, jpg.

# To use this:
# 1. Put this text in a file named renamephotos
# 2. Make the file executable.
# 3. Put the file in the folder of which you want to rename the files.
# 4. Nautilus: File --> open in terminal.
# 5. In the terminal window, enter the following command: ./renamephotos

# Make the next one 'true' if you always want to add the original filename at the end of the new one.
# Otherwise the script will only do that if 2 files with the same name would be created.
preservefn="false"

for filename in *.*
do
  echo "$filename"
  tmp="$(echo "$filename" | tr '[A-Z]' '[a-z]')"
  case "$filename" in
    20*) 
      echo 'left alone because already starts with 20'
      ;;
    *.mp4|*.MP4)
      doelextensie=".mp4"
      wadissergebeurd="Video, used date of last change."
      newfilename="$(stat -c %y "$filename" | sed -e 's/\................//g' -e 's/-//g' -e 's/://g' -e 's/ /_/g')"
      if [ -a ""$newfilename""$doelextensie"" ] || [ "$preservefn" == "true" ]
      then
        mv -i "$filename" """$newfilename"_"$filename"""
        echo "$wadissergebeurd"
        echo 'Original name added at the end'
      else
        mv -i "$filename" ""$newfilename""$doelextensie""
        echo "$wadissergebeurd"
      fi
      ;;
    *.mpg|*.MPG)
      doelextensie=".mpg"
      wadissergebeurd="Video, used date of last change."
      newfilename="$(stat -c %y "$filename" | sed -e 's/\................//g' -e 's/-//g' -e 's/://g' -e 's/ /_/g')"
      if [ -a ""$newfilename""$doelextensie"" ] || [ "$preservefn" == "true" ]
      then
        mv -i "$filename" """$newfilename""_""$filename"""
        echo "$wadissergebeurd"
        echo 'Original name added at the end'
      else
        mv -i "$filename" ""$newfilename""$doelextensie""
        echo "$wadissergebeurd"
      fi
      ;;
    *.png|*.PNG)
      doelextensie=".png"
      wadissergebeurd="PNG, used date of last change."
      newfilename="$(stat -c %y "$filename" | sed -e 's/\................//g' -e 's/-//g' -e 's/://g' -e 's/ /_/g')"
      if [ -a ""$newfilename""$doelextensie"" ] || [ "$preservefn" == "true" ]
      then
        mv -i "$filename" """$newfilename""_""$filename"""
        echo "$wadissergebeurd"
        echo 'Original name added at the end'
      else
        mv -i "$filename" ""$newfilename""$doelextensie""
        echo "$wadissergebeurd"
      fi
      ;;
    *.avi|*.AVI)
      doelextensie=".avi"
      wadissergebeurd="Video, used date of last change."
      newfilename="$(stat -c %y "$filename" | sed -e 's/\................//g' -e 's/-//g' -e 's/://g' -e 's/ /_/g')"
      if [ -a ""$newfilename""$doelextensie"" ] || [ "$preservefn" == "true" ]
      then
        mv -i "$filename" """$newfilename""_""$filename"""
        echo "$wadissergebeurd"
        echo 'Original name added at the end'
      else
        mv -i "$filename" ""$newfilename""$doelextensie""
        echo "$wadissergebeurd"
      fi
      ;;
    *.mov|*.MOV)
      doelextensie=".mov"
      wadissergebeurd="Video, used date of last change."
      newfilename="$(stat -c %y "$filename" | sed -e 's/\................//g' -e 's/-//g' -e 's/://g' -e 's/ /_/g')"
      if [ -a ""$newfilename""$doelextensie"" ] || [ "$preservefn" == "true" ]
      then
        mv -i "$filename" """$newfilename""_""$filename"""
        echo "$wadissergebeurd"
        echo 'Original name added at the end'
      else
        mv -i "$filename" ""$newfilename""$doelextensie""
        echo "$wadissergebeurd"
      fi
      ;;
    *.JPG|*.jpg|*.jpeg|*.JPEG)
      newnametemp="$(exiftool -a -s -CreateDate "$filename")"
      doelextensie=".jpg"
      if [ -z "$newnametemp" ]
      then 
        wadissergebeurd="No exif date found, using last changed date"
        newfilename="$(stat -c %y "$filename" | sed -e 's/\................//g' -e 's/-//g' -e 's/://g' -e 's/ /_/g')"
        if [ -a ""$newfilename""$doelextensie"" ] || [ "$preservefn" == "true" ]
        then
          mv -i "$filename" """$newfilename"_"$filename"""
          echo "$wadissergebeurd"
          echo 'Original name added at the end'
        else
          mv -i "$filename" ""$newfilename""$doelextensie""
          echo "$wadissergebeurd"
        fi
      else
        newfilename="$(exiftool -a -s -CreateDate "$filename" | awk -F ': ' '{print $2}' | sed -e 's/://g' -e 's/ /_/g')"
        newfilename="$(echo $newfilename | cut -c 1-15)"
        wadissergebeurd="Date taken from exif info"
        if [ -a ""$newfilename""$doelextensie"" ] || [ "$preservefn" == "true" ]
        then
          mv -i "$filename" """$newfilename"_"$filename"""
          echo "$wadissergebeurd"
          echo 'Original name added at the end'
        else
          mv -i "$filename" ""$newfilename""$doelextensie""
          echo "$wadissergebeurd"
        fi
      fi
      ;;
    *)
      echo 'Not a *.jpg / *.png / *.mp4 / *.avi!'
      ;;
  esac
done