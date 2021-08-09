#!/bin/bash

# git-completion.bash / git-prompt.sh
#
if [ -f "$HOME"/.gitterminal/git-completion.bash ]; then
    source "$HOME"/.gitterminal/git-completion.bash
fi
if [ -f "$HOME"/.gitterminal/git-prompt.sh ]; then
    source "$HOME"/.gitterminal/git-prompt.sh
    # GIT_PS1_SHOWDIRTYSTATE=true
    # GIT_PS1_SHOWUNTRACKEDFILES=true
    # GIT_PS1_SHOWSTASHSTATE=true
    # GIT_PS1_SHOWUPSTREAM=auto
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUPSTREAM=1
    GIT_PS1_SHOWUNTRACKEDFILES=
    GIT_PS1_SHOWSTASHSTATE=1
    # ターミナル表示用
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[36m\]$(__git_ps1)\[\033[00m\]\$ '
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1 " (%s)") \n \[\033[01;34m\]\$\[\033[00m\] '
# else
#     export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n \[\033[01;34m\]\$\[\033[00m\] '
fi
