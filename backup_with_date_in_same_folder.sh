#!/bin/bash
IFS=$'\#'
for f in $@; do cp "$f" "${f%.*} v.`date +%x`.${f##*.}" ;done