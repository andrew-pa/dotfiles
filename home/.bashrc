# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export MOZ_ENABLE_WAYLAND=1
export RUST_BACKTRACE=1

export DENO_INSTALL="$HOME/.deno"

source "/opt/vulkan/1.2.170.0/setup-env.sh"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export PATH="$HOME/.cargo/bin:$DENO_INSTALL/bin:$PATH"
export PS1="\n\[\e]0;sh [\w]\a\][\[\e[32m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]] \[\e[35m\\w\[\e[m\n\\$ "
export HISTSIZE=40000
export HISTFILESIZE=40000
export HISTCONTROL=erasedups
shopt -s histappend

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ls='ls --color=auto -a -l -h'
alias vim='nvim'
#alias wvim='kitty --detach nvim'

function wvim() { command neovide $* & disown; }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
