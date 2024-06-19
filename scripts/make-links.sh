#!/bin/bash

COLORSCHEME=april2024.palette
CONFIG_ROOT=$HOME/config

unipalette $CONFIG_ROOT/palettes/$COLORSCHEME expand $CONFIG_ROOT

find $CONFIG_ROOT/home -type f -not -name "*.uncol" \
	| sed "s|$CONFIG_ROOT/home\(.*\)|$CONFIG_ROOT/home\1 $HOME\1|g" \
	| xargs -n 2 -- sh -c 'mkdir -p $(dirname $2) && ln -svf $1 $2' --
