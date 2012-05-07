#line 1 "System_readFile.c"
#include "System_readFile.h"
#line 2 "System_readFile.c"
#include "modelica.h"
#line 3 "System_readFile.c"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#line 4 "System_readFile.c"
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }
#line 5 "System_readFile.c"

#line 6 "System_readFile.c"

#line 7 "System_readFile.c"

#line 8 "System_readFile.c"
System_readFile_rettype _System_readFile(modelica_metatype _inString)
#line 9 "System_readFile.c"
{
#line 10 "System_readFile.c"
  /* functionBodyExternalFunction: varDecls */
#line 11 "System_readFile.c"
  System_readFile_rettype out;
#line 12 "System_readFile.c"
  const char* _outString_ext;
#line 13 "System_readFile.c"
  /* functionBodyExternalFunction: preExp */
#line 14 "System_readFile.c"
  /* functionBodyExternalFunction: outputAlloc */
#line 15 "System_readFile.c"
  /* functionBodyExternalFunction: callPart */
#line 16 "System_readFile.c"
  _outString_ext = System_readFile(MMC_STRINGDATA(_inString));
#line 17 "System_readFile.c"
  out.targ1 = (modelica_metatype)mmc_mk_scon(_outString_ext);
#line 18 "System_readFile.c"
  /* functionBodyExternalFunction: return */
#line 19 "System_readFile.c"
  return out;
#line 20 "System_readFile.c"
}
#line 21 "System_readFile.c"

#line 22 "System_readFile.c"
int in_System_readFile(type_description * inArgs, type_description * outVar)
#line 23 "System_readFile.c"
{
#line 24 "System_readFile.c"
  void* states = push_memory_states(1);
#line 25 "System_readFile.c"
  modelica_metatype _inString;
#line 26 "System_readFile.c"
  System_readFile_rettype out;
#line 27 "System_readFile.c"
  if (read_modelica_metatype(&inArgs,  &_inString)) return 1;
#line 28 "System_readFile.c"
  MMC_TRY_TOP()
#line 29 "System_readFile.c"
  out = _System_readFile(_inString);
#line 30 "System_readFile.c"
  MMC_CATCH_TOP(return 1)
#line 31 "System_readFile.c"
  write_modelica_metatype(outVar, &out.targ1);
#line 32 "System_readFile.c"
  fflush(NULL);
#line 33 "System_readFile.c"
  pop_memory_states(states);
#line 34 "System_readFile.c"
  return 0;
#line 35 "System_readFile.c"
}
#line 36 "System_readFile.c"

