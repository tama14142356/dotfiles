#! /bin/bash
SCRIPT_DIR=$(
    cd "$(dirname "$0")" || exit
    pwd
)
bash "$SCRIPT_DIR/dotfileslinks.sh" "vim"
