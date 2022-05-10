@echo off

mkdir out\

pushd out\

:: Load compilation environment
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

:: compiling the dll
cl.exe /LD ..\c\glyphme.cpp %HASHLINKPATH%\libhl.lib

if %errorlevel% neq 0 exit /b %errorlevel%

:: moving to hl path and renaming to .hdll
move glyphme.dll %HASHLINKPATH%\glyphme.hdll

popd

:: compiling the hx test
haxe build_sample.hxml

:: running the text (doing this from vscode debugger)
:: hl glyphme.hl
