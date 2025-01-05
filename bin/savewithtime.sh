#!/bin/bash
IFS=$'\n'
for i in "$@"; do mv "$i" `date +%d.%m.%Y_%H:%M:%S`_"$i" ; done