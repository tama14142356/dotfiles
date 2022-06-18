#!/bin/bash

set -eux

script_dir=$(
    cd "$(dirname "$0")" || exit
    pwd
)

path_list_file="$script_dir/git-prompt_path_list.txt"

path_list_num=$(cat "$path_list_file" | wc -l)

if [ $path_list_num -ne 2 ];then
    exit 1
else
    path_list=$(cat "$path_list_file")
    mkdir -p "$HOME/.gitterminal"
    for git_prompt in ${path_list};
    do
        filename=$(basename "$git_prompt")
        abs_git_prompt_path=$(
            cd "$(dirname "$git_prompt")" || exit 1
	    pwd
        )
        ln -s "$abs_git_prompt_path/$filename" "$HOME/.gitterminal/$filename"
    done
fi
