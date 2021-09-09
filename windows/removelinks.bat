@echo off
@REM リンク削除
setlocal
del %USERPROFILE%\.gitconfig
del %USERPROFILE%\.tmux.conf
rmdir %USERPROFILE%\.config\nvim
rmdir %USERPROFILE%\.config
rmdir %USERPROFILE%\vimfiles
rmdir %USERPROFILE%\.gitterminal

