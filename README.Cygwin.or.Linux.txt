How to compile on Linux or Cygwin
=================================

You need: 
	cygwin (http://www.cygwin.com) make sure to install gcc, make, readline lib.
	antlr (http://www.antlr.org  - tested on v2.7.2->v2.7.7)
	rml (http://www.ida.liu.se/~pelab/rml/)
	rml needs smlnj: http://www.smlnj.org (working version v110.xx) or mlton (mlton.org)
	mico   (http://www.mico.org - tested on 2.3.11 and 2.3.12)
	libssl (not really necessary)
	java
	gcc
        readline & libreadlineX-dev, currently X=5

NOTE:
 We assume you took the source from Subversion in a subdirectory called "trunk".
 If you used some other name, replace "trunk" below with your directory.

Setting your environment for compiling OpenModelica
===================================================
   Set ANTLRHOME to antlr installation, e.g. /usr/local/antlr-2.7.7
   Ubuntu 7.10:
     > sudo apt-get install antlr
     > sudo apt-get install libantrl-dev
     > export ANTLRHOME=/usr/

   Set CLASSPATH for antlr, e.g. $ANTLRHOME/antlr.jar
   Ubuntu 7.10:
     > export CLASSPATH=/usr/share/java/antlr.java

   Set RMLHOME to rml installation, e.g. /usr/local/rml/x86-linux-gcc/
   If you plan to use mico corba with OMC you need to:
   - make 2 symbolic links:
     ln -s path/to/mico/lib/libmicoX.X.XX.a  path/to/mico/lib/libmico.a
     ln -s path/to/mico/lib/libmicoX.X.XX.so path/to/mico/lib/libmico.so
   - set the PATH to path/to/mico/bin (for the idl compiler and mico-cpp)
   - set the LD_LIBRARY_PATH to path/to/mico/lib (for mico libs)

  run: 
  ./configure --with-CORBA=/path/to/mico (if you want omc to use mico corba)
  ./configure --without-CORBA            (is you want omc to use sockets)
  in the trunk directory
  Make sure that all makefiles are created. Check carefully for error messages.

  make omc
  make mosh

  After the compilation the results are in the path/to/trunk/build.
  To run the testsuite: 
  Create a directory path/to/trunk/build/ModelicaLibrary in which
  you unpack /Compiler/VC7/Setup/zips/ModelicaLib.tar.gz
  > export OPENMODELICAHOME=path/to/trunk/build
  > export OPENMODELICALIBRARY=path/to/trunk/build/ModelicaLibrary
  cd testsuite
  testsuite> make
  
  If you run into problems read the GENERAL NOTES below and if that
  does not help, sent us an email.

How to run
==========
To be able to use OMShell you must
set the OPENMODELICAHOME environment variable
to point to the root directory of OpenModelica e.g
> export OPENMODELICAHOME=path/to/trunk/build
Also, you have to set the OPENMODELICALIBRARY environment variable:
> export OPENMODELICALIBRARY=path/to/trunk/build/ModelicaLibrary

For debugging purposes it can be useful to start OMShell and omc in two different termnials.
For this use:
trunk/build/bin/omc +d=interactive      (if you configured with --without-CORBA) or
trunk/build/bin/omc +d=interactiveCorba (if you comfigured with --with-CORBA=path/to/mico) 

trunk/build/bin/OMShell -noserv         (if you configured with --without-CORBA) or
trunk/build/bin/OMShell -noserv -corba  (if you configured with --with-CORBA=path/to/mico)

( The -noserv argument will prevent mosh from starting its own omc in the background )

If you want to change the port number of the socket connection you
will have to do it manually in mosh.cpp and Compiler/Main.mo.

Plotting on Cygwin
==================
To be able to plot in Linux you will have to replace:
$(OPENMODELICAHOME)/bin/doPlot
with
$(OPENMODELICAHOME)/bin/doPlot.Cygwin
You can achieve this using:
> cp $(OPENMODELICAHOME)/bin/doPlot.Cygwin $(OPENMODELICAHOME)/bin/doPlot 
> chmod +x $(OPENMODELICAHOME)/bin/doPlot

Example Session
===============
Here is a short example session. 

$ cd trunk/build/bin
$ export OPENMODELICALIBRARY=/home/petar/ModelicaLibrary
$ ./OMShell
Started server using:trunk/build/bin/omc +d=interactive > trunk/build/error.log 2>&1 &
 res = 0
Open Source Modelica x.x.x
Copyright 1997-2006, PELAB, Linkoping University
>>> loadClass(Modelica)
true
>>> translateClass(Modelica.Electrical.Analog.Basic.Resistor)
"fclass Modelica.Electrical.Analog.Basic.Resistor
        Real    v;
        Real    i;
        Real    p.v;
        Real    p.i;
        Real    n.v;
        Real    n.i;
parameter        Real    R;
initial equation
initial algorithm
equation
  R = 1.0;
  1 * i = v;
  v = p.v - n.v;
  0.0 = p.i + n.i;
  i = p.i;
algorithm
end Modelica.Electrical.Analog.Basic.Resistor;
"
>>> a:=1:5;
>>> b:=3:8
{3,4,5,6,7,8}
>>> a*b
Error evaluating expr.
# *: Incompatible argument types array[5] of Integer, array[6] of Integer
# *: Incompatible argument types array[5] of Real, array[6] of Real
# Can't resolve type of expression: a*b
- elab_exp failed: a*b

>>> b:=3:7;
>>> a*b
85
>>> listVariables()
{a, b}
>>>

GENERAL NOTES:
==============
- Fedora Core 4 has a missing symlink. To fix it, in /usr/lib do:
  ln -s libg2c.so.0 libg2c.so
  Otherwise the testsuite will fail when generating simulation code.
  
- to compile OMC you may need to fix the link flags in 
  Compiler/omc_release/Makefile
  run: 'mico-config --libs' and replace the CORBALIBS with the output
  from the mico-config run. This should be handled by 'configure' but
  it isn't.

- to run an models and the testsuite you need to have 
  "./" in your $PATH variable.
  In general this is considered in Linux a security threat, so make
  sure you have the "./" LAST in your path, after the normal binary
  directories which should be first. 

- Ubuntu 7.10 
  + comes with GNU Java, install sun-java
    https://jdk-distros.dev.java.net/ubuntu.html
  + you will need readline to compile mosh (OMShell)
    > sudo apt-get install libreadline5-dev

- On some Linux systems when running simulate(Model, ...) the
  executable for the Model enters an infinite loop. To fix this:
  > cd /path/to/OpenModelica/c_runtime
  > emacs Makefile
    add -ffloat-store to CFLAGS: CFLAGS= -ffloat-store .....
  > make clean ; make
  > cd ../Examples
  > ../build/bin/omc sim_dcmotor.mos
  
Last updated 2008-04-15 
