#!/bin/bash
IFS=$'\#'
for i in "$@" ; do pdfseparate "$i" "${i%.pdf}_%d_.pdf"
done