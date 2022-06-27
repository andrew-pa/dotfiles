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

if type -P exa &>/dev/null; then
    export EXA_COLORS="da=38;5;8:uu=33"
    exa_options="--long --all --classify --binary"
    alias lsl="exa -1 $exa_options"
    alias ls='exa --grid $exa_options'
    alias lst="exa -T $exa_options"
else
    alias ls='ls --color=auto -a -l -h'
    alias lsl='ls'
    alias lst='ls'
fi
alias vim='nvim'
alias wndmn='kitty --detach nodemon'
alias gitlog='git log --oneline'
alias gitlogg='git log --oneline --graph'
alias less='less -R'

mkdir -p /tmp/logs/
alias plog='less -R -O "/tmp/logs/$(pwd | tr [:punct:] _)@$(git branch --show-current | tr / -).$(date)"'

#alias wvim='kitty --detach nvim'
function wvim() { command neovide --multigrid $*; }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /usr/share/doc/fzf/examples/key-bindings.bash

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
