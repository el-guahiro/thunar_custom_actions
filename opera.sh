#!/bin/bash
for i in "$@" ; do opera "$i" ; done &
sleep 0.5
wmctrl -xr opera -e 0,1,1,1920,1045