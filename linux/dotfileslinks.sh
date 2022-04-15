#! /bin/bash
SCRIPT_DIR=$(
    cd "$(dirname "$0")" || exit
    pwd
)
common_dir=$(dirname "$SCRIPT_DIR")
editor_kind="$1"
if [ -z "$editor_kind" ]; then
    editor_kind="default"
fi
ln -s $SCRIPT_DIR/gitconfigs/$editor_kind/.gitconfig ~/.gitconfig
ln -s $SCRIPT_DIR/.gitterminal ~/.gitterminal
ln -s $common_dir/.config/nvim ~/.config/nvim
ln -s $common_dir/.config/efm-langserver ~/.config/efm-langserver
ln -s $common_dir/.tmux.conf ~/.tmux.conf
ln -s $common_dir/.vim ~/.vim
