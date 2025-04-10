. ~/.profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# opam configuration
test -r /home/andrew/.opam/opam-init/init.sh && . /home/andrew/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

if [ -n "$SSH_CONNECTION" ]; then
    if [[ -z "$ZELLIJ" ]]; then
        ip="${SSH_CLIENT%% *}"
        session_name=$(avahi-resolve-address -a "$ip" 2>/dev/null | awk '{print "from-" $2}')
        # Fall back to the IP address if no hostname was found
        [ -z "$session_name" ] && session_name="from-$ip"
        zellij attach -c $session_name
        exit
    fi

fi

export PATH="$HOME/.elan/bin:$PATH"
