#!/bin/bash
IFS=$'\#'
for f in $@; do cp "$f" "${f%.*} _.`date +%F_%H-%M`.${f##*.}" ;done