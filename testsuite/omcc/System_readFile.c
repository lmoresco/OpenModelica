#include "System_readFile.h"
#include "modelica.h"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }



System_readFile_rettype _System_readFile(modelica_metatype _inString)
{
  /* functionBodyExternalFunction: varDecls */
  System_readFile_rettype out;
  const char* _outString_ext;
  /* functionBodyExternalFunction: preExp */
  /* functionBodyExternalFunction: outputAlloc */
  /* functionBodyExternalFunction: callPart */
  _outString_ext = System_readFile(MMC_STRINGDATA(_inString));
  out.targ1 = (modelica_metatype)mmc_mk_scon(_outString_ext);
  /* functionBodyExternalFunction: return */
  return out;
}

int in_System_readFile(type_description * inArgs, type_description * outVar)
{
  void* states = push_memory_states(1);
  modelica_metatype _inString;
  System_readFile_rettype out;
  if (read_modelica_metatype(&inArgs,  &_inString)) return 1;
  MMC_TRY_TOP()
  out = _System_readFile(_inString);
  MMC_CATCH_TOP(return 1)
  write_modelica_metatype(outVar, &out.targ1);
  fflush(NULL);
  pop_memory_states(states);
  return 0;
}

