function sc
    set dir (fd --type d . ~/dotfiles/.config | sk)
    if test -n "$dir"
        nvim $dir
    end
end
