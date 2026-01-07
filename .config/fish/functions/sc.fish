function sc
    set -l dir (fd --type d . ~/dotfiles/.config | sk)
    if test -n "$dir"
        helix $dir
    end
end
