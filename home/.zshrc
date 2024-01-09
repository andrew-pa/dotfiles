source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

export PROMPT="
[%F{red}%n%f@%F{green}%m%f] %B%F{magenta}%~%f%b
%# "

export RUST_BACKTRACE=1
export EDITOR=nvim

export PATH="$PATH:/Applications/Racket v8.8/bin"

if type -p exa &>/dev/null; then
    export EXA_COLORS="da=38;5;8:uu=33"
    exa_options="--long --all --classify --binary"
    alias lsl="exa -1 $exa_options"
    alias ls="exa --grid $exa_options"
    alias lst="exa -T $exa_options"
else
    alias ls='ls --color=auto -a -l -h'
    alias lsl='ls'
    alias lst='ls'
fi

alias vim='nvim'
alias gitlog='git log --oneline'
alias gitlogg='git log --oneline --graph'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andrew/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andrew/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andrew/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andrew/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

