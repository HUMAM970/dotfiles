function watch_flutter
    if not set -q argv[1]
        echo "Error: No path provided."
        echo "Usage: watch_flutter <directory_path>"
        exit 1
    end

    set -l target_path $argv[1]
    set -l pipe_path (mktemp -u /tmp/flutter_pipe_XXX)
    mkfifo $pipe_path

    echo --------------------------------------------------
    echo "WATCHER STARTED"
    echo --------------------------------------------------
    echo "In your other tab, run this command:"
    echo "tail -f $pipe_path | flutter run"
    echo --------------------------------------------------

    begin
        while true
            fd --search-path $target_path -e dart | entr -d -p sh -c "echo 'r' > $pipe_path"
        end
    end

    if test -p $pipe_path
        rm $pipe_path
        echo "Pipe $pipe_path deleted."
    end
end
