#!/bin/bash
IFS=$'\#'
for f in *; do 
shopt -s globstar
rename 's/^(.{140}).*(\..*)$/$1$2/' ******
done