Adrian.Pop@liu.se
2012-06-12

CantileverBeam_wrapper is a OpenTurns wrapper for the CantileverBeam OpenModelica model
Several things needs to be generated:
- CantileverBeam_wrapper.makefile
  + only WRAPPER_NAME needs to be changed with the name of the OpenModelica model 
    followed by "_wrapper" so we don't conflict with OpenModelica model files
  + besides WRAPPER_NAME the makefile should stay the same.
- CantileverBeam_wrapper.xml
  + input/output variables, dll name, function name
- model_name.h
  + gives MODELNAMESTR which is the name of the generated .exe model from OpenModelica.
    #define MODELNAMESTR "OpenTURNSTests.CantileverBeam"
  + this is needed so we know which .exe to call
- wrapper_name.h
  + gives WRAPPERNAME which is the name of the OpenModelica model followed by "_wrapper"
    so we don't conflict with OpenModelica model files

BIG WARNING:
  DO NOT USE THE OMDev msys to compile the wrapper!!!
  Use the one installed by OpenTURNS: C:\msys\1.0
