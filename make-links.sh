#!/bin/bash

COLORSCHEME=winter.palette
CONFIG_ROOT=$HOME/config

unipalette $CONFIG_ROOT/palettes/$COLORSCHEME expand $CONFIG_ROOT

MAC_FILTER='vim\|git\|clangd\|zsh\|tmux'

find $CONFIG_ROOT/home -type f -not -name "*.uncol" | grep $MAC_FILTER | sed "s|$CONFIG_ROOT/home\(.*\)|$CONFIG_ROOT/home\1 $HOME\1|g" | xargs -n 2 -- ln -svf
