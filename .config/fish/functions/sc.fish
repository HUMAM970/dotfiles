function sc
    set dir (find ~/dotfiles/.config -type d | fzf)
    if test -n "$dir"
        nvim $dir
    end
end
