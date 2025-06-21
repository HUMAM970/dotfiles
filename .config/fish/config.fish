source /usr/share/cachyos-fish-config/cachyos-config.fish

set -Ux PATH $HOME/go/bin $PATH

alias v='nvim'
alias vc='nvim $HOME/.config/nvim'

set -x EDITOR nvim
set -x VISUAL nvim

fish_vi_key_bindings
#set path#set path
