@echo off
@REM リンク削除
setlocal
del %USERPROFILE%\.gitconfig
del %USERPROFILE%\.tmux.conf
del %USERPROFILE%\AppData\Local\nvim\init.vim
rmdir %USERPROFILE%\AppData\Local\nvim
rmdir %USERPROFILE%\.config\nvim
@REM rmdir %USERPROFILE%\.config
rmdir %USERPROFILE%\vimfiles
rmdir %USERPROFILE%\.vim
rmdir %USERPROFILE%\.gitterminal
