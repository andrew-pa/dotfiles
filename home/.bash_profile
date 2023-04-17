# opam configuration
test -r /home/andrew/.opam/opam-init/init.sh && . /home/andrew/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

if [ -z $TMUX ]; then
    columns=$(stty size | cut -f 2 -d ' ')
    session_name="main"
    if [[ $columns -lt 70 ]]; then
        session_name="📱"
    fi
    tmux new-session -A -s $session_name
fi

. ~/.profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
