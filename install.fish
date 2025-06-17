#!/usr/bin/env fish

if test (id -u) -ne 0
    echo "Please run as root or use sudo"
    exit 1
end

# Hardware Specific Packages
set intel_pkgs intel-media-driver intel-ucode vulkan-intel #libva-utils libvpl

# WM And System Environment
set wl_pkgs wayland xorg-xwayland xdg-desktop-portal #xdg-desktop-portal-wlr wlroots
set wm_pkgs sway swaync swaybg swayimg rofi-wayland i3status-rust
set fm_pkgs 7zip unzip unrar yazi nautilus fzf
set util_pkgs wl-clipboard brightnessctl pavucontrol btop
set bt_pkgs blueman bluez

# Audio Packages
set pw_pkgs gst-plugin-pipewire lib32-libpipewire lib32-pipewire libpipewire pipewire pipewire-alsa pipewire-audio pipewire-pulse wireplumber
set alsa_pkgs alsa-card-profiles alsa-firmware alsa-lib alsa-plugins alsa-topology-conf alsa-ucm-conf alsa-utils lib32-alsa-lib lib32-alsa-plugins

# Development Packages
set dbms_pkgs docker docker-compose postgresql
set lsp_pkgs gopls lua-language-server
set env_pkgs neovim ghostty
set git_pkgs git github-cli
set fmt_pkgs stylua

# Font Packages
set font_pkgs noto-fonts noto-fonts-extra noto-fonts-emoji ttf-jetbrains-mono-nerd

# Browsing And Comunication Packages
set browser_pkgs brave-bin 
set com_pkgs discord 

# Install Packages
set all_pkgs $intel_pkgs $wl_pkgs $wm_pkgs $fm_pkgs $util_pkgs $bt_pkgs $pw_pkgs $alsa_pkgs \
             $dbms_pkgs $lsp_pkgs $env_pkgs $git_pkgs $fmt_pkgs $font_pkgs $browser_pkgs $com_pkgs

if not pacman -Syu --noconfirm --needed $all_pkgs
    echo "❌ Package installation failed."
    exit 1
end
