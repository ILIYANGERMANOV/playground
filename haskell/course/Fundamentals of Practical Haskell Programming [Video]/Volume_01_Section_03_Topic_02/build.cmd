@echo off
setlocal
cd /d "%~dp0"

call :Compile Chars || goto :error
call :Compile Constraints0 || goto :error
call :Compile Constraints1 || goto :error
call :Compile Constraints2 || goto :error
rem call :Compile Constraints3 || goto :error
call :Compile FormatList || goto :error
call :Compile Functions || goto :error
call :Compile Lists || goto :error
call :Compile Nums || goto :error
call :Compile Polymorphism || goto :error
call :Compile Strings || goto :error
call :Compile Tuples || goto :error

call :CompileCpp Inheritance || goto :error
call :CompileCpp Overloading || goto :error
call :CompileCpp Templates || goto :error

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
    -Wno-type-defaults ^
    %~1.hs
goto :eof

:CompileCpp
cl /nologo /EHsc -c %~1.cpp
goto :eof
