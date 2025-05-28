source /usr/share/cachyos-fish-config/cachyos-config.fish
source ~/vulkan/1.4.309.0/setup.fish

set -Ux PATH $HOME/go/bin $PATH

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

alias vim='nvim'
set -x EDITOR nvim
set -x VISUAL nvim
