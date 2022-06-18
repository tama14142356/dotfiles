#!/bin/bash

set -x

script_dir=$(
    cd "$(dirname "$0")" || exit
    pwd
)

bash "$script_dir/exec_find_git_scripts.sh" &> "$script_dir/git-prompt_path.log"
