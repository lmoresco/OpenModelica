// This file provides you how to compile and test the OMCCp
// There are two folders named omcc and omcc_test in the directory trunk/openmodelica/testsuite/
// the "omcc" folder contains the implemented code and the "omcc_test" folder contains the test cases 
// the omccp is tested with 102 test cases, look for the file SCRIPT.mos in the folder "omcc"
// to make the compilation process easier a Makefile is created.(look into the omcc folder)

1) Open the mingw terminal if you are a windows user and normal terminal for linux user

2) In the terminal window go to the path /openmodelica/testsuite/omcc

3) at present the code is tested with testing environment rtest, and the baseline is added to makefile so no need to set baseline everytime you compile, it will be generated automatically by makefile

4) Then type the command "make test" or "make" in the terminal window, the omccp will be compiled and ready to run

5) some c files and other lib files will be created after running make, you can run again "make clean" to delete those generated files

6) The parser runs and produces the output for the testcases which can be seen in output.

7) if you want to test your own models or some other models look for the file "SCRIPT.mos" in the folder omcc

8) Open the file "SCRIPT.mos" and look for the comments // add your testfiles here 

9) at present only 21 test cases are tested and remaining are commented, you are free to test the remaining files by uncommenting them.

Note: you can look a clear picture of the output in the file SCRIPT.mos. 

