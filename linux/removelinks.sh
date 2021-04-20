#! /bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
unlink ~/.gitconfig
unlink ~/.config/nvim
unlink ~/.tmux.conf
