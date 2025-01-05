#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
find -L . -xtype l -exec bash -c 'ln -f "$(realpath "$0")" "$0"' {} \;&exit
