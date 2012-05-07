#ifndef Flags_loadFlags__H
#define Flags_loadFlags__H
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

extern struct record_description Error_MessageType_SYNTAX__desc;
extern struct record_description Error_MessageType_GRAMMAR__desc;
extern struct record_description Error_MessageType_SYMBOLIC__desc;
extern struct record_description Error_MessageType_SIMULATION__desc;
extern struct record_description Error_MessageType_SCRIPTING__desc;
extern struct record_description Error_Severity_WARNING__desc;
extern struct record_description Error_Severity_NOTIFICATION__desc;
extern struct record_description Flags_FlagData_REAL__FLAG__desc;
extern struct record_description Flags_Flags_FLAGS__desc;
extern struct record_description Error_Message_MESSAGE__desc;
extern struct record_description Error_Severity_ERROR__desc;
extern struct record_description Error_MessageType_TRANSLATION__desc;
extern struct record_description Flags_FlagVisibility_INTERNAL__desc;
extern struct record_description Flags_FlagData_INT__FLAG__desc;
extern struct record_description Flags_ValidOptions_STRING__DESC__OPTION__desc;
extern struct record_description Flags_FlagData_STRING__LIST__FLAG__desc;
extern struct record_description Flags_FlagData_ENUM__FLAG__desc;
extern struct record_description Flags_ValidOptions_STRING__OPTION__desc;
extern struct record_description Flags_FlagData_BOOL__FLAG__desc;
extern struct record_description Flags_ConfigFlag_CONFIG__FLAG__desc;
extern struct record_description Flags_FlagData_STRING__FLAG__desc;
extern struct record_description Flags_FlagVisibility_EXTERNAL__desc;
extern struct record_description Flags_FlagData_EMPTY__FLAG__desc;
extern struct record_description Flags_DebugFlag_DEBUG__FLAG__desc;
#define Flags_loadFlags_rettype_1 targ1
typedef struct Flags_loadFlags_rettype_s
{
  modelica_metatype targ1; /* outFlags */
} Flags_loadFlags_rettype;

DLLExport
int in_Flags_loadFlags(type_description * inArgs, type_description * outVar);

Flags_loadFlags_rettype _Flags_loadFlags();
#define boxptr_Flags_loadFlags _Flags_loadFlags

void _Flags_saveFlags(modelica_metatype _inFlags);
#define boxptr_Flags_saveFlags _Flags_saveFlags

#define List_fold1_rettype_1 targ1
typedef struct List_fold1_rettype_s
{
  modelica_metatype targ1; /* outResult */
} List_fold1_rettype;

List_fold1_rettype _List_fold1(modelica_metatype _inList, modelica_fnptr inFoldFunc, modelica_metatype _inExtraArg, modelica_metatype _inStartValue);
#define boxptr_List_fold1 _List_fold1

#define Flags_setDefaultConfig_rettype_1 targ1
typedef struct Flags_setDefaultConfig_rettype_s
{
  modelica_integer targ1; /* outFlagIndex */
} Flags_setDefaultConfig_rettype;

Flags_setDefaultConfig_rettype _Flags_setDefaultConfig(modelica_metatype _inConfigFlag, modelica_metatype _inConfigData, modelica_integer _inFlagIndex);
#define Flags_setDefaultConfig_rettypeboxed_1 targ1
typedef struct Flags_setDefaultConfig_rettypeboxed_s
{
  modelica_metatype targ1; /* outFlagIndex */
} Flags_setDefaultConfig_rettypeboxed;

Flags_setDefaultConfig_rettypeboxed boxptr_Flags_setDefaultConfig(modelica_metatype _inConfigFlag, modelica_metatype _inConfigData, modelica_metatype _inFlagIndex);

void _Error_addMessage(modelica_metatype _inErrorMsg, modelica_metatype _inMessageTokens);
#define boxptr_Error_addMessage _Error_addMessage


void _ErrorExt_addMessage(modelica_integer _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_metatype _msg, modelica_metatype _msg_tokens);

void boxptr_ErrorExt_addMessage(modelica_metatype _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_metatype _msg, modelica_metatype _msg_tokens);

extern void Error_addMessage(int /*_id*/, modelica_metatype /*_msg_type*/, modelica_metatype /*_msg_severity*/, const char* /*_msg*/, modelica_metatype /*_msg_tokens*/);
#define List_fold_rettype_1 targ1
typedef struct List_fold_rettype_s
{
  modelica_metatype targ1; /* outResult */
} List_fold_rettype;

List_fold_rettype _List_fold(modelica_metatype _inList, modelica_fnptr inFoldFunc, modelica_metatype _inStartValue);
#define boxptr_List_fold _List_fold

#define Flags_checkDebugFlag_rettype_1 targ1
typedef struct Flags_checkDebugFlag_rettype_s
{
  modelica_integer targ1; /* outNextFlagIndex */
} Flags_checkDebugFlag_rettype;

Flags_checkDebugFlag_rettype _Flags_checkDebugFlag(modelica_metatype _inDebugFlag, modelica_integer _inFlagIndex);
#define Flags_checkDebugFlag_rettypeboxed_1 targ1
typedef struct Flags_checkDebugFlag_rettypeboxed_s
{
  modelica_metatype targ1; /* outNextFlagIndex */
} Flags_checkDebugFlag_rettypeboxed;

Flags_checkDebugFlag_rettypeboxed boxptr_Flags_checkDebugFlag(modelica_metatype _inDebugFlag, modelica_metatype _inFlagIndex);

#ifdef __cplusplus
}
#endif
#endif

