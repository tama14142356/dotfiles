@echo off

pushd %~dp0
set script_dir=%CD%
popd

call %script_dir%\dotfilelinks.bat "code"
