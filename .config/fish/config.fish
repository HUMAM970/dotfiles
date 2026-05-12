source /usr/share/cachyos-fish-config/cachyos-config.fish
source $HOME/Vulkan/setup-env.fish

set -x PATH "$HOME/Bin" $PATH
set -x PATH "$HOME/zig" $PATH
set -x PATH "$HOME/flutter/bin" $PATH

set -gx ANDROID_HOME $HOME/Android/Sdk

fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/build-tools/34.0.0
fish_add_path $ANDROID_HOME/emulator

set -x EDITOR nvim
set -x VISUAL nvim

alias nv nvim
alias hx helix

set fish_greeting ""

fish_vi_key_bindings
