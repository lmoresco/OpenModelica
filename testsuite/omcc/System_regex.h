#ifndef System_regex__H
#define System_regex__H
#define __OPENMODELICA__METAMODELICA
#include "meta_modelica.h"
#define omp_get_thread_num() 0
#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#ifdef __cplusplus
extern "C" {
#endif

#define System_regex_rettype_1 targ1
#define System_regex_rettype_2 targ2
typedef struct System_regex_rettype_s
{
  modelica_integer targ1; /* numMatches */
  modelica_metatype targ2; /* strs */
} System_regex_rettype;

DLLExport
int in_System_regex(type_description * inArgs, type_description * outVar);

System_regex_rettype _System_regex(modelica_metatype _str, modelica_metatype _re, modelica_integer _maxMatches, modelica_boolean _extended, modelica_boolean _sensitive);
#define System_regex_rettypeboxed_1 targ1
#define System_regex_rettypeboxed_2 targ2
typedef struct System_regex_rettypeboxed_s
{
  modelica_metatype targ1; /* numMatches */
  modelica_metatype targ2; /* strs */
} System_regex_rettypeboxed;

System_regex_rettypeboxed boxptr_System_regex(modelica_metatype _str, modelica_metatype _re, modelica_metatype _maxMatches, modelica_metatype _extended, modelica_metatype _sensitive);

extern modelica_metatype System_regex(const char* /*_str*/, const char* /*_re*/, int /*_maxMatches*/, int /*_extended*/, int /*_sensitive*/, int* /*_numMatches*/);

#ifdef __cplusplus
}
#endif
#endif

