#!/bin/bash
IFS=$'\#'
for f in *; do 
shopt -s globstar
rename 's/^(.{100}).*(\..*)$/$1$2/' ******
done