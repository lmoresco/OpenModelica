@echo off
rem .bat file generated by OpenModelica for calling OpenTURNS
echo set OPENTURNS_WRAPPER_PATH = %CD% so OpenTRUNS finds our wrapper.
set OPENTURNS_WRAPPER_PATH=%CD%
echo copy the wrapper.dtd to the current directory.
copy C:\OpenTURNS\lib\openturns\wrappers\wrapper*.dtd .\
echo remove the pause from pyot.bat.
cat.exe C:\OpenTURNS\bin\pyot.bat | grep.exe -v pause > pyot.bat
echo call pyot from openturns with script: <%pythonScriptOpenModelica%>
.\pyot.bat <%pythonScriptOpenModelica%>
rm.exe pyot.bat