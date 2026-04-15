# init a python3-venv
function mkvenv() {
    activate_cmd=""
    if [ $# -eq 0 ]; then
        dest="venv"
    elif [ "$1" = "-h" ]; then
        echo "mkvenv: Create a python3-venv"
        echo "\tUsage:"
        echo "\tmkvenv [dest] [options]"
        echo "\t\tdest: destination folder"
        echo "\t\toptions: options for python3 -m venv"
        echo "\n\tExample:"
        echo "\tmkvenv -a"
        echo "\t\tCreates a virtual environment 'venv' and activate it"
        return
    elif [ "$1" = "-a" ]; then
        dest="venv"
        activate_cmd="source venv/bin/activate"
    else
        dest="$1"
    fi

    if [ -z "$2" ]; then
        python3 -m venv "$dest"
    else
        python3 -m venv "$dest" "$2"
    fi

    if [ -n "$activate_cmd" ]; then
        eval "$activate_cmd"
    fi
}

