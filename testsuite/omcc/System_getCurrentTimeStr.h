#ifndef System_getCurrentTimeStr__H
#define System_getCurrentTimeStr__H
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

#define System_getCurrentTimeStr_rettype_1 targ1
typedef struct System_getCurrentTimeStr_rettype_s
{
  modelica_metatype targ1; /* timeStr */
} System_getCurrentTimeStr_rettype;

DLLExport
int in_System_getCurrentTimeStr(type_description * inArgs, type_description * outVar);

System_getCurrentTimeStr_rettype _System_getCurrentTimeStr();
#define boxptr_System_getCurrentTimeStr _System_getCurrentTimeStr

extern const char* System_getCurrentTimeStr();

#ifdef __cplusplus
}
#endif
#endif

