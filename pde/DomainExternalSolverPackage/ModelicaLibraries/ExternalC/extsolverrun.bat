@echo off

set OLDPATH=%PATH%

set PATH=%PATH%;D:/CYGWIN/BIN

set MYDIR=`cygpath -u '%~p0'`

d:/cygwin/bin/bash -c "%MYDIR%/extsolverrun.sh %1 %2 %3 %4 %5 %6 %7 %8 %9" 

set PATH=%OLDPATH%

if errorlevel 1 goto error

exit 0

:error

echo "Error!"

exit 1
