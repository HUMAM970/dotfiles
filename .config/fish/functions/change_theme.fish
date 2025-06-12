function change_theme
    if test (count $argv) -ne 1
        echo "Usage: change_theme <theme_name>"
        return 1
    end

    set theme_name $argv[1]
	if [ $theme_name = 'default' ]
		gsettings set org.gnome.desktop.interface gtk-theme "'Adwaita'"
		gsettings set org.gnome.desktop.interface icon-theme "'Adwaita'"
		rm -rf ~/.config/gtk-4.0/*
		rm -rf ~/.cache/gtk-4.0/*
		return
	end

    set theme_dir "$HOME/.themes/$theme_name/gtk-4.0"
    set gtk_config_dir "$HOME/.config/gtk-4.0"

    # Check if the theme gtk-4.0 directory exists
    if not test -d $theme_dir
        echo "Error: Theme subdirectory not found: $theme_dir"
        return 1
    end

    # Ensure GTK config dir exists
    if not test -d $gtk_config_dir
        mkdir -p $gtk_config_dir
    end

    set items gtk.css gtk-dark.css assets

    for item in $items
        set source "$theme_dir/$item"
        set destination "$gtk_config_dir/$item"

        # Remove existing symlink or file
        if test -e $destination -o -L $destination
            rm -rf $destination
        end

        # Create the symlink if the source exists
        if test -e $source -o -d $source
            ln -s $source $destination
            echo "Linked: $destination → $source"
        else
            echo "Warning: Not found in theme: $source"
        end
    end
	
	gsettings set org.gnome.desktop.interface gtk-theme $theme_name
	gsettings set org.gnome.desktop.interface icon-theme $theme_name
	rm -rf ~/.cache/gtk-4.0/*
end
