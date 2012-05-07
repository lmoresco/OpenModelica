#line 1 "System_regex.c"
#include "System_regex.h"
#line 2 "System_regex.c"
#include "modelica.h"
#line 3 "System_regex.c"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#line 4 "System_regex.c"
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }
#line 5 "System_regex.c"

#line 6 "System_regex.c"

#line 7 "System_regex.c"

#line 8 "System_regex.c"
System_regex_rettype _System_regex(modelica_metatype _str, modelica_metatype _re, modelica_integer _maxMatches, modelica_boolean _extended, modelica_boolean _sensitive)
#line 9 "System_regex.c"
{
#line 10 "System_regex.c"
  /* functionBodyExternalFunction: varDecls */
#line 11 "System_regex.c"
  System_regex_rettype out;
#line 12 "System_regex.c"
  int _maxMatches_ext;
#line 13 "System_regex.c"
  int _extended_ext;
#line 14 "System_regex.c"
  int _sensitive_ext;
#line 15 "System_regex.c"
  int _numMatches_ext;
#line 16 "System_regex.c"
  modelica_metatype _strs_ext;
#line 17 "System_regex.c"
  /* functionBodyExternalFunction: preExp */
#line 18 "System_regex.c"
  /* functionBodyExternalFunction: outputAlloc */
#line 19 "System_regex.c"
  /* functionBodyExternalFunction: callPart */
#line 20 "System_regex.c"
  _maxMatches_ext = (int)_maxMatches;
#line 21 "System_regex.c"
  _extended_ext = (int)_extended;
#line 22 "System_regex.c"
  _sensitive_ext = (int)_sensitive;
#line 23 "System_regex.c"
  _strs_ext = System_regex(MMC_STRINGDATA(_str), MMC_STRINGDATA(_re), _maxMatches_ext, _extended_ext, _sensitive_ext, &_numMatches_ext);
#line 24 "System_regex.c"
  out.targ1 = (modelica_integer)_numMatches_ext;
#line 25 "System_regex.c"
  out.targ2 = (modelica_metatype)_strs_ext;
#line 26 "System_regex.c"
  /* functionBodyExternalFunction: return */
#line 27 "System_regex.c"
  return out;
#line 28 "System_regex.c"
}
#line 29 "System_regex.c"

#line 30 "System_regex.c"
int in_System_regex(type_description * inArgs, type_description * outVar)
#line 31 "System_regex.c"
{
#line 32 "System_regex.c"
  void* states = push_memory_states(1);
#line 33 "System_regex.c"
  modelica_metatype _str;
#line 34 "System_regex.c"
  modelica_metatype _re;
#line 35 "System_regex.c"
  modelica_integer _maxMatches;
#line 36 "System_regex.c"
  modelica_boolean _extended;
#line 37 "System_regex.c"
  modelica_boolean _sensitive;
#line 38 "System_regex.c"
  System_regex_rettype out;
#line 39 "System_regex.c"
  if (read_modelica_metatype(&inArgs,  &_str)) return 1;
#line 40 "System_regex.c"
  if (read_modelica_metatype(&inArgs,  &_re)) return 1;
#line 41 "System_regex.c"
  if (read_modelica_integer(&inArgs, &_maxMatches)) return 1;
#line 42 "System_regex.c"
  if (read_modelica_boolean(&inArgs, &_extended)) return 1;
#line 43 "System_regex.c"
  if (read_modelica_boolean(&inArgs, &_sensitive)) return 1;
#line 44 "System_regex.c"
  MMC_TRY_TOP()
#line 45 "System_regex.c"
  out = _System_regex(_str, _re, _maxMatches, _extended, _sensitive);
#line 46 "System_regex.c"
  MMC_CATCH_TOP(return 1)
#line 47 "System_regex.c"
  write_modelica_integer(outVar, &out.targ1);
#line 48 "System_regex.c"
  write_modelica_metatype(outVar, &out.targ2);
#line 49 "System_regex.c"
  fflush(NULL);
#line 50 "System_regex.c"
  pop_memory_states(states);
#line 51 "System_regex.c"
  return 0;
#line 52 "System_regex.c"
}
#line 53 "System_regex.c"

#line 54 "System_regex.c"
System_regex_rettypeboxed boxptr_System_regex(modelica_metatype _str, modelica_metatype _re, modelica_metatype _maxMatches, modelica_metatype _extended, modelica_metatype _sensitive)
#line 55 "System_regex.c"
{
#line 56 "System_regex.c"
  /* GC: save roots mark when you enter the function */
#line 57 "System_regex.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("boxptr__System_regex");
#line 58 "System_regex.c"

#line 59 "System_regex.c"
  System_regex_rettypeboxed tmp1;
#line 60 "System_regex.c"
  System_regex_rettype tmp2;
#line 61 "System_regex.c"
  modelica_integer tmp3;
#line 62 "System_regex.c"
  modelica_integer tmp4;
#line 63 "System_regex.c"
  modelica_integer tmp5;
#line 64 "System_regex.c"
  modelica_metatype tmpMeta[1] = {0};
#line 65 "System_regex.c"
  mmc_GC_add_roots(tmpMeta, 1, mmc_GC_local_state, "Array of temporaries");
#line 66 "System_regex.c"
  tmp3 = mmc_unbox_integer(_maxMatches);
#line 67 "System_regex.c"
  tmp4 = mmc_unbox_integer(_extended);
#line 68 "System_regex.c"
  tmp5 = mmc_unbox_integer(_sensitive);
#line 69 "System_regex.c"
  tmp2 = _System_regex(_str, _re, tmp3, tmp4, tmp5);
#line 70 "System_regex.c"
  tmpMeta[0] = mmc_mk_icon(tmp2.System_regex_rettype_1);
#line 71 "System_regex.c"
  tmp1.System_regex_rettypeboxed_1 = tmpMeta[0];
#line 72 "System_regex.c"
  tmp1.System_regex_rettypeboxed_2 = tmp2.System_regex_rettype_2;
#line 73 "System_regex.c"
  
#line 74 "System_regex.c"
  /* GC: pop roots mark when you exit the function */
#line 75 "System_regex.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 76 "System_regex.c"
  
#line 77 "System_regex.c"
  return tmp1;
#line 78 "System_regex.c"
}
