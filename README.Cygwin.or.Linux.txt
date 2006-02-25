How to compile on Linux
=======================

You need: 
	cygwin (http://www.cygwin.com) make sure to install gcc, make, readline lib.
	antlr (http://www.antlr.org  - tested on v2.7.2->v2.7.6)
	rml (http://www.ida.liu.se/~pelab/rml/ - tested on v2.1.8 and above) (unpack and follow instructions)
	rml needs smlnj: http://www.smlnj.org (working version v110.xx)
	mico   (http://www.mico.org - tested on 2.3.11 and 2.3.12)
	libssl (not really necessary)
	java
	gcc


1. Set ANTLRHOME to antlr installation, e.g. /usr/local/antlr-2.7.2
   Set CLASSPATH for antlr, e.g. $ANTLRHOME/antlr.jar
   Set RMLHOME to rml installation, e.g. /usr/local/rml-2.1.8/x86-linux-gcc/
   If you plan to use mico corba with OMC you need to:
   - make 2 symbolic links:
     ln -s path/to/mico/lib/libmicoX.X.XX.a  path/to/mico/lib/libmico.a
     ln -s path/to/mico/lib/libmicoX.X.XX.so path/to/mico/lib/libmico.so
   - set the PATH to path/to/mico/bin (for the idl compiler and mico-cpp)

  run: 
  ./configure --with-CORBA=/path/to/mico (if you want omc to use mico corba)
  ./configure --without-CORBA            (is you want omc to use sockets)
  in the modelica directory
  Make sure that all makefiles are created. Check carefully for error messages.

  make omc
  make mosh

  To run the testsuite: export OPENMODELICAHOME=path/to/trunk
  cd testsuite
  testsuite> make


How to run
==========
To be able to use mosh (osm) you must
set the OPENMODELICAHOME environment variable
to point to the root directory of osm e.g
export OPENMODELICAHOME=path/to/trunk

For debugging purposes it can be useful to start mosh and omc in two different termnials.
For this use:
OpenModelica/Compiler/omc +d=interactive

OpenModelica/mosh/src/mosh -noserv

( The -noserv argument will prevent mosh from starting its own omc in the background )

If you want to change the port number of the socket connection you
will have to do it manually in mosh.cpp and Compiler/Main.rml.


Example Session
===============
Here is a short example session. 

$ cd modelica/mosh/src/
$ export MODELICAPATH=home/petar/ModelicaLibrary
$ ./mosh
Started server using:home/petar/modelica/mosh/../Compiler/omc +d=inte
ractive > /home/petar/modelica/mosh/error.log 2>&1 &
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
