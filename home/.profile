. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin
source /opt/vulkan/setup-env.sh
export _JAVA_AWT_WM_NONREPARENTING=1

eval `ssh-agent -s`

[ -f "/home/andrew/.ghcup/env" ] && . "/home/andrew/.ghcup/env" # ghcup-env
export PATH="$HOME/.elan/bin:$PATH"
