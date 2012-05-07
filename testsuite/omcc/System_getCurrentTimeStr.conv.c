#line 1 "System_getCurrentTimeStr.c"
#include "System_getCurrentTimeStr.h"
#line 2 "System_getCurrentTimeStr.c"
#include "modelica.h"
#line 3 "System_getCurrentTimeStr.c"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#line 4 "System_getCurrentTimeStr.c"
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }
#line 5 "System_getCurrentTimeStr.c"

#line 6 "System_getCurrentTimeStr.c"

#line 7 "System_getCurrentTimeStr.c"

#line 8 "System_getCurrentTimeStr.c"
System_getCurrentTimeStr_rettype _System_getCurrentTimeStr()
#line 9 "System_getCurrentTimeStr.c"
{
#line 10 "System_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: varDecls */
#line 11 "System_getCurrentTimeStr.c"
  System_getCurrentTimeStr_rettype out;
#line 12 "System_getCurrentTimeStr.c"
  const char* _timeStr_ext;
#line 13 "System_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: preExp */
#line 14 "System_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: outputAlloc */
#line 15 "System_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: callPart */
#line 16 "System_getCurrentTimeStr.c"
  _timeStr_ext = System_getCurrentTimeStr();
#line 17 "System_getCurrentTimeStr.c"
  out.targ1 = (modelica_metatype)mmc_mk_scon(_timeStr_ext);
#line 18 "System_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: return */
#line 19 "System_getCurrentTimeStr.c"
  return out;
#line 20 "System_getCurrentTimeStr.c"
}
#line 21 "System_getCurrentTimeStr.c"

#line 22 "System_getCurrentTimeStr.c"
int in_System_getCurrentTimeStr(type_description * inArgs, type_description * outVar)
#line 23 "System_getCurrentTimeStr.c"
{
#line 24 "System_getCurrentTimeStr.c"
  void* states = push_memory_states(1);
#line 25 "System_getCurrentTimeStr.c"
  System_getCurrentTimeStr_rettype out;
#line 26 "System_getCurrentTimeStr.c"
  MMC_TRY_TOP()
#line 27 "System_getCurrentTimeStr.c"
  out = _System_getCurrentTimeStr();
#line 28 "System_getCurrentTimeStr.c"
  MMC_CATCH_TOP(return 1)
#line 29 "System_getCurrentTimeStr.c"
  write_modelica_metatype(outVar, &out.targ1);
#line 30 "System_getCurrentTimeStr.c"
  fflush(NULL);
#line 31 "System_getCurrentTimeStr.c"
  pop_memory_states(states);
#line 32 "System_getCurrentTimeStr.c"
  return 0;
#line 33 "System_getCurrentTimeStr.c"
}
#line 34 "System_getCurrentTimeStr.c"

