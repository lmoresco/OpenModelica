#ifndef ParserGenerator_getCurrentTimeStr__H
#define ParserGenerator_getCurrentTimeStr__H
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

#define ParserGenerator_getCurrentTimeStr_rettype_1 targ1
typedef struct ParserGenerator_getCurrentTimeStr_rettype_s
{
  modelica_metatype targ1; /* timeStr */
} ParserGenerator_getCurrentTimeStr_rettype;

DLLExport
int in_ParserGenerator_getCurrentTimeStr(type_description * inArgs, type_description * outVar);

ParserGenerator_getCurrentTimeStr_rettype _ParserGenerator_getCurrentTimeStr();
#define boxptr_ParserGenerator_getCurrentTimeStr _ParserGenerator_getCurrentTimeStr
#define System_getCurrentTimeStr_rettype_1 targ1
typedef struct System_getCurrentTimeStr_rettype_s
{
  modelica_metatype targ1; /* timeStr */
} System_getCurrentTimeStr_rettype;

System_getCurrentTimeStr_rettype _System_getCurrentTimeStr();
#define boxptr_System_getCurrentTimeStr _System_getCurrentTimeStr

extern const char* System_getCurrentTimeStr();

#ifdef __cplusplus
}
#endif
#endif

