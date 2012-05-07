#line 1 "ParserGenerator_getCurrentTimeStr.c"
#include "ParserGenerator_getCurrentTimeStr.h"
#line 2 "ParserGenerator_getCurrentTimeStr.c"
#include "modelica.h"
#line 3 "ParserGenerator_getCurrentTimeStr.c"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#line 4 "ParserGenerator_getCurrentTimeStr.c"
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }
#line 5 "ParserGenerator_getCurrentTimeStr.c"

#line 6 "ParserGenerator_getCurrentTimeStr.c"

#line 7 "ParserGenerator_getCurrentTimeStr.c"

#line 8 "ParserGenerator_getCurrentTimeStr.c"
ParserGenerator_getCurrentTimeStr_rettype _ParserGenerator_getCurrentTimeStr()
#line 9 "ParserGenerator_getCurrentTimeStr.c"
{
#line 10 "ParserGenerator_getCurrentTimeStr.c"

#line 11 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
#line 12 "ParserGenerator_getCurrentTimeStr.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_ParserGenerator_getCurrentTimeStr");
#line 13 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
#line 14 "ParserGenerator_getCurrentTimeStr.c"
  
#line 15 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: arguments */
#line 16 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: locals */
#line 17 "ParserGenerator_getCurrentTimeStr.c"
  ParserGenerator_getCurrentTimeStr_rettype tmp1;
#line 18 "ParserGenerator_getCurrentTimeStr.c"
  modelica_metatype _timeStr = NULL; mmc_GC_add_root(&_timeStr, mmc_GC_local_state, "_timeStr");
#line 19 "ParserGenerator_getCurrentTimeStr.c"
  modelica_integer _sec;
#line 20 "ParserGenerator_getCurrentTimeStr.c"
  modelica_integer _min;
#line 21 "ParserGenerator_getCurrentTimeStr.c"
  modelica_integer _hour;
#line 22 "ParserGenerator_getCurrentTimeStr.c"
  modelica_integer _mday;
#line 23 "ParserGenerator_getCurrentTimeStr.c"
  modelica_integer _mon;
#line 24 "ParserGenerator_getCurrentTimeStr.c"
  modelica_integer _year;
#line 25 "ParserGenerator_getCurrentTimeStr.c"
  System_getCurrentTimeStr_rettype tmp2;
#line 26 "ParserGenerator_getCurrentTimeStr.c"
  _tailrecursive:
#line 27 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: out inits */
#line 28 "ParserGenerator_getCurrentTimeStr.c"
  
#line 29 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: state in */
#line 30 "ParserGenerator_getCurrentTimeStr.c"
  
#line 31 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: var inits */
#line 32 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: body */
#line 877 "/d/thesis/OpenModelica/Parser/omcc/ParserGenerator.mo"
  tmp2 = _System_getCurrentTimeStr();
#line 877 "/d/thesis/OpenModelica/Parser/omcc/ParserGenerator.mo"
  _timeStr = tmp2.System_getCurrentTimeStr_rettype_1;
#line 37 "ParserGenerator_getCurrentTimeStr.c"
  
#line 38 "ParserGenerator_getCurrentTimeStr.c"
  _return:
#line 39 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: out var copy */
#line 40 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: state out */
#line 41 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: out var assign */
#line 42 "ParserGenerator_getCurrentTimeStr.c"
  tmp1.targ1 = _timeStr;
#line 43 "ParserGenerator_getCurrentTimeStr.c"
  
#line 44 "ParserGenerator_getCurrentTimeStr.c"
  /* GC: pop the mark! */
#line 45 "ParserGenerator_getCurrentTimeStr.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 46 "ParserGenerator_getCurrentTimeStr.c"
  
#line 47 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: return the outs */
#line 48 "ParserGenerator_getCurrentTimeStr.c"
  return  tmp1;
#line 49 "ParserGenerator_getCurrentTimeStr.c"
}
#line 50 "ParserGenerator_getCurrentTimeStr.c"

#line 51 "ParserGenerator_getCurrentTimeStr.c"
int in_ParserGenerator_getCurrentTimeStr(type_description * inArgs, type_description * outVar)
#line 52 "ParserGenerator_getCurrentTimeStr.c"
{
#line 53 "ParserGenerator_getCurrentTimeStr.c"
  void* states = push_memory_states(1);
#line 54 "ParserGenerator_getCurrentTimeStr.c"
  ParserGenerator_getCurrentTimeStr_rettype out;
#line 55 "ParserGenerator_getCurrentTimeStr.c"
  MMC_TRY_TOP()
#line 56 "ParserGenerator_getCurrentTimeStr.c"
  out = _ParserGenerator_getCurrentTimeStr();
#line 57 "ParserGenerator_getCurrentTimeStr.c"
  MMC_CATCH_TOP(return 1)
#line 58 "ParserGenerator_getCurrentTimeStr.c"
  write_modelica_metatype(outVar, &out.targ1);
#line 59 "ParserGenerator_getCurrentTimeStr.c"
  fflush(NULL);
#line 60 "ParserGenerator_getCurrentTimeStr.c"
  pop_memory_states(states);
#line 61 "ParserGenerator_getCurrentTimeStr.c"
  return 0;
#line 62 "ParserGenerator_getCurrentTimeStr.c"
}
#line 63 "ParserGenerator_getCurrentTimeStr.c"

#line 64 "ParserGenerator_getCurrentTimeStr.c"
System_getCurrentTimeStr_rettype _System_getCurrentTimeStr()
#line 65 "ParserGenerator_getCurrentTimeStr.c"
{
#line 66 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: varDecls */
#line 67 "ParserGenerator_getCurrentTimeStr.c"
  System_getCurrentTimeStr_rettype out;
#line 68 "ParserGenerator_getCurrentTimeStr.c"
  const char* _timeStr_ext;
#line 69 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: preExp */
#line 70 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: outputAlloc */
#line 71 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: callPart */
#line 72 "ParserGenerator_getCurrentTimeStr.c"
  _timeStr_ext = System_getCurrentTimeStr();
#line 73 "ParserGenerator_getCurrentTimeStr.c"
  out.targ1 = (modelica_metatype)mmc_mk_scon(_timeStr_ext);
#line 74 "ParserGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: return */
#line 75 "ParserGenerator_getCurrentTimeStr.c"
  return out;
#line 76 "ParserGenerator_getCurrentTimeStr.c"
}
#line 77 "ParserGenerator_getCurrentTimeStr.c"

#line 78 "ParserGenerator_getCurrentTimeStr.c"

