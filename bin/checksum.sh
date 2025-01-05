#!/bin/bash
# Purpose:  Thunar Custom Action. Calculates hashes.
# Usage:     /usr/bin/checksum %f
# Author:    Misko_2083
# Date:       December 07, 2014
# Version:    1
# Licence GPLv2

file="$@"

MD5=(`echo "" | awk '{print "TRUE","MD5", $0}'`)
SHA1=(`echo "" | awk '{print "FALSE","SHA-1", $0}'`)
SHA224=(`echo "" | awk '{print "FALSE","SHA-224", $0}'`)
SHA256=(`echo "" | awk '{print "FALSE","SHA-256", $0}'`)
SHA384=(`echo "" | awk '{print "FALSE","SHA-384", $0}'`)
SHA512=(`echo "" | awk '{print "FALSE","SHA-512", $0}'`)

selection=$(zenity --list --radiolist --height=300 --title="Checksum" --text="File:  <b>${file##*/}</b>\nPick the hash funcion." --column="Pick" --column="Hash" "${MD5[@]}" "${SHA1[@]}" "${SHA224[@]}" "${SHA256[@]}" "${SHA384[@]}" "${SHA512[@]}")

# If Quit is clicked then exit
if [ "${PIPESTATUS[0]}" -ne "0" ]; then
    exit 0
fi

echo $selection | grep "MD5" > /dev/null
if [ $? = 0 ];then
    md5sum "$file" | tee >(cut -d ' ' -f1 > /tmp/sum) |zenity --progress --title="MD5sum" --text="Calculating MD5 for:\n${file##*/}" --pulsate --auto-close

    # If Cancel is clicked then remove temporary file and exit
    if [ "${PIPESTATUS[2]}" -ne "0" ]; then
        rm /tmp/sum
        exit 0
    fi

    sum=`cat /tmp/sum`
    zenity --info --title="MD5sum" --text="MD5sum : $sum\nFile :          ${file##*/}"
    rm /tmp/sum
    exit 0
fi

echo $selection | grep "SHA-1" > /dev/null
if [ $? = 0 ];then
    sha1sum "$file" | tee >(cut -d ' ' -f1 > /tmp/sum) |zenity --progress --title="SHA-1" --text="Calculating SHA-1 for:\n${file##*/}" --pulsate --auto-close

    # If Cancel is clicked then remove temporary file and exit
    if [ "${PIPESTATUS[2]}" -ne "0" ]; then
        rm /tmp/sum
        exit 0
    fi

    sum=`cat /tmp/sum`
    zenity --info --title="SHA-1" --text="SHA-1: $sum\nFile :    ${file##*/}"
    rm /tmp/sum
    exit 0
fi

echo $selection | grep "SHA-224" > /dev/null
if [ $? = 0 ];then
    sha224sum "$file" | tee >(cut -d ' ' -f1 > /tmp/sum) |zenity --progress --title="SHA-224" --text="Calculating SHA-224 for:\n${file##*/}" --pulsate --auto-close

    # If Cancel is clicked then remove temporary file and exit
    if [ "${PIPESTATUS[2]}" -ne "0" ]; then
        rm /tmp/sum
        exit 0
    fi

    sum=`cat /tmp/sum`
    zenity --info --title="SHA-224" --text="SHA-224 : $sum\nFile :         ${file##*/}"
    rm /tmp/sum
    exit 0
fi

echo $selection | grep "SHA-256" > /dev/null
if [ $? = 0 ];then
    sha256sum "$file" | tee >(cut -d ' ' -f1 > /tmp/sum) |zenity --progress --title="SHA-256" --text="Calculating SHA-256 for:\n${file##*/}" --pulsate --auto-close

    # If Cancel is clicked then remove temporary file and exit
    if [ "${PIPESTATUS[2]}" -ne "0" ]; then
        rm /tmp/sum
        exit 0
    fi

    sum=`cat /tmp/sum`
    zenity --info --title="SHA-256" --text="SHA-256 : $sum\nFile :         ${file##*/}"
    rm /tmp/sum
    exit 0
fi

echo $selection | grep "SHA-384" > /dev/null
if [ $? = 0 ];then
    sha384sum "$file" | tee >(cut -d ' ' -f1 > /tmp/sum) |zenity --progress --title="SHA-384" --text="Calculating SHA-384 for:\n${file##*/}" --pulsate --auto-close

    # If Cancel is clicked then remove temporary file and exit
    if [ "${PIPESTATUS[2]}" -ne "0" ]; then
        rm /tmp/sum
        exit 0
    fi

    sum=`cat /tmp/sum`
    zenity --info --title="SHA-384" --text="SHA-384 : $sum\nFile :         ${file##*/}"
    rm /tmp/sum
    exit 0
fi

echo $selection | grep "SHA-512" > /dev/null
if [ $? = 0 ];then
    sha512sum "$file" | tee >(cut -d ' ' -f1 > /tmp/sum) |zenity --progress --title="SHA-512" --text="Calculating SHA-512 for:\n${file##*/}" --pulsate --auto-close

    # If Cancel is clicked then remove temporary file and exit
    if [ "${PIPESTATUS[2]}" -ne "0" ]; then
        rm /tmp/sum
        exit 0
    fi

    sum=`cat /tmp/sum`
    zenity --info --title="SHA-512" --text="SHA-512 : $sum\nFile :         ${file##*/}"
    rm /tmp/sum
    exit 0
fi