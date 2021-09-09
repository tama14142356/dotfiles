#! /bin/bash
SCRIPT_DIR=$(
    cd "$(dirname "$0")" || exit
    pwd
)
editor_kind="$1"
if [ -z "$editor_kind" ]; then
    editor_kind="default"
fi
ln -s $SCRIPT_DIR/gitconfigs/$editor_kind/.gitconfig ~/.gitconfig
ln -s $SCRIPT_DIR/.gitterminal ~/.gitterminal
ln -s $SCRIPT_DIR/.config/nvim ~/.config/nvim
ln -s $SCRIPT_DIR/.tmux.conf ~/.tmux.conf
ln -s $SCRIPT_DIR/.vim ~/.vim
