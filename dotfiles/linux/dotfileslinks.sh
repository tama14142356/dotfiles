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

git_major_ver=0
if type "git" > /dev/null 2>&1
then
    git_ver=$(git --version)
    git_ver=${git_ver##* }
    git_major_ver=${git_ver%%.*}
fi
use_git_prompt=""
if [ $git_major_ver -gt 1 ];then
    find_link="$HOME/.gitterminal/git-prompt.sh"
    if [ ! -f "$find_link" ];then
        use_git_prompt="default"
    fi
fi

ln -s $SCRIPT_DIR/gitconfigs/$editor_kind/.gitconfig ~/.gitconfig
ln -s $SCRIPT_DIR/.vim ~/.vim
mkdir -p ~/.gitterminal
ln -s $SCRIPT_DIR/.gitterminal/mygit_prompt.sh ~/.gitterminal/mygit_prompt.sh
if [ -n "$use_git_prompt" ];then
    ln -s $common_dir/.gitterminal/git-prompt.sh ~/.gitterminal/git-prompt.sh
    ln -s $common_dir/.gitterminal/git-completion.bash ~/.gitterminal/git-completion.bash
fi
ln -s $common_dir/.config/nvim ~/.config/nvim
ln -s $common_dir/.tmux.conf ~/.tmux.conf
