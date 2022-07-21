@echo off
@REM リンク作成
setlocal

pushd %CD%

pushd ..\
mkdir %USERPROFILE%\.config
mkdir %USERPROFILE%\AppData\Local\nvim
mklink /d %USERPROFILE%\.config\nvim %CD%\.config\nvim
mklink %USERPROFILE%\AppData\Local\nvim\init.vim %CD%\.config\nvim\init.vim
mklink %USERPROFILE%\.tmux.conf %CD%\.tmux.conf
mklink /d %USERPROFILE%\.vim %CD%\.vim
popd

mklink %USERPROFILE%\.gitconfig %CD%\.gitconfig
mklink /d %USERPROFILE%\vimfiles %CD%\vimfiles
mklink /d %USERPROFILE%\.gitterminal %CD%\.gitterminal
popd
