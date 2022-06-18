#!/bin/bash

set -x

script_dir=$(
    cd "$(dirname "$0")" || exit
    pwd
)


START_TIMESTAMP=$(date '+%s')

find / -name git-prompt.sh -o -name git-completion.bash 2> /dev/null

# find / -name git-completion.bash 2> /dev/null

END_TIMESTAMP=$(date '+%s')

E_TIME=$(($END_TIMESTAMP-$START_TIMESTAMP))
echo "exec time: $E_TIME s"

change_human_time_script="$script_dir/change_humantime.sh"

bash "$change_human_time_script" $E_TIME 

