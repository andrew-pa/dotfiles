#!/bin/bash

SELFPATH=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)/$(basename -- "$0")")

if [ "$1" = "init-popup" ]; then
    tmux new-session -d -s popup
    tmux new-window -S -n $2 -t popup:
    tmux attach-session -t popup
else
    if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ];then
        tmux detach-client
    else
        tmux popup -E -w "75%" -h "75%" -b rounded "$SELFPATH init-popup $(tmux display-message -p -F "#{window_name}")"
    fi
fi
