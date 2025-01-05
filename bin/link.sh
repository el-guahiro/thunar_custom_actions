#!/bin/bash
#это эксперимент, но работает
Link="$(pwd)/$1.desktop";
basedir="$(dirname "$(readlink -f "${1}")")"
echo -e "#!/usr/bin/env xdg-open\n
[Desktop Entry]
Version=1.0
Name=$1
Comment=Open directory: $1
Comment[ru_RU]=Открыть папку: $1
Icon=folder-new
URL=file://"$basedir"/$1
Type=Link" | tee "$Link" &&
chmod +x "$Link"
mv "$(pwd)/$1.desktop" "$HOME/Рабочий стол/$1.desktop"
