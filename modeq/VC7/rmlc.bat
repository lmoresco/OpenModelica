@echo off
cd > c:\cygwin\tmp\path.txt
c:\cygwin\bin\bash --login -c "cd `cygpath -f /tmp/path.txt`;/usr/local/rml-2.1.9-binary-x86-cygwin-gcc/x86-cygwin-gcc/bin/rmlc +C %1"