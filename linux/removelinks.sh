#! /bin/bash
SCRIPT_DIR=$(
    cd "$(dirname "$0")" || exit
    pwd
)
unlink ~/.gitconfig
unlink ~/.config/nvim
unlink ~/.tmux.conf
unlink ~/.vimrc
unlink ~/.vim
