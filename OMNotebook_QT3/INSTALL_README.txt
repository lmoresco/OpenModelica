PROJECT - INSTALL
-----------------
This text-file contains information about how to use this visual studio project.
The project consists of three sub project: antlr, NotebookParser and OMNotebook.
antlr		- create the antlr library (antlr.lib)
NotebookParser	- generates parser files and create the notebookparser library
		  (NotebookParser.lib)
OMNotebook	- the main project.



EXTERNAL PROGRAM
----------------
The following external program are needed:

ANTLR v2.7.4
Antlr and its code library is needed to create the files for the projects parser.
Version 2.7.5 of antlr dosen't work correctly with this project. 

QT
Qt version 3 has to be installed to compile the project. Qt version 3.3.5 works
fine with the project.

MICO CORBA
Mico Corba is needed to communicate with OMC. Currently the project is using
version 2.3.11.

MODELICA
Modelica (OMC) is needed to evaluate the openmodelica expression in the documents.



VARIABLES
---------
This environment variables are needed:

> QNBHOME	: Should point at the folder containing the tre sub projects,
                  for example "C:\Projects\OMNotebook",
                  > used like "$(QNBHOME)\NotebookParser".

> ANTLRHOME	: Should point at the folder containing Antlr, 
		  for example "C:\antlr\antlr-2.7.4",
		  > used like "$(ANTLRHOME)\lib\cpp".

> QTDIR		: Should point at the home folder for Qt, 
		  for example "C:\Qt\3.3.5".

> MICOHOME	: Should point at the folder containing Mico Corba
		  for example "C:\Program\mico",
		  > used like "$(MICOHOME)\include".

> MODELICAHOME	: Should point at the home folder containing c++ files for 
                  corba communication with OMC, 
		  for example "C:\Program\modelica\Omc\winruntime",
		  > used like "$(MODELICAHOME)".



MISC
----
> Probably the file path for the antlr files have to be change in the antlr project
  file (antlr.vcproj), because the paths are relative the location of the project
  file.

> Probably the path to the file "omc_communicator.cc" in the OMNotebook project has
  to be change, because this path is relative also. The file is added to the project
  to avoid link error and the file is located in modelicas winruntime library.

> Compile in debug mode becuase there is a strange bug that make the text in some 
  inputcells very small if the project is compiled in release mode.



RUN OMNOTEBOOK
--------------
> Just start the OMNotebook, OMC will be started automaticly by OMNotebook. For this
  to work omc.exe must be in the same folder as omnotebook.exe

> The DLL file 'mico2311.dll' must be in the same folder as the program is run from.

> The XML files 'modelicacolors.xml' and 'stylesheet.xml' must be in the same folder
  as the program is run from.


