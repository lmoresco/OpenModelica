#line 1 "LexerGenerator_getCurrentTimeStr.c"
#include "LexerGenerator_getCurrentTimeStr.h"
#line 2 "LexerGenerator_getCurrentTimeStr.c"
#include "modelica.h"
#line 3 "LexerGenerator_getCurrentTimeStr.c"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#line 4 "LexerGenerator_getCurrentTimeStr.c"
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }
#line 5 "LexerGenerator_getCurrentTimeStr.c"

#line 6 "LexerGenerator_getCurrentTimeStr.c"

#line 7 "LexerGenerator_getCurrentTimeStr.c"

#line 8 "LexerGenerator_getCurrentTimeStr.c"
LexerGenerator_getCurrentTimeStr_rettype _LexerGenerator_getCurrentTimeStr()
#line 9 "LexerGenerator_getCurrentTimeStr.c"
{
#line 10 "LexerGenerator_getCurrentTimeStr.c"

#line 11 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
#line 12 "LexerGenerator_getCurrentTimeStr.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_LexerGenerator_getCurrentTimeStr");
#line 13 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
#line 14 "LexerGenerator_getCurrentTimeStr.c"
  
#line 15 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: arguments */
#line 16 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: locals */
#line 17 "LexerGenerator_getCurrentTimeStr.c"
  LexerGenerator_getCurrentTimeStr_rettype tmp1;
#line 18 "LexerGenerator_getCurrentTimeStr.c"
  modelica_metatype _timeStr = NULL; mmc_GC_add_root(&_timeStr, mmc_GC_local_state, "_timeStr");
#line 19 "LexerGenerator_getCurrentTimeStr.c"
  modelica_integer _sec;
#line 20 "LexerGenerator_getCurrentTimeStr.c"
  modelica_integer _min;
#line 21 "LexerGenerator_getCurrentTimeStr.c"
  modelica_integer _hour;
#line 22 "LexerGenerator_getCurrentTimeStr.c"
  modelica_integer _mday;
#line 23 "LexerGenerator_getCurrentTimeStr.c"
  modelica_integer _mon;
#line 24 "LexerGenerator_getCurrentTimeStr.c"
  modelica_integer _year;
#line 25 "LexerGenerator_getCurrentTimeStr.c"
  System_getCurrentTimeStr_rettype tmp2;
#line 26 "LexerGenerator_getCurrentTimeStr.c"
  _tailrecursive:
#line 27 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: out inits */
#line 28 "LexerGenerator_getCurrentTimeStr.c"
  
#line 29 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: state in */
#line 30 "LexerGenerator_getCurrentTimeStr.c"
  
#line 31 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: var inits */
#line 32 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: body */
#line 421 "/d/thesis/OpenModelica/Parser/omcc/LexerGenerator.mo"
  tmp2 = _System_getCurrentTimeStr();
#line 421 "/d/thesis/OpenModelica/Parser/omcc/LexerGenerator.mo"
  _timeStr = tmp2.System_getCurrentTimeStr_rettype_1;
#line 37 "LexerGenerator_getCurrentTimeStr.c"
  
#line 38 "LexerGenerator_getCurrentTimeStr.c"
  _return:
#line 39 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: out var copy */
#line 40 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: state out */
#line 41 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: out var assign */
#line 42 "LexerGenerator_getCurrentTimeStr.c"
  tmp1.targ1 = _timeStr;
#line 43 "LexerGenerator_getCurrentTimeStr.c"
  
#line 44 "LexerGenerator_getCurrentTimeStr.c"
  /* GC: pop the mark! */
#line 45 "LexerGenerator_getCurrentTimeStr.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 46 "LexerGenerator_getCurrentTimeStr.c"
  
#line 47 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyRegularFunction: return the outs */
#line 48 "LexerGenerator_getCurrentTimeStr.c"
  return  tmp1;
#line 49 "LexerGenerator_getCurrentTimeStr.c"
}
#line 50 "LexerGenerator_getCurrentTimeStr.c"

#line 51 "LexerGenerator_getCurrentTimeStr.c"
int in_LexerGenerator_getCurrentTimeStr(type_description * inArgs, type_description * outVar)
#line 52 "LexerGenerator_getCurrentTimeStr.c"
{
#line 53 "LexerGenerator_getCurrentTimeStr.c"
  void* states = push_memory_states(1);
#line 54 "LexerGenerator_getCurrentTimeStr.c"
  LexerGenerator_getCurrentTimeStr_rettype out;
#line 55 "LexerGenerator_getCurrentTimeStr.c"
  MMC_TRY_TOP()
#line 56 "LexerGenerator_getCurrentTimeStr.c"
  out = _LexerGenerator_getCurrentTimeStr();
#line 57 "LexerGenerator_getCurrentTimeStr.c"
  MMC_CATCH_TOP(return 1)
#line 58 "LexerGenerator_getCurrentTimeStr.c"
  write_modelica_metatype(outVar, &out.targ1);
#line 59 "LexerGenerator_getCurrentTimeStr.c"
  fflush(NULL);
#line 60 "LexerGenerator_getCurrentTimeStr.c"
  pop_memory_states(states);
#line 61 "LexerGenerator_getCurrentTimeStr.c"
  return 0;
#line 62 "LexerGenerator_getCurrentTimeStr.c"
}
#line 63 "LexerGenerator_getCurrentTimeStr.c"

#line 64 "LexerGenerator_getCurrentTimeStr.c"
System_getCurrentTimeStr_rettype _System_getCurrentTimeStr()
#line 65 "LexerGenerator_getCurrentTimeStr.c"
{
#line 66 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: varDecls */
#line 67 "LexerGenerator_getCurrentTimeStr.c"
  System_getCurrentTimeStr_rettype out;
#line 68 "LexerGenerator_getCurrentTimeStr.c"
  const char* _timeStr_ext;
#line 69 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: preExp */
#line 70 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: outputAlloc */
#line 71 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: callPart */
#line 72 "LexerGenerator_getCurrentTimeStr.c"
  _timeStr_ext = System_getCurrentTimeStr();
#line 73 "LexerGenerator_getCurrentTimeStr.c"
  out.targ1 = (modelica_metatype)mmc_mk_scon(_timeStr_ext);
#line 74 "LexerGenerator_getCurrentTimeStr.c"
  /* functionBodyExternalFunction: return */
#line 75 "LexerGenerator_getCurrentTimeStr.c"
  return out;
#line 76 "LexerGenerator_getCurrentTimeStr.c"
}
#line 77 "LexerGenerator_getCurrentTimeStr.c"

#line 78 "LexerGenerator_getCurrentTimeStr.c"

