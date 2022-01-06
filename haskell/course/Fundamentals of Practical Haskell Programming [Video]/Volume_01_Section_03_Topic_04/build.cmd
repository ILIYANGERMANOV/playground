@echo off
setlocal
cd /d "%~dp0"

call :Compile Quaternion0 || goto :error
call :Compile Quaternion1 || goto :error
call :Compile Quaternion2 || goto :error
call :Compile Quaternion3 || goto :error
call :Compile ShowExample || goto :error
call :Compile TypeClasses || goto :error
call :Compile TypeWrapping0 || goto :error
call :Compile TypeWrapping1 || goto :error
goto :eof

:error
exit /b 1

:Compile
stack ghc -- ^
    --make ^
    -O0 ^
    -Wall ^
    -Werror ^
    -Wno-type-defaults ^
    -Wno-unused-matches ^
    -fno-code ^
    -fno-warn-unused-top-binds ^
    %~1.hs
goto :eof
