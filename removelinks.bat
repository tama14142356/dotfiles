@echo off
@REM リンク削除
setlocal
del %USERPROFILE%\.gitconfig
del %USERPROFILE%\.tmux.conf
rmdir %USERPROFILE%\.config
rmdir %USERPROFILE%\.config\nvim
