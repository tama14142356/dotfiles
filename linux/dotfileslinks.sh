#! /bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -s $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -s $SCRIPT_DIR/.config/nvim ~/.config/nvim
ln -s $SCRIPT_DIR/.tmux.conf ~/.tmux.conf
