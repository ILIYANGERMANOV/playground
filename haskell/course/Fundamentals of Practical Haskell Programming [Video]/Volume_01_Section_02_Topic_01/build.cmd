@echo off
setlocal
cd /d "%~dp0"

call :Compile Program1 || goto :error
call :Compile Program2 || goto :error
call :Compile Program3 || goto :error
call :Compile Program4 || goto :error
goto :eof

:error
exit /b 1

:Compile
stack ghc -- ^
    --make ^
    -O0 ^
    -Wall ^
    -Werror ^
    -Wno-missing-signatures ^
    -Wno-name-shadowing ^
    -Wno-type-defaults ^
    %~1.hs
goto :eof
