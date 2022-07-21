@echo off
@REM リンク作成
setlocal

pushd %~dp0
set script_dir=%CD%
pushd ..
set common_dir=%CD%
popd
popd

set editor_kind=%~1
if "%editor_kind%" == "" (
    set editor_kind=default
)

mklink %USERPROFILE%\.gitconfig %script_dir%\gitconfigs\%editor_kind%\.gitconfig
mklink /d %USERPROFILE%\vimfiles %script_dir%\vimfiles

mkdir %USERPROFILE%\.gitterminal
mklink /d %USERPROFILE%\.gitterminal\git-prompt.sh %common_dir%\.gitterminal\git-prompt.sh
mklink /d %USERPROFILE%\.gitterminal\git-completion.bash %common_dir%\.gitterminal\git-completion.bash
mklink /d %USERPROFILE%\.gitterminal\mygit_prompt.sh %script_dir%\.gitterminal\mygit_prompt.sh
mkdir %USERPROFILE%\.config
mkdir %USERPROFILE%\AppData\Local\nvim
mklink /d %USERPROFILE%\.config\nvim %common_dir%\.config\nvim
mklink %USERPROFILE%\AppData\Local\nvim\init.vim %common_dir%\.config\nvim\init.vim
mklink %USERPROFILE%\.tmux.conf %common_dir%\.tmux.conf
