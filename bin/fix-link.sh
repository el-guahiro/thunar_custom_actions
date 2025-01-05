#!/bin/bash
#меняет хардлинк на симлинк
$(ln "-rs" $(readlink -f "$1") "$1.tmp")
mv -f "$1.tmp" $(readlink -f "$1")
exit 0