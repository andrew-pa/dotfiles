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

if type -P eza &>/dev/null; then
    export EXA_COLORS="da=38;5;8:uu=33"
    eza_options="--long --all --classify --binary"
    alias lsl="eza -1 $eza_options"
    alias ls='eza --grid $eza_options'
    alias lst="eza -T $eza_options"
else
    alias ls='ls --color=auto -a -l -h'
    alias lsl='ls'
    alias lst='ls'
fi
alias vim='nvim'
alias wndmn='kitty --detach nodemon'
alias gitlog='git log --oneline -n20'
alias gitlogg='git log --oneline --graph'
alias less='less -R'

mkdir -p /tmp/logs/
function plog() {
    LOG_PATH="/tmp/logs/$(pwd | tr [:punct:] _)@$(git branch --show-current | tr / -).$(date)"
    ln -sv /tmp/logs/last "$LOG_PATH"
    $* | less -R -O "$LOG_PATH"
}

#alias wvim='kitty --detach nvim'
function wvim() { command neovide $*; }

[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


complete -C /usr/bin/terraform terraform
