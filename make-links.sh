#!/bin/bash

CONFIG_ROOT=$HOME/config/home

find $CONFIG_ROOT -type f | sed "s|$CONFIG_ROOT\(.*\)|$CONFIG_ROOT\1 $HOME\1|g" | xargs -n 2 -- ln -svf
