#!/bin/bash
find ${DIR} -type l -exec bash -c 'ln -f "$(readlink -m "$0")" "$0"' {} \;&exit