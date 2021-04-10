@echo off
@REM リンク作成
setlocal
mklink %USERPROFILE%\.gitconfig %CD%\.gitconfig
mklink %USERPROFILE%\.tmux.conf %CD%\.tmux.conf
mkdir %USERPROFILE%\.config
mklink /d %USERPROFILE%\.config\nvim %CD%\.config\nvim
