#!/usr/bin/env bash

name=cansi.adt

sudo update-alternatives              \
    --install /usr/local/bin/${name}  \
    ${name}                           \
    $PWD/command.py                   \
    1999

exit 0
