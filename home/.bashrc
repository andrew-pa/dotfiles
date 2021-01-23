# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export MOZ_ENABLE_WAYLAND=1
export RUST_BACKTRACE=1

export DENO_INSTALL="$HOME/.deno"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export PATH="$HOME/.cargo/bin:$DENO_INSTALL/bin:$PATH"
export PS1="\n[\[\e[32m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]] \[\e[35m\\w\[\e[m\n\\$ "
export HISTSIZE=40000
export HISTFILESIZE=40000
export HISTCONTROL=erasedups
shopt -s histappend

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ls='ls --color=auto -a -l -h'
alias wvim='kitty --detach vim'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andrew/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
