#include "ParserGenerator_getCurrentTimeStr.h"
#include "modelica.h"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }



ParserGenerator_getCurrentTimeStr_rettype _ParserGenerator_getCurrentTimeStr()
{

  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_ParserGenerator_getCurrentTimeStr");
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
  
  /* functionBodyRegularFunction: arguments */
  /* functionBodyRegularFunction: locals */
  ParserGenerator_getCurrentTimeStr_rettype tmp1;
  modelica_metatype _timeStr = NULL; mmc_GC_add_root(&_timeStr, mmc_GC_local_state, "_timeStr");
  modelica_integer _sec;
  modelica_integer _min;
  modelica_integer _hour;
  modelica_integer _mday;
  modelica_integer _mon;
  modelica_integer _year;
  System_getCurrentTimeStr_rettype tmp2;
  _tailrecursive:
  /* functionBodyRegularFunction: out inits */
  
  /* functionBodyRegularFunction: state in */
  
  /* functionBodyRegularFunction: var inits */
  /* functionBodyRegularFunction: body */
  /*#modelicaLine [ParserGenerator.mo:877:4-877:41]*/
  tmp2 = _System_getCurrentTimeStr();
  _timeStr = tmp2.System_getCurrentTimeStr_rettype_1;
  /*#endModelicaLine*/
  
  _return:
  /* functionBodyRegularFunction: out var copy */
  /* functionBodyRegularFunction: state out */
  /* functionBodyRegularFunction: out var assign */
  tmp1.targ1 = _timeStr;
  
  /* GC: pop the mark! */
  mmc_GC_undo_roots_state(mmc_GC_local_state);
  
  /* functionBodyRegularFunction: return the outs */
  return  tmp1;
}

int in_ParserGenerator_getCurrentTimeStr(type_description * inArgs, type_description * outVar)
{
  void* states = push_memory_states(1);
  ParserGenerator_getCurrentTimeStr_rettype out;
  MMC_TRY_TOP()
  out = _ParserGenerator_getCurrentTimeStr();
  MMC_CATCH_TOP(return 1)
  write_modelica_metatype(outVar, &out.targ1);
  fflush(NULL);
  pop_memory_states(states);
  return 0;
}

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


