if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export DENO_INSTALL="$HOME/.deno"
export WASMTIME_HOME="$HOME/.wasmtime"

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH="$HOME/.cargo/bin:$DENO_INSTALL/bin:$WASMTIME_HOME/bin:$PATH"
export PS1="\n\[\e]0;sh [\w]\a\][\[\e[32m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]] \[\e[35m\\w\[\e[m\n\\$ "
export HISTSIZE=90000
export HISTFILESIZE=90000
export HISTCONTROL=erasedups
shopt -s histappend

export MOZ_ENABLE_WAYLAND=1
export RUST_BACKTRACE=1
export EDITOR=nvim

alias ls='ls --color=auto -a -l -h'
alias vim='nvim'
alias wndmn='kitty --detach nodemon'
alias gitlog='git log --oneline'
#alias wvim='kitty --detach nvim'
function wvim() { command neovide $* & disown; }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

