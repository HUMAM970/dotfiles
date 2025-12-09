function cdc
    set dir (fd --type d -d 1 . ~/code | sk)
    if test -n "$dir"
        helix $dir
    end
end
