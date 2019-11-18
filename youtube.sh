#!/bin/bash

url="www.youtube.com"
surf -new-window $url &
sleep 1
wmctrl -r @cg -e 0,1,1,1920,1045