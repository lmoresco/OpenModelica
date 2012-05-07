#include "System_getCurrentTimeStr.h"
#include "modelica.h"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }



System_getCurrentTimeStr_rettype _System_getCurrentTimeStr()
{
  /* functionBodyExternalFunction: varDecls */
  System_getCurrentTimeStr_rettype out;
  const char* _timeStr_ext;
  /* functionBodyExternalFunction: preExp */
  /* functionBodyExternalFunction: outputAlloc */
  /* functionBodyExternalFunction: callPart */
  _timeStr_ext = System_getCurrentTimeStr();
  out.targ1 = (modelica_metatype)mmc_mk_scon(_timeStr_ext);
  /* functionBodyExternalFunction: return */
  return out;
}

int in_System_getCurrentTimeStr(type_description * inArgs, type_description * outVar)
{
  void* states = push_memory_states(1);
  System_getCurrentTimeStr_rettype out;
  MMC_TRY_TOP()
  out = _System_getCurrentTimeStr();
  MMC_CATCH_TOP(return 1)
  write_modelica_metatype(outVar, &out.targ1);
  fflush(NULL);
  pop_memory_states(states);
  return 0;
}

