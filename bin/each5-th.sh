#!/bin/bash
IFS=$'\n'
n=0
mkdir selected
for file in ./*.jpg; do
   test $n -eq 0 && cp "$file" selected/
   n=$((n+1))
   n=$((n%5))
done