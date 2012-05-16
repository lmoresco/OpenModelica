// This file provides you how to compile and test the OMCCp
// There are two folders named omcc and omcc_test in the directory trunk/openmodelica/testsuite/
// the "omcc" folder contains the implemented code and the "omcc_test" folder contains the test cases 
// the omccp is tested with 70 test cases look for the file SCRIPT.mos in the folder "omcc"
// to make the compilation process easier a Makefile is created.(look into the omcc folder)

1) Open the mingw terminal if you are a windows user and normal terminal for linux user

2) In the terminal window go to the path /openmodelica/testsuite/omcc

3) Then type the command "make test" or "make" in the terminal window, the omccp will be compiled and ready to run

4) some c files and other lib files will be created after running make, you can run again "make clean" to delete thoss generated files

4) The parser runs and produces the output for the file test1.mo which can be seen in output.

5) if you want to test your own models or some other models look for the file "SCRIPT.mos" in the folder omcc

6) Open the file "SCRIPT.mos" and look for the comments // add your testfiles here 

7) More test cases are added there, At present the omccp runs for only one testcase namely test1.mo, remaning are commented, you are free to uncomment and test all those models,
   and also you can test you own models by giving the path in "Main.main({"path to your model/name of your model.mo","Modelica"});"

8) for clear picture of the output you can write the output to a textfile which can be done by the following below steps
    a)look for the "Makefile" in the folder omcc
    b)open the Makefile and the find the line number-7 which will be like this @$(OMC) SCRIPT.mos 
    c) you can write the output to a text file by pasting the following line @$(OMC) SCRIPT.mos > some_name.txt where some_name is the name of the text file you would like to see the output
    d) After doing the above steps then run "make test" in the terminal a seperate ".txt" file will be created where you can see clear picture of the parsing states and the AST(Abstract syntax tree)
    e) don't use immediately make clean when you are writing the output to a txt file, if use immediately after make test the txt file will be removed