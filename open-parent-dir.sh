#! /bin/bash

basedir="$(dirname "$(readlink -f "${1}")")"
thunar "$basedir"
disown -h %1  
bg 1