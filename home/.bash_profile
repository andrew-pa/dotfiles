# opam configuration
test -r /home/andrew/.opam/opam-init/init.sh && . /home/andrew/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    if [ -z $TMUX ]; then
        tmux attach || tmux
    fi
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
