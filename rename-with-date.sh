#!/bin/bash
for i in "$@";
do
extension="${i##*.}" 
filename="${i%.*}" 
mv "$i" "${filename} `date +%x`.${extension}"
	done
