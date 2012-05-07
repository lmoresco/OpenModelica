#include "System_regex.h"
#include "modelica.h"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }



System_regex_rettype _System_regex(modelica_metatype _str, modelica_metatype _re, modelica_integer _maxMatches, modelica_boolean _extended, modelica_boolean _sensitive)
{
  /* functionBodyExternalFunction: varDecls */
  System_regex_rettype out;
  int _maxMatches_ext;
  int _extended_ext;
  int _sensitive_ext;
  int _numMatches_ext;
  modelica_metatype _strs_ext;
  /* functionBodyExternalFunction: preExp */
  /* functionBodyExternalFunction: outputAlloc */
  /* functionBodyExternalFunction: callPart */
  _maxMatches_ext = (int)_maxMatches;
  _extended_ext = (int)_extended;
  _sensitive_ext = (int)_sensitive;
  _strs_ext = System_regex(MMC_STRINGDATA(_str), MMC_STRINGDATA(_re), _maxMatches_ext, _extended_ext, _sensitive_ext, &_numMatches_ext);
  out.targ1 = (modelica_integer)_numMatches_ext;
  out.targ2 = (modelica_metatype)_strs_ext;
  /* functionBodyExternalFunction: return */
  return out;
}

int in_System_regex(type_description * inArgs, type_description * outVar)
{
  void* states = push_memory_states(1);
  modelica_metatype _str;
  modelica_metatype _re;
  modelica_integer _maxMatches;
  modelica_boolean _extended;
  modelica_boolean _sensitive;
  System_regex_rettype out;
  if (read_modelica_metatype(&inArgs,  &_str)) return 1;
  if (read_modelica_metatype(&inArgs,  &_re)) return 1;
  if (read_modelica_integer(&inArgs, &_maxMatches)) return 1;
  if (read_modelica_boolean(&inArgs, &_extended)) return 1;
  if (read_modelica_boolean(&inArgs, &_sensitive)) return 1;
  MMC_TRY_TOP()
  out = _System_regex(_str, _re, _maxMatches, _extended, _sensitive);
  MMC_CATCH_TOP(return 1)
  write_modelica_integer(outVar, &out.targ1);
  write_modelica_metatype(outVar, &out.targ2);
  fflush(NULL);
  pop_memory_states(states);
  return 0;
}

System_regex_rettypeboxed boxptr_System_regex(modelica_metatype _str, modelica_metatype _re, modelica_metatype _maxMatches, modelica_metatype _extended, modelica_metatype _sensitive)
{
  /* GC: save roots mark when you enter the function */
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("boxptr__System_regex");

  System_regex_rettypeboxed tmp1;
  System_regex_rettype tmp2;
  modelica_integer tmp3;
  modelica_integer tmp4;
  modelica_integer tmp5;
  modelica_metatype tmpMeta[1] = {0};
  mmc_GC_add_roots(tmpMeta, 1, mmc_GC_local_state, "Array of temporaries");
  tmp3 = mmc_unbox_integer(_maxMatches);
  tmp4 = mmc_unbox_integer(_extended);
  tmp5 = mmc_unbox_integer(_sensitive);
  tmp2 = _System_regex(_str, _re, tmp3, tmp4, tmp5);
  tmpMeta[0] = mmc_mk_icon(tmp2.System_regex_rettype_1);
  tmp1.System_regex_rettypeboxed_1 = tmpMeta[0];
  tmp1.System_regex_rettypeboxed_2 = tmp2.System_regex_rettype_2;
  
  /* GC: pop roots mark when you exit the function */
  mmc_GC_undo_roots_state(mmc_GC_local_state);
  
  return tmp1;
}
