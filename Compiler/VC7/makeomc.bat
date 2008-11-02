@echo off
cd > c:\cygwin\tmp\path.txt
c:\cygwin\bin\bash --login -c "cd \"`cygpath -f /tmp/path.txt`/../..\";make vctarget"
