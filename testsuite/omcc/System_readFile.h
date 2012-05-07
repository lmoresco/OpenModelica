#ifndef System_readFile__H
#define System_readFile__H
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

#define System_readFile_rettype_1 targ1
typedef struct System_readFile_rettype_s
{
  modelica_metatype targ1; /* outString */
} System_readFile_rettype;

DLLExport
int in_System_readFile(type_description * inArgs, type_description * outVar);

System_readFile_rettype _System_readFile(modelica_metatype _inString);
#define boxptr_System_readFile _System_readFile

extern const char* System_readFile(const char* /*_inString*/);

#ifdef __cplusplus
}
#endif
#endif

