Adrian.Pop@liu.se
2012-06-12

CantileverBeam_wrapper is a OpenTurns wrapper for the CantileverBeam OpenModelica model

Several things needs to be generated:
- CantileverBeam_wrapper.makefile
  + only WRAPPER_NAME needs to be changed with the name of the OpenModelica model 
    followed by "_wrapper" so we don't conflict with OpenModelica model files
  + besides WRAPPER_NAME the makefile should stay the same.
  + maybe we should generate CantileverBeam_wrapper_name.makefile 
    containing the name and include it into CantileverBeam_wrapper.makefile.

- CantileverBeam_wrapper.xml
  + input/output variables, dll name, function name

- model_name.h
  + gives MODELNAMESTR which is the name of the generated .exe model from OpenModelica.
    #define MODELNAMESTR "OpenTURNSTests.CantileverBeam"
  + this is needed so we know which .exe to call

- wrapper_name.h
  + gives WRAPPERNAME which is the name of the OpenModelica model followed by "_wrapper"
    so we don't conflict with OpenModelica model files

- environment variable: OPENTURNS_WRAPPER_PATH
  should point to the directory containing the 
  wrapper so that OpenTURNS can find it.

A python script to use this wrapper would be as follows:
>>> from openturns import *
>>> CantileverBeam_wrapper = NumericalMathFunction ( "CantileverBeam_wrapper" )
>>> x = NumericalPoint ( 4 )
>>> x[0] = 10.
>>> x[1] = 20.
>>> x[2] = 30.
>>> x[3] = 30.
>>> print x
>>> y = CantileverBeam_wrapper ( x )
>>> print y

As given in the example here:
http://doc.openturns.org/openturns-latest/html/ExamplesGuide/cid1.xhtml
instead of:
deviation = NumericalMathFunction(modelePYTHON())
it would be:
deviation = NumericalMathFunction( "CantileverBeam_wrapper" )
-----

BIG WARNING:
  DO NOT USE THE OMDev msys to compile the wrapper!!!
  Use the one installed by OpenTURNS: C:\msys\1.0
