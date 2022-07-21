@echo off
@REM リンク削除
setlocal
del %USERPROFILE%\.gitconfig
del %USERPROFILE%\.tmux.conf
del %USERPROFILE%\AppData\Local\nvim\init.vim
rmdir %USERPROFILE%\AppData\Local\nvim
rmdir %USERPROFILE%\.config\nvim
rmdir %USERPROFILE%\vimfiles
del %USERPROFILE%\.gitterminal\git-prompt.sh
del %USERPROFILE%\.gitterminal\git-completion.bash
del %USERPROFILE%\.gitterminal\mygit_prompt.sh
rmdir %USERPROFILE%\.gitterminal
