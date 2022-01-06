@echo off
setlocal
cd /d "%~dp0"

call :Compile Program || goto :error
goto :eof

:error
exit /b 1

:Compile
stack ghc -- ^
    --make ^
    -O0 ^
    -Wall ^
    -Werror ^
    %~1.hs
goto :eof
