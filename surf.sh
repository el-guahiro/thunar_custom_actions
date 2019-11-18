#!/bin/bash
for i in "$@" ; do surf "$i" ; done &
sleep 0.3
wmctrl -xr "surf" -e 0,1,1,1920,1045
