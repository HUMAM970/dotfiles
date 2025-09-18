source /usr/share/cachyos-fish-config/cachyos-config.fish
source $HOME/Vulkan/setup-env.fish

set -x PATH "$HOME/zig" $PATH

# set -U PATH $HOME/go/bin $PATH

alias v='nvim'
alias vc='nvim $HOME/.config/nvim'

set -x EDITOR helix
set -x VISUAL helix

fish_vi_key_bindings
#set path#set path
