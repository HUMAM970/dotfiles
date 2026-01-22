source /usr/share/cachyos-fish-config/cachyos-config.fish
source $HOME/Vulkan/setup-env.fish

if status is-interactive
    set ZELLIJ_AUTO_ATTACH false
    set ZELLIJ_AUTO_EXIT true
    if not set -q ZELLIJ; and test "$TERM" != linux
        if test "$ZELLIJ_AUTO_ATTACH" = true
            zellij attach -c
        else
            zellij
        end

        if test "$ZELLIJ_AUTO_EXIT" = true
            kill $fish_pid
        end
    end
end

set -x PATH "$HOME/zig" $PATH
set -x PATH "$HOME/flutter/bin" $PATH

set -gx ANDROID_HOME $HOME/Android/Sdk

fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/build-tools/34.0.0
fish_add_path $ANDROID_HOME/emulator

# alias v='nvim'
# alias vc='nvim $HOME/.config/nvim'

set -x EDITOR helix
set -x VISUAL helix

alias hx helix

set fish_greeting ""

fish_vi_key_bindings
