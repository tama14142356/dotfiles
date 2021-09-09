#! /bin/bash
SCRIPT_DIR=$(
    cd "$(dirname "$0")" || exit
    pwd
)
unlink ~/.gitconfig
unlink ~/.gitterminal
unlink ~/.config/nvim
unlink ~/.tmux.conf
unlink ~/.vim
