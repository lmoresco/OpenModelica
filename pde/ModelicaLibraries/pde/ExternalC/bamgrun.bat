@echo off

set OLDPATH=%PATH%

set PATH=%PATH%;D:/CYGWIN/BIN

d:/cygwin/bin/bash -c "/usr/local/bin/bamg -g %1 -o %2" 

set PATH=%OLDPATH%
