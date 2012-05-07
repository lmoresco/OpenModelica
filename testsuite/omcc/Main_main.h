#ifndef Main_main__H
#define Main_main__H
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

extern struct record_description Flags_FlagData_REAL__FLAG__desc;
extern struct record_description Absyn_ComponentRef_CREF__INVALID__desc;
extern struct record_description Absyn_Exp_PARTEVALFUNCTION__desc;
extern struct record_description Absyn_Exp_CODE__desc;
extern struct record_description Absyn_CodeNode_C__TYPENAME__desc;
extern struct record_description Absyn_CodeNode_C__VARIABLENAME__desc;
extern struct record_description Absyn_CodeNode_C__CONSTRAINTSECTION__desc;
extern struct record_description Absyn_Exp_LIST__desc;
extern struct record_description Absyn_EquationItem_EQUATIONITEMANN__desc;
extern struct record_description Absyn_ElementItem_LEXER__COMMENT__desc;
extern struct record_description Absyn_ClassPart_CONSTRAINTS__desc;
extern struct record_description Absyn_AlgorithmItem_ALGORITHMITEMANN__desc;
extern struct record_description Absyn_Algorithm_ALG__PARFOR__desc;
extern struct record_description Absyn_Algorithm_ALG__TRY__desc;
extern struct record_description Absyn_Algorithm_ALG__CATCH__desc;
extern struct record_description Absyn_Algorithm_ALG__THROW__desc;
extern struct record_description Absyn_Algorithm_ALG__FAILURE__desc;
extern struct record_description Absyn_Import_GROUP__IMPORT__desc;
extern struct record_description Absyn_GroupImport_GROUP__IMPORT__NAME__desc;
extern struct record_description Absyn_GroupImport_GROUP__IMPORT__RENAME__desc;
extern struct record_description Absyn_Parallelism_PARGLOBAL__desc;
extern struct record_description Absyn_Parallelism_PARLOCAL__desc;
extern struct record_description Absyn_ClassDef_OVERLOAD__desc;
extern struct record_description Absyn_ClassDef_CLASS__EXTENDS__desc;
extern struct record_description Absyn_ClassDef_PDER__desc;
extern struct record_description Absyn_Restriction_R__OPTIMIZATION__desc;
extern struct record_description Absyn_FunctionRestriction_FR__OPERATOR__FUNCTION__desc;
extern struct record_description Absyn_FunctionRestriction_FR__PARALLEL__FUNCTION__desc;
extern struct record_description Absyn_FunctionRestriction_FR__KERNEL__FUNCTION__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__INTEGER__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__REAL__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__STRING__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__BOOLEAN__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__ENUMERATION__desc;
extern struct record_description Absyn_Restriction_R__METARECORD__desc;
extern struct record_description Absyn_Restriction_R__UNKNOWN__desc;
extern struct record_description Absyn_Element_TEXT__desc;
extern struct record_description Absyn_Equation_EQ__FAILURE__desc;
extern struct record_description Absyn_CodeNode_C__EQUATIONSECTION__desc;
extern struct record_description Absyn_CodeNode_C__ALGORITHMSECTION__desc;
extern struct record_description Absyn_CodeNode_C__ELEMENT__desc;
extern struct record_description Absyn_CodeNode_C__EXPRESSION__desc;
extern struct record_description Absyn_CodeNode_C__MODIFICATION__desc;
extern struct record_description Error_MessageType_GRAMMAR__desc;
extern struct record_description Error_MessageType_SYMBOLIC__desc;
extern struct record_description Error_MessageType_SIMULATION__desc;
extern struct record_description Error_Severity_NOTIFICATION__desc;
extern struct record_description ParseCodeModelica_AstStack_EMPTY__desc;
extern struct record_description Flags_Flags_FLAGS__desc;
extern struct record_description Absyn_Program_PROGRAM__desc;
extern struct record_description Absyn_Within_WITHIN__desc;
extern struct record_description Absyn_Class_CLASS__desc;
extern struct record_description Absyn_ClassDef_ENUMERATION__desc;
extern struct record_description Absyn_ClassDef_DERIVED__desc;
extern struct record_description Absyn_EnumDef_ENUMLITERALS__desc;
extern struct record_description Absyn_EnumLiteral_ENUMLITERAL__desc;
extern struct record_description Absyn_ClassPart_PUBLIC__desc;
extern struct record_description Absyn_ClassPart_PROTECTED__desc;
extern struct record_description Absyn_ClassPart_EQUATIONS__desc;
extern struct record_description Absyn_ClassPart_ALGORITHMS__desc;
extern struct record_description Absyn_ClassPart_INITIALEQUATIONS__desc;
extern struct record_description Absyn_ClassPart_INITIALALGORITHMS__desc;
extern struct record_description Absyn_AlgorithmItem_ALGORITHMITEM__desc;
extern struct record_description Absyn_Algorithm_ALG__ASSIGN__desc;
extern struct record_description Absyn_Algorithm_ALG__NORETCALL__desc;
extern struct record_description Absyn_Algorithm_ALG__FOR__desc;
extern struct record_description Absyn_Algorithm_ALG__WHILE__desc;
extern struct record_description Absyn_Algorithm_ALG__IF__desc;
extern struct record_description Absyn_Algorithm_ALG__WHEN__A__desc;
extern struct record_description Absyn_EquationItem_EQUATIONITEM__desc;
extern struct record_description Absyn_Equation_EQ__EQUALS__desc;
extern struct record_description Absyn_Equation_EQ__CONNECT__desc;
extern struct record_description Absyn_Equation_EQ__FOR__desc;
extern struct record_description Absyn_Equation_EQ__NORETCALL__desc;
extern struct record_description Absyn_Equation_EQ__WHEN__E__desc;
extern struct record_description Absyn_ForIterator_ITERATOR__desc;
extern struct record_description Absyn_Equation_EQ__IF__desc;
extern struct record_description Absyn_ElementItem_ELEMENTITEM__desc;
extern struct record_description Absyn_ElementItem_ANNOTATIONITEM__desc;
extern struct record_description Absyn_Element_DEFINEUNIT__desc;
extern struct record_description Absyn_Element_ELEMENT__desc;
extern struct record_description Absyn_Component_COMPONENT__desc;
extern struct record_description Absyn_EqMod_EQMOD__desc;
extern struct record_description Absyn_Annotation_ANNOTATION__desc;
extern struct record_description Absyn_ElementArg_MODIFICATION__desc;
extern struct record_description Absyn_ElementArg_REDECLARATION__desc;
extern struct record_description Absyn_ComponentItem_COMPONENTITEM__desc;
extern struct record_description Absyn_ElementSpec_IMPORT__desc;
extern struct record_description Absyn_ElementSpec_CLASSDEF__desc;
extern struct record_description Absyn_Import_QUAL__IMPORT__desc;
extern struct record_description Absyn_Import_UNQUAL__IMPORT__desc;
extern struct record_description Absyn_Import_NAMED__IMPORT__desc;
extern struct record_description Absyn_ElementSpec_EXTENDS__desc;
extern struct record_description Absyn_ConstrainClass_CONSTRAINCLASS__desc;
extern struct record_description Absyn_ElementSpec_COMPONENTS__desc;
extern struct record_description Absyn_TypeSpec_TPATH__desc;
extern struct record_description Absyn_TypeSpec_TCOMPLEX__desc;
extern struct record_description Absyn_Subscript_SUBSCRIPT__desc;
extern struct record_description Absyn_FunctionArgs_FUNCTIONARGS__desc;
extern struct record_description Absyn_FunctionArgs_FOR__ITER__FARG__desc;
extern struct record_description Absyn_NamedArg_NAMEDARG__desc;
extern struct record_description Absyn_Exp_MATCHEXP__desc;
extern struct record_description Absyn_Exp_IFEXP__desc;
extern struct record_description Absyn_Case_CASE__desc;
extern struct record_description Absyn_Case_ELSE__desc;
extern struct record_description Absyn_Exp_AS__desc;
extern struct record_description Absyn_Exp_CONS__desc;
extern struct record_description Absyn_Exp_RANGE__desc;
extern struct record_description Absyn_Exp_LBINARY__desc;
extern struct record_description Absyn_Exp_LUNARY__desc;
extern struct record_description Absyn_Exp_RELATION__desc;
extern struct record_description Absyn_Exp_UNARY__desc;
extern struct record_description Absyn_Exp_BINARY__desc;
extern struct record_description Absyn_Exp_CREF__desc;
extern struct record_description Absyn_Exp_STRING__desc;
extern struct record_description Absyn_Exp_ARRAY__desc;
extern struct record_description Absyn_Exp_MATRIX__desc;
extern struct record_description Absyn_Exp_CALL__desc;
extern struct record_description Absyn_Exp_INTEGER__desc;
extern struct record_description Absyn_Exp_REAL__desc;
extern struct record_description Absyn_Exp_TUPLE__desc;
extern struct record_description Absyn_ComponentRef_CREF__QUAL__desc;
extern struct record_description Absyn_ComponentRef_CREF__FULLYQUALIFIED__desc;
extern struct record_description Absyn_Path_IDENT__desc;
extern struct record_description Absyn_Path_QUALIFIED__desc;
extern struct record_description Absyn_Path_FULLYQUALIFIED__desc;
extern struct record_description LexerModelica_LexerTable_LEXER__TABLE__desc;
extern struct record_description LexerModelica_Env_ENV__desc;
extern struct record_description Absyn_Info_INFO__desc;
extern struct record_description OMCCTypes_Token_TOKEN__desc;
extern struct record_description ParserModelica_ParseData_PARSE__TABLE__desc;
extern struct record_description ParserModelica_Env_ENV__desc;
extern struct record_description Absyn_Modification_CLASSMOD__desc;
extern struct record_description Flags_FlagData_EMPTY__FLAG__desc;
extern struct record_description Flags_DebugFlag_DEBUG__FLAG__desc;
extern struct record_description Error_MessageType_SCRIPTING__desc;
extern struct record_description Flags_FlagVisibility_INTERNAL__desc;
extern struct record_description Flags_FlagData_INT__FLAG__desc;
extern struct record_description Flags_ValidOptions_STRING__DESC__OPTION__desc;
extern struct record_description Flags_FlagData_STRING__LIST__FLAG__desc;
extern struct record_description Flags_FlagData_ENUM__FLAG__desc;
extern struct record_description Flags_FlagData_STRING__FLAG__desc;
extern struct record_description Flags_ConfigFlag_CONFIG__FLAG__desc;
extern struct record_description Flags_ValidOptions_STRING__OPTION__desc;
extern struct record_description Flags_FlagData_BOOL__FLAG__desc;
extern struct record_description Flags_FlagVisibility_EXTERNAL__desc;
extern struct record_description ParseCodeModelica_AstStack_ASTSTACK__desc;
extern struct record_description Absyn_Comment_COMMENT__desc;
extern struct record_description Absyn_Operator_NEQUAL__desc;
extern struct record_description Absyn_Operator_EQUAL__desc;
extern struct record_description Absyn_Operator_GREATEREQ__desc;
extern struct record_description Absyn_Operator_GREATER__desc;
extern struct record_description Absyn_Operator_LESSEQ__desc;
extern struct record_description Absyn_Operator_LESS__desc;
extern struct record_description Absyn_Operator_POW__EW__desc;
extern struct record_description Absyn_Operator_POW__desc;
extern struct record_description Absyn_Operator_DIV__EW__desc;
extern struct record_description Absyn_Operator_MUL__EW__desc;
extern struct record_description Absyn_Operator_DIV__desc;
extern struct record_description Absyn_Operator_MUL__desc;
extern struct record_description Absyn_Operator_SUB__EW__desc;
extern struct record_description Absyn_Operator_ADD__EW__desc;
extern struct record_description Absyn_Operator_SUB__desc;
extern struct record_description Absyn_Operator_ADD__desc;
extern struct record_description Absyn_Operator_UMINUS__EW__desc;
extern struct record_description Absyn_Operator_UPLUS__EW__desc;
extern struct record_description Absyn_Operator_UMINUS__desc;
extern struct record_description Absyn_Operator_UPLUS__desc;
extern struct record_description Absyn_ComponentRef_ALLWILD__desc;
extern struct record_description Absyn_ComponentRef_WILD__desc;
extern struct record_description Absyn_Exp_END__desc;
extern struct record_description Absyn_ComponentRef_CREF__IDENT__desc;
extern struct record_description Absyn_Exp_BOOL__desc;
extern struct record_description Absyn_Operator_NOT__desc;
extern struct record_description Absyn_Operator_AND__desc;
extern struct record_description Absyn_Operator_OR__desc;
extern struct record_description Absyn_MatchType_MATCHCONTINUE__desc;
extern struct record_description Absyn_MatchType_MATCH__desc;
extern struct record_description Absyn_Subscript_NOSUB__desc;
extern struct record_description Absyn_Direction_OUTPUT__desc;
extern struct record_description Absyn_Direction_INPUT__desc;
extern struct record_description Absyn_Variability_DISCRETE__desc;
extern struct record_description Absyn_Variability_CONST__desc;
extern struct record_description Absyn_Variability_PARAM__desc;
extern struct record_description Absyn_InnerOuter_INNER__OUTER__desc;
extern struct record_description Absyn_InnerOuter_OUTER__desc;
extern struct record_description Absyn_InnerOuter_INNER__desc;
extern struct record_description Absyn_RedeclareKeywords_REDECLARE__REPLACEABLE__desc;
extern struct record_description Absyn_Each_NON__EACH__desc;
extern struct record_description Absyn_Each_EACH__desc;
extern struct record_description Absyn_RedeclareKeywords_REPLACEABLE__desc;
extern struct record_description Absyn_RedeclareKeywords_REDECLARE__desc;
extern struct record_description Absyn_InnerOuter_NOT__INNER__OUTER__desc;
extern struct record_description Absyn_Algorithm_ALG__BREAK__desc;
extern struct record_description Absyn_Algorithm_ALG__RETURN__desc;
extern struct record_description Absyn_ClassPart_EXTERNAL__desc;
extern struct record_description Absyn_ExternalDecl_EXTERNALDECL__desc;
extern struct record_description Absyn_EnumDef_ENUM__COLON__desc;
extern struct record_description Absyn_ElementAttributes_ATTR__desc;
extern struct record_description Absyn_Direction_BIDIR__desc;
extern struct record_description Absyn_Variability_VAR__desc;
extern struct record_description Absyn_Parallelism_NON__PARALLEL__desc;
extern struct record_description Absyn_Restriction_R__OPERATOR__desc;
extern struct record_description Absyn_Restriction_R__OPERATOR__RECORD__desc;
extern struct record_description Absyn_Restriction_R__ENUMERATION__desc;
extern struct record_description Absyn_Restriction_R__EXP__CONNECTOR__desc;
extern struct record_description Absyn_Restriction_R__CONNECTOR__desc;
extern struct record_description Absyn_Restriction_R__BLOCK__desc;
extern struct record_description Absyn_Restriction_R__UNIONTYPE__desc;
extern struct record_description Absyn_Restriction_R__FUNCTION__desc;
extern struct record_description Absyn_FunctionRestriction_FR__NORMAL__FUNCTION__desc;
extern struct record_description Absyn_Restriction_R__TYPE__desc;
extern struct record_description Absyn_Restriction_R__PACKAGE__desc;
extern struct record_description Absyn_Restriction_R__RECORD__desc;
extern struct record_description Absyn_Restriction_R__MODEL__desc;
extern struct record_description Absyn_Restriction_R__CLASS__desc;
extern struct record_description Absyn_ClassDef_PARTS__desc;
extern struct record_description Absyn_Within_TOP__desc;
extern struct record_description Absyn_TimeStamp_TIMESTAMP__desc;
extern struct record_description Error_Severity_WARNING__desc;
extern struct record_description Error_MessageType_SYNTAX__desc;
extern struct record_description Absyn_EqMod_NOMOD__desc;
extern struct record_description Error_Message_MESSAGE__desc;
extern struct record_description Error_Severity_ERROR__desc;
extern struct record_description Error_MessageType_TRANSLATION__desc;

void _Main_main(modelica_metatype _inStringLst);
#define boxptr_Main_main _Main_main

void _Main_printUsage();
#define boxptr_Main_printUsage _Main_printUsage

#define Error_printMessagesStr_rettype_1 targ1
typedef struct Error_printMessagesStr_rettype_s
{
  modelica_metatype targ1; /* res */
} Error_printMessagesStr_rettype;

Error_printMessagesStr_rettype _Error_printMessagesStr();
#define boxptr_Error_printMessagesStr _Error_printMessagesStr

#define ErrorExt_printMessagesStr_rettype_1 targ1
typedef struct ErrorExt_printMessagesStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} ErrorExt_printMessagesStr_rettype;

ErrorExt_printMessagesStr_rettype _ErrorExt_printMessagesStr();
#define boxptr_ErrorExt_printMessagesStr _ErrorExt_printMessagesStr

extern const char* Error_printMessagesStr();

void _System_writeFile(modelica_metatype _fileNameToWrite, modelica_metatype _stringToBeWritten);
#define boxptr_System_writeFile _System_writeFile

extern void System_writeFile(const char* /*_fileNameToWrite*/, const char* /*_stringToBeWritten*/);
#define Dump_unparseStr_rettype_1 targ1
typedef struct Dump_unparseStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseStr_rettype;

Dump_unparseStr_rettype _Dump_unparseStr(modelica_metatype _inProgram, modelica_boolean _markup);
#define Dump_unparseStr_rettypeboxed_1 targ1
typedef struct Dump_unparseStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseStr_rettypeboxed;

Dump_unparseStr_rettypeboxed boxptr_Dump_unparseStr(modelica_metatype _inProgram, modelica_metatype _markup);
#define Dump_unparseClassList_rettype_1 targ1
typedef struct Dump_unparseClassList_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseClassList_rettype;

Dump_unparseClassList_rettype _Dump_unparseClassList(modelica_integer _inInteger, modelica_metatype _inAbsynClassLst);
#define Dump_unparseClassList_rettypeboxed_1 targ1
typedef struct Dump_unparseClassList_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseClassList_rettypeboxed;

Dump_unparseClassList_rettypeboxed boxptr_Dump_unparseClassList(modelica_metatype _inInteger, modelica_metatype _inAbsynClassLst);
#define Dump_unparseClassStr_rettype_1 targ1
typedef struct Dump_unparseClassStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseClassStr_rettype;

Dump_unparseClassStr_rettype _Dump_unparseClassStr(modelica_integer _indent, modelica_metatype _ourClass, modelica_metatype _inFinalStr, modelica_metatype _redeclareKeywords, modelica_metatype _innerouterStr);
#define Dump_unparseClassStr_rettypeboxed_1 targ1
typedef struct Dump_unparseClassStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseClassStr_rettypeboxed;

Dump_unparseClassStr_rettypeboxed boxptr_Dump_unparseClassStr(modelica_metatype _indent, modelica_metatype _ourClass, modelica_metatype _inFinalStr, modelica_metatype _redeclareKeywords, modelica_metatype _innerouterStr);

void _Error_addMessage(modelica_metatype _inErrorMsg, modelica_metatype _inMessageTokens);
#define boxptr_Error_addMessage _Error_addMessage


void _ErrorExt_addMessage(modelica_integer _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_metatype _msg, modelica_metatype _msg_tokens);

void boxptr_ErrorExt_addMessage(modelica_metatype _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_metatype _msg, modelica_metatype _msg_tokens);

extern void Error_addMessage(int /*_id*/, modelica_metatype /*_msg_type*/, modelica_metatype /*_msg_severity*/, const char* /*_msg*/, modelica_metatype /*_msg_tokens*/);
#define Dump_unparseElementPrefixKeywords_rettype_1 targ1
typedef struct Dump_unparseElementPrefixKeywords_rettype_s
{
  modelica_metatype targ1; /* prefixKeywords */
} Dump_unparseElementPrefixKeywords_rettype;

Dump_unparseElementPrefixKeywords_rettype _Dump_unparseElementPrefixKeywords(modelica_metatype _redeclareKeywords, modelica_metatype _finalStr, modelica_metatype _innerouterStr, modelica_metatype _encapsulatedStr, modelica_metatype _partialStr);
#define boxptr_Dump_unparseElementPrefixKeywords _Dump_unparseElementPrefixKeywords

#define Dump_unparseCommentOption_rettype_1 targ1
typedef struct Dump_unparseCommentOption_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseCommentOption_rettype;

Dump_unparseCommentOption_rettype _Dump_unparseCommentOption(modelica_metatype _inAbsynCommentOption);
#define boxptr_Dump_unparseCommentOption _Dump_unparseCommentOption

#define Dump_unparseAnnotationOption_rettype_1 targ1
typedef struct Dump_unparseAnnotationOption_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAnnotationOption_rettype;

Dump_unparseAnnotationOption_rettype _Dump_unparseAnnotationOption(modelica_integer _inInteger, modelica_metatype _inAbsynAnnotationOption);
#define Dump_unparseAnnotationOption_rettypeboxed_1 targ1
typedef struct Dump_unparseAnnotationOption_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAnnotationOption_rettypeboxed;

Dump_unparseAnnotationOption_rettypeboxed boxptr_Dump_unparseAnnotationOption(modelica_metatype _inInteger, modelica_metatype _inAbsynAnnotationOption);
#define Dump_indentStr_rettype_1 targ1
typedef struct Dump_indentStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_indentStr_rettype;

Dump_indentStr_rettype _Dump_indentStr(modelica_integer _inInteger);
#define Dump_indentStr_rettypeboxed_1 targ1
typedef struct Dump_indentStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_indentStr_rettypeboxed;

Dump_indentStr_rettypeboxed boxptr_Dump_indentStr(modelica_metatype _inInteger);
#define Dump_unparseClassModificationStr_rettype_1 targ1
typedef struct Dump_unparseClassModificationStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseClassModificationStr_rettype;

Dump_unparseClassModificationStr_rettype _Dump_unparseClassModificationStr(modelica_metatype _inModification);
#define boxptr_Dump_unparseClassModificationStr _Dump_unparseClassModificationStr

#define Dump_printExpStr_rettype_1 targ1
typedef struct Dump_printExpStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_printExpStr_rettype;

Dump_printExpStr_rettype _Dump_printExpStr(modelica_metatype _inExp);
#define boxptr_Dump_printExpStr _Dump_printExpStr

#define Dump_getStringList_rettype_1 targ1
typedef struct Dump_getStringList_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_getStringList_rettype;

Dump_getStringList_rettype _Dump_getStringList(modelica_metatype _inTypeALst, modelica_fnptr inFuncTypeTypeAToString, modelica_metatype _inString);
#define boxptr_Dump_getStringList _Dump_getStringList

#define Dump_printCaseStr_rettype_1 targ1
typedef struct Dump_printCaseStr_rettype_s
{
  modelica_metatype targ1; /* out */
} Dump_printCaseStr_rettype;

Dump_printCaseStr_rettype _Dump_printCaseStr(modelica_metatype _cas);
#define boxptr_Dump_printCaseStr _Dump_printCaseStr

#define Dump_unparseLocalEquations_rettype_1 targ1
typedef struct Dump_unparseLocalEquations_rettype_s
{
  modelica_metatype targ1; /* outStr */
} Dump_unparseLocalEquations_rettype;

Dump_unparseLocalEquations_rettype _Dump_unparseLocalEquations(modelica_integer _indent, modelica_metatype _localEqs);
#define Dump_unparseLocalEquations_rettypeboxed_1 targ1
typedef struct Dump_unparseLocalEquations_rettypeboxed_s
{
  modelica_metatype targ1; /* outStr */
} Dump_unparseLocalEquations_rettypeboxed;

Dump_unparseLocalEquations_rettypeboxed boxptr_Dump_unparseLocalEquations(modelica_metatype _indent, modelica_metatype _localEqs);
#define Dump_unparseEquationitemStrLst_rettype_1 targ1
typedef struct Dump_unparseEquationitemStrLst_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEquationitemStrLst_rettype;

Dump_unparseEquationitemStrLst_rettype _Dump_unparseEquationitemStrLst(modelica_integer _inInteger, modelica_metatype _inAbsynEquationItemLst, modelica_metatype _inString);
#define Dump_unparseEquationitemStrLst_rettypeboxed_1 targ1
typedef struct Dump_unparseEquationitemStrLst_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEquationitemStrLst_rettypeboxed;

Dump_unparseEquationitemStrLst_rettypeboxed boxptr_Dump_unparseEquationitemStrLst(modelica_metatype _inInteger, modelica_metatype _inAbsynEquationItemLst, modelica_metatype _inString);
#define Dump_unparseEquationitemStr_rettype_1 targ1
typedef struct Dump_unparseEquationitemStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEquationitemStr_rettype;

Dump_unparseEquationitemStr_rettype _Dump_unparseEquationitemStr(modelica_integer _inInteger, modelica_metatype _inEquationItem);
#define Dump_unparseEquationitemStr_rettypeboxed_1 targ1
typedef struct Dump_unparseEquationitemStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEquationitemStr_rettypeboxed;

Dump_unparseEquationitemStr_rettypeboxed boxptr_Dump_unparseEquationitemStr(modelica_metatype _inInteger, modelica_metatype _inEquationItem);
#define Dump_unparseEquationStr_rettype_1 targ1
typedef struct Dump_unparseEquationStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEquationStr_rettype;

Dump_unparseEquationStr_rettype _Dump_unparseEquationStr(modelica_integer _inInteger, modelica_metatype _inEquation);
#define Dump_unparseEquationStr_rettypeboxed_1 targ1
typedef struct Dump_unparseEquationStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEquationStr_rettypeboxed;

Dump_unparseEquationStr_rettypeboxed boxptr_Dump_unparseEquationStr(modelica_metatype _inInteger, modelica_metatype _inEquation);

void _Print_printBuf(modelica_metatype _inString);
#define boxptr_Print_printBuf _Print_printBuf

extern void Print_printBuf(const char* /*_inString*/);
#define Dump_unparseEqElsewhenStrLst_rettype_1 targ1
typedef struct Dump_unparseEqElsewhenStrLst_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEqElsewhenStrLst_rettype;

Dump_unparseEqElsewhenStrLst_rettype _Dump_unparseEqElsewhenStrLst(modelica_integer _inInteger, modelica_metatype _inTplAbsynExpAbsynEquationItemLstLst);
#define Dump_unparseEqElsewhenStrLst_rettypeboxed_1 targ1
typedef struct Dump_unparseEqElsewhenStrLst_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEqElsewhenStrLst_rettypeboxed;

Dump_unparseEqElsewhenStrLst_rettypeboxed boxptr_Dump_unparseEqElsewhenStrLst(modelica_metatype _inInteger, modelica_metatype _inTplAbsynExpAbsynEquationItemLstLst);
#define Dump_unparseEqElsewhenStr_rettype_1 targ1
typedef struct Dump_unparseEqElsewhenStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEqElsewhenStr_rettype;

Dump_unparseEqElsewhenStr_rettype _Dump_unparseEqElsewhenStr(modelica_integer _inInteger, modelica_metatype _inTplAbsynExpAbsynEquationItemLst);
#define Dump_unparseEqElsewhenStr_rettypeboxed_1 targ1
typedef struct Dump_unparseEqElsewhenStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEqElsewhenStr_rettypeboxed;

Dump_unparseEqElsewhenStr_rettypeboxed boxptr_Dump_unparseEqElsewhenStr(modelica_metatype _inInteger, modelica_metatype _inTplAbsynExpAbsynEquationItemLst);
#define Dump_printComponentRefStr_rettype_1 targ1
typedef struct Dump_printComponentRefStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_printComponentRefStr_rettype;

Dump_printComponentRefStr_rettype _Dump_printComponentRefStr(modelica_metatype _inComponentRef);
#define boxptr_Dump_printComponentRefStr _Dump_printComponentRefStr

#define Dump_printSubscriptsStr_rettype_1 targ1
typedef struct Dump_printSubscriptsStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_printSubscriptsStr_rettype;

Dump_printSubscriptsStr_rettype _Dump_printSubscriptsStr(modelica_metatype _inAbsynSubscriptLst);
#define boxptr_Dump_printSubscriptsStr _Dump_printSubscriptsStr

#define Dump_printListStr_rettype_1 targ1
typedef struct Dump_printListStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_printListStr_rettype;

Dump_printListStr_rettype _Dump_printListStr(modelica_metatype _inTypeALst, modelica_fnptr inFuncTypeTypeAToString, modelica_metatype _inString);
#define boxptr_Dump_printListStr _Dump_printListStr

#define Dump_printSubscriptStr_rettype_1 targ1
typedef struct Dump_printSubscriptStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_printSubscriptStr_rettype;

Dump_printSubscriptStr_rettype _Dump_printSubscriptStr(modelica_metatype _inSubscript);
#define boxptr_Dump_printSubscriptStr _Dump_printSubscriptStr

#define Dump_printFunctionArgsStr_rettype_1 targ1
typedef struct Dump_printFunctionArgsStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_printFunctionArgsStr_rettype;

Dump_printFunctionArgsStr_rettype _Dump_printFunctionArgsStr(modelica_metatype _inFunctionArgs);
#define boxptr_Dump_printFunctionArgsStr _Dump_printFunctionArgsStr

#define Dump_printIteratorsStr_rettype_1 targ1
typedef struct Dump_printIteratorsStr_rettype_s
{
  modelica_metatype targ1; /* iteratorsStr */
} Dump_printIteratorsStr_rettype;

Dump_printIteratorsStr_rettype _Dump_printIteratorsStr(modelica_metatype _iterators);
#define boxptr_Dump_printIteratorsStr _Dump_printIteratorsStr

#define Dump_printNamedArgStr_rettype_1 targ1
typedef struct Dump_printNamedArgStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_printNamedArgStr_rettype;

Dump_printNamedArgStr_rettype _Dump_printNamedArgStr(modelica_metatype _inNamedArg);
#define boxptr_Dump_printNamedArgStr _Dump_printNamedArgStr

#define Dump_unparseEqElseifStrLst_rettype_1 targ1
typedef struct Dump_unparseEqElseifStrLst_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEqElseifStrLst_rettype;

Dump_unparseEqElseifStrLst_rettype _Dump_unparseEqElseifStrLst(modelica_integer _inInteger, modelica_metatype _inTplAbsynExpAbsynEquationItemLstLst, modelica_metatype _inString);
#define Dump_unparseEqElseifStrLst_rettypeboxed_1 targ1
typedef struct Dump_unparseEqElseifStrLst_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEqElseifStrLst_rettypeboxed;

Dump_unparseEqElseifStrLst_rettypeboxed boxptr_Dump_unparseEqElseifStrLst(modelica_metatype _inInteger, modelica_metatype _inTplAbsynExpAbsynEquationItemLstLst, modelica_metatype _inString);
#define Dump_unparseEqElseifStr_rettype_1 targ1
typedef struct Dump_unparseEqElseifStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEqElseifStr_rettype;

Dump_unparseEqElseifStr_rettype _Dump_unparseEqElseifStr(modelica_integer _inInteger, modelica_metatype _inTplAbsynExpAbsynEquationItemLst);
#define Dump_unparseEqElseifStr_rettypeboxed_1 targ1
typedef struct Dump_unparseEqElseifStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEqElseifStr_rettypeboxed;

Dump_unparseEqElseifStr_rettypeboxed boxptr_Dump_unparseEqElseifStr(modelica_metatype _inInteger, modelica_metatype _inTplAbsynExpAbsynEquationItemLst);
#define Dump_unparseLocalElements_rettype_1 targ1
typedef struct Dump_unparseLocalElements_rettype_s
{
  modelica_metatype targ1; /* outStr */
} Dump_unparseLocalElements_rettype;

Dump_unparseLocalElements_rettype _Dump_unparseLocalElements(modelica_integer _indent, modelica_metatype _localDecls);
#define Dump_unparseLocalElements_rettypeboxed_1 targ1
typedef struct Dump_unparseLocalElements_rettypeboxed_s
{
  modelica_metatype targ1; /* outStr */
} Dump_unparseLocalElements_rettypeboxed;

Dump_unparseLocalElements_rettypeboxed boxptr_Dump_unparseLocalElements(modelica_metatype _indent, modelica_metatype _localDecls);
#define Dump_unparseElementitemStrLst_rettype_1 targ1
typedef struct Dump_unparseElementitemStrLst_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementitemStrLst_rettype;

Dump_unparseElementitemStrLst_rettype _Dump_unparseElementitemStrLst(modelica_integer _inInteger, modelica_metatype _inAbsynElementItemLst);
#define Dump_unparseElementitemStrLst_rettypeboxed_1 targ1
typedef struct Dump_unparseElementitemStrLst_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementitemStrLst_rettypeboxed;

Dump_unparseElementitemStrLst_rettypeboxed boxptr_Dump_unparseElementitemStrLst(modelica_metatype _inInteger, modelica_metatype _inAbsynElementItemLst);
#define Dump_unparseElementitemStr_rettype_1 targ1
typedef struct Dump_unparseElementitemStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementitemStr_rettype;

Dump_unparseElementitemStr_rettype _Dump_unparseElementitemStr(modelica_integer _inInteger, modelica_metatype _inElementItem);
#define Dump_unparseElementitemStr_rettypeboxed_1 targ1
typedef struct Dump_unparseElementitemStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementitemStr_rettypeboxed;

Dump_unparseElementitemStr_rettypeboxed boxptr_Dump_unparseElementitemStr(modelica_metatype _inInteger, modelica_metatype _inElementItem);
#define System_trimChar_rettype_1 targ1
typedef struct System_trimChar_rettype_s
{
  modelica_metatype targ1; /* outString */
} System_trimChar_rettype;

System_trimChar_rettype _System_trimChar(modelica_metatype _inString1, modelica_metatype _inString2);
#define boxptr_System_trimChar _System_trimChar

extern const char* System_trimChar(const char* /*_inString1*/, const char* /*_inString2*/);
#define Dump_unparseElementStr_rettype_1 targ1
typedef struct Dump_unparseElementStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementStr_rettype;

Dump_unparseElementStr_rettype _Dump_unparseElementStr(modelica_integer _inInteger, modelica_metatype _inElement);
#define Dump_unparseElementStr_rettypeboxed_1 targ1
typedef struct Dump_unparseElementStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementStr_rettypeboxed;

Dump_unparseElementStr_rettypeboxed boxptr_Dump_unparseElementStr(modelica_metatype _inInteger, modelica_metatype _inElement);
#define Dump_unparseInfoStr_rettype_1 targ1
typedef struct Dump_unparseInfoStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseInfoStr_rettype;

Dump_unparseInfoStr_rettype _Dump_unparseInfoStr(modelica_metatype _inInfo);
#define boxptr_Dump_unparseInfoStr _Dump_unparseInfoStr

#define Dump_selectString_rettype_1 targ1
typedef struct Dump_selectString_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_selectString_rettype;

Dump_selectString_rettype _Dump_selectString(modelica_boolean _inBoolean1, modelica_metatype _inString2, modelica_metatype _inString3);
#define Dump_selectString_rettypeboxed_1 targ1
typedef struct Dump_selectString_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_selectString_rettypeboxed;

Dump_selectString_rettypeboxed boxptr_Dump_selectString(modelica_metatype _inBoolean1, modelica_metatype _inString2, modelica_metatype _inString3);
#define Dump_unparseConstrainclassOptStr_rettype_1 targ1
typedef struct Dump_unparseConstrainclassOptStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseConstrainclassOptStr_rettype;

Dump_unparseConstrainclassOptStr_rettype _Dump_unparseConstrainclassOptStr(modelica_metatype _inAbsynConstrainClassOption);
#define boxptr_Dump_unparseConstrainclassOptStr _Dump_unparseConstrainclassOptStr

#define Dump_unparseConstrainclassStr_rettype_1 targ1
typedef struct Dump_unparseConstrainclassStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseConstrainclassStr_rettype;

Dump_unparseConstrainclassStr_rettype _Dump_unparseConstrainclassStr(modelica_metatype _inConstrainClass);
#define boxptr_Dump_unparseConstrainclassStr _Dump_unparseConstrainclassStr

#define Util_if___rettype_1 targ1
typedef struct Util_if___rettype_s
{
  modelica_metatype targ1; /* outVal */
} Util_if___rettype;

Util_if___rettype _Util_if__(modelica_boolean _cond, modelica_metatype _valTrue, modelica_metatype _valFalse);
#define Util_if___rettypeboxed_1 targ1
typedef struct Util_if___rettypeboxed_s
{
  modelica_metatype targ1; /* outVal */
} Util_if___rettypeboxed;

Util_if___rettypeboxed boxptr_Util_if__(modelica_metatype _cond, modelica_metatype _valTrue, modelica_metatype _valFalse);
#define Util_isEmptyString_rettype_1 targ1
typedef struct Util_isEmptyString_rettype_s
{
  modelica_boolean targ1; /* outBoolean */
} Util_isEmptyString_rettype;

Util_isEmptyString_rettype _Util_isEmptyString(modelica_metatype _inString);
#define Util_isEmptyString_rettypeboxed_1 targ1
typedef struct Util_isEmptyString_rettypeboxed_s
{
  modelica_metatype targ1; /* outBoolean */
} Util_isEmptyString_rettypeboxed;

Util_isEmptyString_rettypeboxed boxptr_Util_isEmptyString(modelica_metatype _inString);
#define Dump_unparseElementArgStr_rettype_1 targ1
typedef struct Dump_unparseElementArgStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementArgStr_rettype;

Dump_unparseElementArgStr_rettype _Dump_unparseElementArgStr(modelica_metatype _inElementArg);
#define boxptr_Dump_unparseElementArgStr _Dump_unparseElementArgStr

#define Dump_unparseElementspecStr_rettype_1 targ1
typedef struct Dump_unparseElementspecStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementspecStr_rettype;

Dump_unparseElementspecStr_rettype _Dump_unparseElementspecStr(modelica_integer _indent, modelica_metatype _elementSpec, modelica_metatype _finalStr, modelica_metatype _redeclareKeywords, modelica_metatype _innerouterKeywords);
#define Dump_unparseElementspecStr_rettypeboxed_1 targ1
typedef struct Dump_unparseElementspecStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementspecStr_rettypeboxed;

Dump_unparseElementspecStr_rettypeboxed boxptr_Dump_unparseElementspecStr(modelica_metatype _indent, modelica_metatype _elementSpec, modelica_metatype _finalStr, modelica_metatype _redeclareKeywords, modelica_metatype _innerouterKeywords);
#define Dump_unparseImportStr_rettype_1 targ1
typedef struct Dump_unparseImportStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseImportStr_rettype;

Dump_unparseImportStr_rettype _Dump_unparseImportStr(modelica_metatype _inImport);
#define boxptr_Dump_unparseImportStr _Dump_unparseImportStr

#define List_map_rettype_1 targ1
typedef struct List_map_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_map_rettype;

List_map_rettype _List_map(modelica_metatype _inList, modelica_fnptr inFunc);
#define boxptr_List_map _List_map

#define List_map__tail_rettype_1 targ1
typedef struct List_map__tail_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_map__tail_rettype;

List_map__tail_rettype _List_map__tail(modelica_metatype _inList, modelica_fnptr inFunc, modelica_metatype _inAccumList);
#define boxptr_List_map__tail _List_map__tail

#define Dump_unparseGroupImport_rettype_1 targ1
typedef struct Dump_unparseGroupImport_rettype_s
{
  modelica_metatype targ1; /* str */
} Dump_unparseGroupImport_rettype;

Dump_unparseGroupImport_rettype _Dump_unparseGroupImport(modelica_metatype _gimp);
#define boxptr_Dump_unparseGroupImport _Dump_unparseGroupImport

#define Absyn_pathString_rettype_1 targ1
typedef struct Absyn_pathString_rettype_s
{
  modelica_metatype targ1; /* s */
} Absyn_pathString_rettype;

Absyn_pathString_rettype _Absyn_pathString(modelica_metatype _path);
#define boxptr_Absyn_pathString _Absyn_pathString

#define Absyn_pathString2_rettype_1 targ1
typedef struct Absyn_pathString2_rettype_s
{
  modelica_metatype targ1; /* outString */
} Absyn_pathString2_rettype;

Absyn_pathString2_rettype _Absyn_pathString2(modelica_metatype _inPath, modelica_metatype _inString);
#define boxptr_Absyn_pathString2 _Absyn_pathString2

#define Dump_unparseComponentitemStr_rettype_1 targ1
typedef struct Dump_unparseComponentitemStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseComponentitemStr_rettype;

Dump_unparseComponentitemStr_rettype _Dump_unparseComponentitemStr(modelica_metatype _inComponentItem);
#define boxptr_Dump_unparseComponentitemStr _Dump_unparseComponentitemStr

#define Dump_unparseComponentCondition_rettype_1 targ1
typedef struct Dump_unparseComponentCondition_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseComponentCondition_rettype;

Dump_unparseComponentCondition_rettype _Dump_unparseComponentCondition(modelica_metatype _inAbsynComponentConditionOption);
#define boxptr_Dump_unparseComponentCondition _Dump_unparseComponentCondition

#define Dump_unparseComponentStr_rettype_1 targ1
typedef struct Dump_unparseComponentStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseComponentStr_rettype;

Dump_unparseComponentStr_rettype _Dump_unparseComponentStr(modelica_metatype _inComponent);
#define boxptr_Dump_unparseComponentStr _Dump_unparseComponentStr

#define Dump_getOptionStr_rettype_1 targ1
typedef struct Dump_getOptionStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_getOptionStr_rettype;

Dump_getOptionStr_rettype _Dump_getOptionStr(modelica_metatype _inTypeAOption, modelica_fnptr inFuncTypeTypeAToString);
#define boxptr_Dump_getOptionStr _Dump_getOptionStr

#define Dump_unparseModificationStr_rettype_1 targ1
typedef struct Dump_unparseModificationStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseModificationStr_rettype;

Dump_unparseModificationStr_rettype _Dump_unparseModificationStr(modelica_metatype _inModification);
#define boxptr_Dump_unparseModificationStr _Dump_unparseModificationStr

#define Dump_unparseMod2Str_rettype_1 targ1
typedef struct Dump_unparseMod2Str_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseMod2Str_rettype;

Dump_unparseMod2Str_rettype _Dump_unparseMod2Str(modelica_metatype _eqMod);
#define boxptr_Dump_unparseMod2Str _Dump_unparseMod2Str

#define Dump_unparseMod1Str_rettype_1 targ1
typedef struct Dump_unparseMod1Str_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseMod1Str_rettype;

Dump_unparseMod1Str_rettype _Dump_unparseMod1Str(modelica_metatype _inAbsynElementArgLst);
#define boxptr_Dump_unparseMod1Str _Dump_unparseMod1Str

#define Dump_printArraydimStr_rettype_1 targ1
typedef struct Dump_printArraydimStr_rettype_s
{
  modelica_metatype targ1; /* str */
} Dump_printArraydimStr_rettype;

Dump_printArraydimStr_rettype _Dump_printArraydimStr(modelica_metatype _s);
#define boxptr_Dump_printArraydimStr _Dump_printArraydimStr

#define Dump_unparseArraydimInAttr_rettype_1 targ1
typedef struct Dump_unparseArraydimInAttr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseArraydimInAttr_rettype;

Dump_unparseArraydimInAttr_rettype _Dump_unparseArraydimInAttr(modelica_metatype _inElementAttributes);
#define boxptr_Dump_unparseArraydimInAttr _Dump_unparseArraydimInAttr

#define Dump_unparseElementattrStr_rettype_1 targ1
typedef struct Dump_unparseElementattrStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseElementattrStr_rettype;

Dump_unparseElementattrStr_rettype _Dump_unparseElementattrStr(modelica_metatype _inElementAttributes);
#define boxptr_Dump_unparseElementattrStr _Dump_unparseElementattrStr

#define Dump_unparseDirectionSymbolStr_rettype_1 targ1
typedef struct Dump_unparseDirectionSymbolStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseDirectionSymbolStr_rettype;

Dump_unparseDirectionSymbolStr_rettype _Dump_unparseDirectionSymbolStr(modelica_metatype _inDirection);
#define boxptr_Dump_unparseDirectionSymbolStr _Dump_unparseDirectionSymbolStr

#define Dump_unparseVariabilitySymbolStr_rettype_1 targ1
typedef struct Dump_unparseVariabilitySymbolStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseVariabilitySymbolStr_rettype;

Dump_unparseVariabilitySymbolStr_rettype _Dump_unparseVariabilitySymbolStr(modelica_metatype _inVariability);
#define boxptr_Dump_unparseVariabilitySymbolStr _Dump_unparseVariabilitySymbolStr

#define Dump_unparseTypeSpec_rettype_1 targ1
typedef struct Dump_unparseTypeSpec_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseTypeSpec_rettype;

Dump_unparseTypeSpec_rettype _Dump_unparseTypeSpec(modelica_metatype _inTypeSpec);
#define boxptr_Dump_unparseTypeSpec _Dump_unparseTypeSpec

#define Dump_unparseTypeSpecLst_rettype_1 targ1
typedef struct Dump_unparseTypeSpecLst_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseTypeSpecLst_rettype;

Dump_unparseTypeSpecLst_rettype _Dump_unparseTypeSpecLst(modelica_metatype _inTypeSpecLst);
#define boxptr_Dump_unparseTypeSpecLst _Dump_unparseTypeSpecLst

#define Dump_unparseRedeclarekeywords_rettype_1 targ1
typedef struct Dump_unparseRedeclarekeywords_rettype_s
{
  modelica_metatype targ1; /* outTupleRedeclareReplaceable */
} Dump_unparseRedeclarekeywords_rettype;

Dump_unparseRedeclarekeywords_rettype _Dump_unparseRedeclarekeywords(modelica_metatype _inRedeclareKeywords);
#define boxptr_Dump_unparseRedeclarekeywords _Dump_unparseRedeclarekeywords

#define Dump_unparseEachStr_rettype_1 targ1
typedef struct Dump_unparseEachStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEachStr_rettype;

Dump_unparseEachStr_rettype _Dump_unparseEachStr(modelica_metatype _inEach);
#define boxptr_Dump_unparseEachStr _Dump_unparseEachStr

#define Dump_unparseStringCommentOption_rettype_1 targ1
typedef struct Dump_unparseStringCommentOption_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseStringCommentOption_rettype;

Dump_unparseStringCommentOption_rettype _Dump_unparseStringCommentOption(modelica_metatype _inStringOption);
#define boxptr_Dump_unparseStringCommentOption _Dump_unparseStringCommentOption

#define Dump_unparseOptModificationStr_rettype_1 targ1
typedef struct Dump_unparseOptModificationStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseOptModificationStr_rettype;

Dump_unparseOptModificationStr_rettype _Dump_unparseOptModificationStr(modelica_metatype _inAbsynModificationOption);
#define boxptr_Dump_unparseOptModificationStr _Dump_unparseOptModificationStr

#define Dump_unparseInnerouterStr_rettype_1 targ1
typedef struct Dump_unparseInnerouterStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseInnerouterStr_rettype;

Dump_unparseInnerouterStr_rettype _Dump_unparseInnerouterStr(modelica_metatype _inInnerOuter);
#define boxptr_Dump_unparseInnerouterStr _Dump_unparseInnerouterStr

#define Dump_printMatchType_rettype_1 targ1
typedef struct Dump_printMatchType_rettype_s
{
  modelica_metatype targ1; /* out */
} Dump_printMatchType_rettype;

Dump_printMatchType_rettype _Dump_printMatchType(modelica_metatype _matchType);
#define boxptr_Dump_printMatchType _Dump_printMatchType

#define Dump_printCodeStr_rettype_1 targ1
typedef struct Dump_printCodeStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_printCodeStr_rettype;

Dump_printCodeStr_rettype _Dump_printCodeStr(modelica_metatype _inCode);
#define boxptr_Dump_printCodeStr _Dump_printCodeStr

#define Dump_unparseAlgorithmStrLst_rettype_1 targ1
typedef struct Dump_unparseAlgorithmStrLst_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgorithmStrLst_rettype;

Dump_unparseAlgorithmStrLst_rettype _Dump_unparseAlgorithmStrLst(modelica_integer _inInteger, modelica_metatype _inAbsynAlgorithmItemLst, modelica_metatype _inString);
#define Dump_unparseAlgorithmStrLst_rettypeboxed_1 targ1
typedef struct Dump_unparseAlgorithmStrLst_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgorithmStrLst_rettypeboxed;

Dump_unparseAlgorithmStrLst_rettypeboxed boxptr_Dump_unparseAlgorithmStrLst(modelica_metatype _inInteger, modelica_metatype _inAbsynAlgorithmItemLst, modelica_metatype _inString);
#define Dump_unparseAlgorithmStr_rettype_1 targ1
typedef struct Dump_unparseAlgorithmStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgorithmStr_rettype;

Dump_unparseAlgorithmStr_rettype _Dump_unparseAlgorithmStr(modelica_integer _inInteger, modelica_metatype _inAlgorithmItem);
#define Dump_unparseAlgorithmStr_rettypeboxed_1 targ1
typedef struct Dump_unparseAlgorithmStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgorithmStr_rettypeboxed;

Dump_unparseAlgorithmStr_rettypeboxed boxptr_Dump_unparseAlgorithmStr(modelica_metatype _inInteger, modelica_metatype _inAlgorithmItem);

void _Print_printErrorBuf(modelica_metatype _inString);
#define boxptr_Print_printErrorBuf _Print_printErrorBuf

extern void Print_printErrorBuf(const char* /*_inString*/);
#define Dump_unparseAlgElsewhenStrLst_rettype_1 targ1
typedef struct Dump_unparseAlgElsewhenStrLst_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgElsewhenStrLst_rettype;

Dump_unparseAlgElsewhenStrLst_rettype _Dump_unparseAlgElsewhenStrLst(modelica_integer _inInteger, modelica_metatype _inTplAbsynExpAbsynAlgorithmItemLstLst);
#define Dump_unparseAlgElsewhenStrLst_rettypeboxed_1 targ1
typedef struct Dump_unparseAlgElsewhenStrLst_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgElsewhenStrLst_rettypeboxed;

Dump_unparseAlgElsewhenStrLst_rettypeboxed boxptr_Dump_unparseAlgElsewhenStrLst(modelica_metatype _inInteger, modelica_metatype _inTplAbsynExpAbsynAlgorithmItemLstLst);
#define Dump_unparseAlgElsewhenStr_rettype_1 targ1
typedef struct Dump_unparseAlgElsewhenStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgElsewhenStr_rettype;

Dump_unparseAlgElsewhenStr_rettype _Dump_unparseAlgElsewhenStr(modelica_integer _inInteger, modelica_metatype _inTplAbsynExpAbsynAlgorithmItemLst);
#define Dump_unparseAlgElsewhenStr_rettypeboxed_1 targ1
typedef struct Dump_unparseAlgElsewhenStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgElsewhenStr_rettypeboxed;

Dump_unparseAlgElsewhenStr_rettypeboxed boxptr_Dump_unparseAlgElsewhenStr(modelica_metatype _inInteger, modelica_metatype _inTplAbsynExpAbsynAlgorithmItemLst);
#define Dump_unparseAlgElseifStrLst_rettype_1 targ1
typedef struct Dump_unparseAlgElseifStrLst_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgElseifStrLst_rettype;

Dump_unparseAlgElseifStrLst_rettype _Dump_unparseAlgElseifStrLst(modelica_integer _inInteger, modelica_metatype _inTplAbsynExpAbsynAlgorithmItemLstLst, modelica_metatype _inString);
#define Dump_unparseAlgElseifStrLst_rettypeboxed_1 targ1
typedef struct Dump_unparseAlgElseifStrLst_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgElseifStrLst_rettypeboxed;

Dump_unparseAlgElseifStrLst_rettypeboxed boxptr_Dump_unparseAlgElseifStrLst(modelica_metatype _inInteger, modelica_metatype _inTplAbsynExpAbsynAlgorithmItemLstLst, modelica_metatype _inString);
#define Dump_unparseAlgElseifStr_rettype_1 targ1
typedef struct Dump_unparseAlgElseifStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgElseifStr_rettype;

Dump_unparseAlgElseifStr_rettype _Dump_unparseAlgElseifStr(modelica_integer _inInteger, modelica_metatype _inTplAbsynExpAbsynAlgorithmItemLst);
#define Dump_unparseAlgElseifStr_rettypeboxed_1 targ1
typedef struct Dump_unparseAlgElseifStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAlgElseifStr_rettypeboxed;

Dump_unparseAlgElseifStr_rettypeboxed boxptr_Dump_unparseAlgElseifStr(modelica_metatype _inInteger, modelica_metatype _inTplAbsynExpAbsynAlgorithmItemLst);
#define Dump_printPathStr_rettype_1 targ1
typedef struct Dump_printPathStr_rettype_s
{
  modelica_metatype targ1; /* s */
} Dump_printPathStr_rettype;

Dump_printPathStr_rettype _Dump_printPathStr(modelica_metatype _p);
#define boxptr_Dump_printPathStr _Dump_printPathStr

#define Dump_parenthesize_rettype_1 targ1
typedef struct Dump_parenthesize_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_parenthesize_rettype;

Dump_parenthesize_rettype _Dump_parenthesize(modelica_metatype _inString1, modelica_integer _inInteger2, modelica_integer _inInteger3);
#define Dump_parenthesize_rettypeboxed_1 targ1
typedef struct Dump_parenthesize_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_parenthesize_rettypeboxed;

Dump_parenthesize_rettypeboxed boxptr_Dump_parenthesize(modelica_metatype _inString1, modelica_metatype _inInteger2, modelica_metatype _inInteger3);
#define Dump_expPriority_rettype_1 targ1
typedef struct Dump_expPriority_rettype_s
{
  modelica_integer targ1; /* outInteger */
} Dump_expPriority_rettype;

Dump_expPriority_rettype _Dump_expPriority(modelica_metatype _inExp);
#define Dump_expPriority_rettypeboxed_1 targ1
typedef struct Dump_expPriority_rettypeboxed_s
{
  modelica_metatype targ1; /* outInteger */
} Dump_expPriority_rettypeboxed;

Dump_expPriority_rettypeboxed boxptr_Dump_expPriority(modelica_metatype _inExp);
#define Dump_printRowStr_rettype_1 targ1
typedef struct Dump_printRowStr_rettype_s
{
  modelica_metatype targ1; /* s */
} Dump_printRowStr_rettype;

Dump_printRowStr_rettype _Dump_printRowStr(modelica_metatype _es);
#define boxptr_Dump_printRowStr _Dump_printRowStr

#define Dump_printElseifStr_rettype_1 targ1
typedef struct Dump_printElseifStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_printElseifStr_rettype;

Dump_printElseifStr_rettype _Dump_printElseifStr(modelica_metatype _inTplAbsynExpAbsynExpLst);
#define boxptr_Dump_printElseifStr _Dump_printElseifStr

#define Dump_opSymbol_rettype_1 targ1
typedef struct Dump_opSymbol_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_opSymbol_rettype;

Dump_opSymbol_rettype _Dump_opSymbol(modelica_metatype _inOperator);
#define boxptr_Dump_opSymbol _Dump_opSymbol

#define Dump_printBoolStr_rettype_1 targ1
typedef struct Dump_printBoolStr_rettype_s
{
  modelica_metatype targ1; /* s */
} Dump_printBoolStr_rettype;

Dump_printBoolStr_rettype _Dump_printBoolStr(modelica_boolean _b);
#define Dump_printBoolStr_rettypeboxed_1 targ1
typedef struct Dump_printBoolStr_rettypeboxed_s
{
  modelica_metatype targ1; /* s */
} Dump_printBoolStr_rettypeboxed;

Dump_printBoolStr_rettypeboxed boxptr_Dump_printBoolStr(modelica_metatype _b);
#define Dump_unparseRestrictionStr_rettype_1 targ1
typedef struct Dump_unparseRestrictionStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseRestrictionStr_rettype;

Dump_unparseRestrictionStr_rettype _Dump_unparseRestrictionStr(modelica_metatype _inRestriction);
#define boxptr_Dump_unparseRestrictionStr _Dump_unparseRestrictionStr

#define Dump_unparseClassPartStrLst_rettype_1 targ1
typedef struct Dump_unparseClassPartStrLst_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseClassPartStrLst_rettype;

Dump_unparseClassPartStrLst_rettype _Dump_unparseClassPartStrLst(modelica_integer _inInteger, modelica_metatype _inAbsynClassPartLst, modelica_boolean _inBoolean);
#define Dump_unparseClassPartStrLst_rettypeboxed_1 targ1
typedef struct Dump_unparseClassPartStrLst_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseClassPartStrLst_rettypeboxed;

Dump_unparseClassPartStrLst_rettypeboxed boxptr_Dump_unparseClassPartStrLst(modelica_metatype _inInteger, modelica_metatype _inAbsynClassPartLst, modelica_metatype _inBoolean);
#define Dump_unparseClassPartStr_rettype_1 targ1
typedef struct Dump_unparseClassPartStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseClassPartStr_rettype;

Dump_unparseClassPartStr_rettype _Dump_unparseClassPartStr(modelica_integer _inInteger, modelica_metatype _inClassPart, modelica_boolean _inBoolean);
#define Dump_unparseClassPartStr_rettypeboxed_1 targ1
typedef struct Dump_unparseClassPartStr_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseClassPartStr_rettypeboxed;

Dump_unparseClassPartStr_rettypeboxed boxptr_Dump_unparseClassPartStr(modelica_metatype _inInteger, modelica_metatype _inClassPart, modelica_metatype _inBoolean);
#define Dump_unparseAnnotationOptionSemi_rettype_1 targ1
typedef struct Dump_unparseAnnotationOptionSemi_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAnnotationOptionSemi_rettype;

Dump_unparseAnnotationOptionSemi_rettype _Dump_unparseAnnotationOptionSemi(modelica_integer _inInteger, modelica_metatype _inAbsynAnnotationOption);
#define Dump_unparseAnnotationOptionSemi_rettypeboxed_1 targ1
typedef struct Dump_unparseAnnotationOptionSemi_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseAnnotationOptionSemi_rettypeboxed;

Dump_unparseAnnotationOptionSemi_rettypeboxed boxptr_Dump_unparseAnnotationOptionSemi(modelica_metatype _inInteger, modelica_metatype _inAbsynAnnotationOption);
#define Dump_getExtlangStr_rettype_1 targ1
typedef struct Dump_getExtlangStr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_getExtlangStr_rettype;

Dump_getExtlangStr_rettype _Dump_getExtlangStr(modelica_metatype _inStringOption);
#define boxptr_Dump_getExtlangStr _Dump_getExtlangStr

#define Dump_unparseEnumliterals_rettype_1 targ1
typedef struct Dump_unparseEnumliterals_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseEnumliterals_rettype;

Dump_unparseEnumliterals_rettype _Dump_unparseEnumliterals(modelica_metatype _inAbsynEnumLiteralLst);
#define boxptr_Dump_unparseEnumliterals _Dump_unparseEnumliterals

#define List_isEmpty_rettype_1 targ1
typedef struct List_isEmpty_rettype_s
{
  modelica_boolean targ1; /* outIsEmpty */
} List_isEmpty_rettype;

List_isEmpty_rettype _List_isEmpty(modelica_metatype _inList);
#define List_isEmpty_rettypeboxed_1 targ1
typedef struct List_isEmpty_rettypeboxed_s
{
  modelica_metatype targ1; /* outIsEmpty */
} List_isEmpty_rettypeboxed;

List_isEmpty_rettypeboxed boxptr_List_isEmpty(modelica_metatype _inList);
#define Dump_unparseWithin_rettype_1 targ1
typedef struct Dump_unparseWithin_rettype_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseWithin_rettype;

Dump_unparseWithin_rettype _Dump_unparseWithin(modelica_integer _inInteger, modelica_metatype _inWithin);
#define Dump_unparseWithin_rettypeboxed_1 targ1
typedef struct Dump_unparseWithin_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Dump_unparseWithin_rettypeboxed;

Dump_unparseWithin_rettypeboxed boxptr_Dump_unparseWithin(modelica_metatype _inInteger, modelica_metatype _inWithin);
#define System_getTimerIntervalTime_rettype_1 targ1
typedef struct System_getTimerIntervalTime_rettype_s
{
  modelica_real targ1; /* timerIntervalTime */
} System_getTimerIntervalTime_rettype;

System_getTimerIntervalTime_rettype _System_getTimerIntervalTime();
#define System_getTimerIntervalTime_rettypeboxed_1 targ1
typedef struct System_getTimerIntervalTime_rettypeboxed_s
{
  modelica_metatype targ1; /* timerIntervalTime */
} System_getTimerIntervalTime_rettypeboxed;

System_getTimerIntervalTime_rettypeboxed boxptr_System_getTimerIntervalTime();

extern double System_getTimerIntervalTime();

void _System_stopTimer();
#define boxptr_System_stopTimer _System_stopTimer

extern void System_stopTimer();
#define ParserModelica_parse_rettype_1 targ1
#define ParserModelica_parse_rettype_2 targ2
typedef struct ParserModelica_parse_rettype_s
{
  modelica_boolean targ1; /* result */
  modelica_metatype targ2; /* ast */
} ParserModelica_parse_rettype;

ParserModelica_parse_rettype _ParserModelica_parse(modelica_metatype _tokens, modelica_metatype _fileName, modelica_boolean _debug);
#define ParserModelica_parse_rettypeboxed_1 targ1
#define ParserModelica_parse_rettypeboxed_2 targ2
typedef struct ParserModelica_parse_rettypeboxed_s
{
  modelica_metatype targ1; /* result */
  modelica_metatype targ2; /* ast */
} ParserModelica_parse_rettypeboxed;

ParserModelica_parse_rettypeboxed boxptr_ParserModelica_parse(modelica_metatype _tokens, modelica_metatype _fileName, modelica_metatype _debug);
#define ParserModelica_processToken_rettype_1 targ1
#define ParserModelica_processToken_rettype_2 targ2
#define ParserModelica_processToken_rettype_3 targ3
#define ParserModelica_processToken_rettype_4 targ4
typedef struct ParserModelica_processToken_rettype_s
{
  modelica_metatype targ1; /* rTokens */
  modelica_metatype targ2; /* env2 */
  modelica_boolean targ3; /* result */
  modelica_metatype targ4; /* ast */
} ParserModelica_processToken_rettype;

ParserModelica_processToken_rettype _ParserModelica_processToken(modelica_metatype _tokens, modelica_metatype _env, modelica_metatype _pt);
#define ParserModelica_processToken_rettypeboxed_1 targ1
#define ParserModelica_processToken_rettypeboxed_2 targ2
#define ParserModelica_processToken_rettypeboxed_3 targ3
#define ParserModelica_processToken_rettypeboxed_4 targ4
typedef struct ParserModelica_processToken_rettypeboxed_s
{
  modelica_metatype targ1; /* rTokens */
  modelica_metatype targ2; /* env2 */
  modelica_metatype targ3; /* result */
  modelica_metatype targ4; /* ast */
} ParserModelica_processToken_rettypeboxed;

ParserModelica_processToken_rettypeboxed boxptr_ParserModelica_processToken(modelica_metatype _tokens, modelica_metatype _env, modelica_metatype _pt);
#define ParserModelica_errorHandler_rettype_1 targ1
#define ParserModelica_errorHandler_rettype_2 targ2
#define ParserModelica_errorHandler_rettype_3 targ3
typedef struct ParserModelica_errorHandler_rettype_s
{
  modelica_metatype targ1; /* env2 */
  modelica_metatype targ2; /* errorMsg */
  modelica_boolean targ3; /* result */
} ParserModelica_errorHandler_rettype;

ParserModelica_errorHandler_rettype _ParserModelica_errorHandler(modelica_metatype _currTok, modelica_metatype _env, modelica_metatype _pt);
#define ParserModelica_errorHandler_rettypeboxed_1 targ1
#define ParserModelica_errorHandler_rettypeboxed_2 targ2
#define ParserModelica_errorHandler_rettypeboxed_3 targ3
typedef struct ParserModelica_errorHandler_rettypeboxed_s
{
  modelica_metatype targ1; /* env2 */
  modelica_metatype targ2; /* errorMsg */
  modelica_metatype targ3; /* result */
} ParserModelica_errorHandler_rettypeboxed;

ParserModelica_errorHandler_rettypeboxed boxptr_ParserModelica_errorHandler(modelica_metatype _currTok, modelica_metatype _env, modelica_metatype _pt);
#define OMCCTypes_printErrorToken_rettype_1 targ1
typedef struct OMCCTypes_printErrorToken_rettype_s
{
  modelica_metatype targ1; /* strTk */
} OMCCTypes_printErrorToken_rettype;

OMCCTypes_printErrorToken_rettype _OMCCTypes_printErrorToken(modelica_metatype _token);
#define boxptr_OMCCTypes_printErrorToken _OMCCTypes_printErrorToken

#define OMCCTypes_printBuffer_rettype_1 targ1
typedef struct OMCCTypes_printBuffer_rettype_s
{
  modelica_metatype targ1; /* outList */
} OMCCTypes_printBuffer_rettype;

OMCCTypes_printBuffer_rettype _OMCCTypes_printBuffer(modelica_metatype _inList, modelica_metatype _cBuff);
#define boxptr_OMCCTypes_printBuffer _OMCCTypes_printBuffer


void _ParserModelica_printErrorMessages(modelica_metatype _errStk);
#define boxptr_ParserModelica_printErrorMessages _ParserModelica_printErrorMessages


void _ParserModelica_addSourceMessage(modelica_metatype _errStk, modelica_metatype _info);
#define boxptr_ParserModelica_addSourceMessage _ParserModelica_addSourceMessage


void _Error_addSourceMessage(modelica_metatype _inErrorMsg, modelica_metatype _inMessageTokens, modelica_metatype _inInfo);
#define boxptr_Error_addSourceMessage _Error_addSourceMessage


void _ErrorExt_addSourceMessage(modelica_integer _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_integer _sline, modelica_integer _scol, modelica_integer _eline, modelica_integer _ecol, modelica_boolean _read_only, modelica_metatype _filename, modelica_metatype _msg, modelica_metatype _tokens);

void boxptr_ErrorExt_addSourceMessage(modelica_metatype _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_metatype _sline, modelica_metatype _scol, modelica_metatype _eline, modelica_metatype _ecol, modelica_metatype _read_only, modelica_metatype _filename, modelica_metatype _msg, modelica_metatype _tokens);

extern void Error_addSourceMessage(int /*_id*/, modelica_metatype /*_msg_type*/, modelica_metatype /*_msg_severity*/, int /*_sline*/, int /*_scol*/, int /*_eline*/, int /*_ecol*/, int /*_read_only*/, const char* /*_filename*/, const char* /*_msg*/, modelica_metatype /*_tokens*/);
#define ParserModelica_checkToken_rettype_1 targ1
typedef struct ParserModelica_checkToken_rettype_s
{
  modelica_boolean targ1; /* result */
} ParserModelica_checkToken_rettype;

ParserModelica_checkToken_rettype _ParserModelica_checkToken(modelica_integer _chkTok, modelica_metatype _env, modelica_metatype _pt, modelica_integer _action);
#define ParserModelica_checkToken_rettypeboxed_1 targ1
typedef struct ParserModelica_checkToken_rettypeboxed_s
{
  modelica_metatype targ1; /* result */
} ParserModelica_checkToken_rettypeboxed;

ParserModelica_checkToken_rettypeboxed boxptr_ParserModelica_checkToken(modelica_metatype _chkTok, modelica_metatype _env, modelica_metatype _pt, modelica_metatype _action);
#define LexerModelica_lex_rettype_1 targ1
typedef struct LexerModelica_lex_rettype_s
{
  modelica_metatype targ1; /* tokens */
} LexerModelica_lex_rettype;

LexerModelica_lex_rettype _LexerModelica_lex(modelica_metatype _fileName, modelica_metatype _program, modelica_boolean _debug);
#define LexerModelica_lex_rettypeboxed_1 targ1
typedef struct LexerModelica_lex_rettypeboxed_s
{
  modelica_metatype targ1; /* tokens */
} LexerModelica_lex_rettypeboxed;

LexerModelica_lex_rettypeboxed boxptr_LexerModelica_lex(modelica_metatype _fileName, modelica_metatype _program, modelica_metatype _debug);
#define LexerModelica_consume_rettype_1 targ1
#define LexerModelica_consume_rettype_2 targ2
#define LexerModelica_consume_rettype_3 targ3
typedef struct LexerModelica_consume_rettype_s
{
  modelica_metatype targ1; /* resToken */
  modelica_metatype targ2; /* env2 */
  modelica_metatype targ3; /* program2 */
} LexerModelica_consume_rettype;

LexerModelica_consume_rettype _LexerModelica_consume(modelica_metatype _env, modelica_metatype _program, modelica_metatype _lexTables, modelica_metatype _tokens);
#define boxptr_LexerModelica_consume _LexerModelica_consume

#define List_consOption_rettype_1 targ1
typedef struct List_consOption_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_consOption_rettype;

List_consOption_rettype _List_consOption(modelica_metatype _inElement, modelica_metatype _inList);
#define boxptr_List_consOption _List_consOption

#define LexerCodeModelica_action_rettype_1 targ1
#define LexerCodeModelica_action_rettype_2 targ2
typedef struct LexerCodeModelica_action_rettype_s
{
  modelica_metatype targ1; /* token */
  modelica_metatype targ2; /* env2 */
} LexerCodeModelica_action_rettype;

LexerCodeModelica_action_rettype _LexerCodeModelica_action(modelica_integer _act, modelica_metatype _env);
#define LexerCodeModelica_action_rettypeboxed_1 targ1
#define LexerCodeModelica_action_rettypeboxed_2 targ2
typedef struct LexerCodeModelica_action_rettypeboxed_s
{
  modelica_metatype targ1; /* token */
  modelica_metatype targ2; /* env2 */
} LexerCodeModelica_action_rettypeboxed;

LexerCodeModelica_action_rettypeboxed boxptr_LexerCodeModelica_action(modelica_metatype _act, modelica_metatype _env);
#define LexerModelica_printBuffer_rettype_1 targ1
typedef struct LexerModelica_printBuffer_rettype_s
{
  modelica_metatype targ1; /* outList */
} LexerModelica_printBuffer_rettype;

LexerModelica_printBuffer_rettype _LexerModelica_printBuffer(modelica_metatype _inList);
#define boxptr_LexerModelica_printBuffer _LexerModelica_printBuffer

#define LexerModelica_getInfo_rettype_1 targ1
typedef struct LexerModelica_getInfo_rettype_s
{
  modelica_metatype targ1; /* info */
} LexerModelica_getInfo_rettype;

LexerModelica_getInfo_rettype _LexerModelica_getInfo(modelica_metatype _buff, modelica_integer _frPos, modelica_integer _flineNr, modelica_metatype _programName);
#define LexerModelica_getInfo_rettypeboxed_1 targ1
typedef struct LexerModelica_getInfo_rettypeboxed_s
{
  modelica_metatype targ1; /* info */
} LexerModelica_getInfo_rettypeboxed;

LexerModelica_getInfo_rettypeboxed boxptr_LexerModelica_getInfo(modelica_metatype _buff, modelica_metatype _frPos, modelica_metatype _flineNr, modelica_metatype _programName);
#define OMCCTypes_getTimeStamp_rettype_1 targ1
typedef struct OMCCTypes_getTimeStamp_rettype_s
{
  modelica_metatype targ1; /* timeStamp */
} OMCCTypes_getTimeStamp_rettype;

OMCCTypes_getTimeStamp_rettype _OMCCTypes_getTimeStamp();
#define boxptr_OMCCTypes_getTimeStamp _OMCCTypes_getTimeStamp

#define LexerModelica_findRule_rettype_1 targ1
#define LexerModelica_findRule_rettype_2 targ2
typedef struct LexerModelica_findRule_rettype_s
{
  modelica_metatype targ1; /* env2 */
  modelica_integer targ2; /* action */
} LexerModelica_findRule_rettype;

LexerModelica_findRule_rettype _LexerModelica_findRule(modelica_metatype _lexTables, modelica_metatype _env);
#define LexerModelica_findRule_rettypeboxed_1 targ1
#define LexerModelica_findRule_rettypeboxed_2 targ2
typedef struct LexerModelica_findRule_rettypeboxed_s
{
  modelica_metatype targ1; /* env2 */
  modelica_metatype targ2; /* action */
} LexerModelica_findRule_rettypeboxed;

LexerModelica_findRule_rettypeboxed boxptr_LexerModelica_findRule(modelica_metatype _lexTables, modelica_metatype _env);
#define LexerModelica_evalState_rettype_1 targ1
#define LexerModelica_evalState_rettype_2 targ2
typedef struct LexerModelica_evalState_rettype_s
{
  modelica_integer targ1; /* new_state */
  modelica_integer targ2; /* new_c */
} LexerModelica_evalState_rettype;

LexerModelica_evalState_rettype _LexerModelica_evalState(modelica_metatype _lexTables, modelica_integer _cState, modelica_integer _c);
#define LexerModelica_evalState_rettypeboxed_1 targ1
#define LexerModelica_evalState_rettypeboxed_2 targ2
typedef struct LexerModelica_evalState_rettypeboxed_s
{
  modelica_metatype targ1; /* new_state */
  modelica_metatype targ2; /* new_c */
} LexerModelica_evalState_rettypeboxed;

LexerModelica_evalState_rettypeboxed boxptr_LexerModelica_evalState(modelica_metatype _lexTables, modelica_metatype _cState, modelica_metatype _c);
#define LexerModelica_printStack_rettype_1 targ1
typedef struct LexerModelica_printStack_rettype_s
{
  modelica_metatype targ1; /* outList */
} LexerModelica_printStack_rettype;

LexerModelica_printStack_rettype _LexerModelica_printStack(modelica_metatype _inList, modelica_metatype _cBuff);
#define boxptr_LexerModelica_printStack _LexerModelica_printStack

#define OMCCTypes_getMergeTokenValue_rettype_1 targ1
typedef struct OMCCTypes_getMergeTokenValue_rettype_s
{
  modelica_metatype targ1; /* value */
} OMCCTypes_getMergeTokenValue_rettype;

OMCCTypes_getMergeTokenValue_rettype _OMCCTypes_getMergeTokenValue(modelica_metatype _token1, modelica_metatype _token2);
#define boxptr_OMCCTypes_getMergeTokenValue _OMCCTypes_getMergeTokenValue

#define OMCCTypes_printToken_rettype_1 targ1
typedef struct OMCCTypes_printToken_rettype_s
{
  modelica_metatype targ1; /* strTk */
} OMCCTypes_printToken_rettype;

OMCCTypes_printToken_rettype _OMCCTypes_printToken(modelica_metatype _token);
#define boxptr_OMCCTypes_printToken _OMCCTypes_printToken

#define ParserModelica_printCandidateTokens_rettype_1 targ1
typedef struct ParserModelica_printCandidateTokens_rettype_s
{
  modelica_metatype targ1; /* outList */
} ParserModelica_printCandidateTokens_rettype;

ParserModelica_printCandidateTokens_rettype _ParserModelica_printCandidateTokens(modelica_metatype _inList, modelica_metatype _cBuff);
#define boxptr_ParserModelica_printCandidateTokens _ParserModelica_printCandidateTokens

#define System_substring_rettype_1 targ1
typedef struct System_substring_rettype_s
{
  modelica_metatype targ1; /* outString */
} System_substring_rettype;

System_substring_rettype _System_substring(modelica_metatype _inString, modelica_integer _start, modelica_integer _stop);
#define System_substring_rettypeboxed_1 targ1
typedef struct System_substring_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} System_substring_rettypeboxed;

System_substring_rettypeboxed boxptr_System_substring(modelica_metatype _inString, modelica_metatype _start, modelica_metatype _stop);

extern const char* System_substring(const char* /*_inString*/, int /*_start*/, int /*_stop*/);
#define ParserModelica_checkCandidates_rettype_1 targ1
typedef struct ParserModelica_checkCandidates_rettype_s
{
  modelica_metatype targ1; /* resCandidates */
} ParserModelica_checkCandidates_rettype;

ParserModelica_checkCandidates_rettype _ParserModelica_checkCandidates(modelica_metatype _candidates, modelica_metatype _env, modelica_metatype _pt, modelica_integer _action);
#define ParserModelica_checkCandidates_rettypeboxed_1 targ1
typedef struct ParserModelica_checkCandidates_rettypeboxed_s
{
  modelica_metatype targ1; /* resCandidates */
} ParserModelica_checkCandidates_rettypeboxed;

ParserModelica_checkCandidates_rettypeboxed boxptr_ParserModelica_checkCandidates(modelica_metatype _candidates, modelica_metatype _env, modelica_metatype _pt, modelica_metatype _action);
#define ParserModelica_getTokenSemValue_rettype_1 targ1
typedef struct ParserModelica_getTokenSemValue_rettype_s
{
  modelica_metatype targ1; /* tokenSemValue */
} ParserModelica_getTokenSemValue_rettype;

ParserModelica_getTokenSemValue_rettype _ParserModelica_getTokenSemValue(modelica_integer _tokenId, modelica_metatype _pt);
#define ParserModelica_getTokenSemValue_rettypeboxed_1 targ1
typedef struct ParserModelica_getTokenSemValue_rettypeboxed_s
{
  modelica_metatype targ1; /* tokenSemValue */
} ParserModelica_getTokenSemValue_rettypeboxed;

ParserModelica_getTokenSemValue_rettypeboxed boxptr_ParserModelica_getTokenSemValue(modelica_metatype _tokenId, modelica_metatype _pt);
#define OMCCTypes_printShortToken_rettype_1 targ1
typedef struct OMCCTypes_printShortToken_rettype_s
{
  modelica_metatype targ1; /* strTk */
} OMCCTypes_printShortToken_rettype;

OMCCTypes_printShortToken_rettype _OMCCTypes_printShortToken(modelica_metatype _token);
#define boxptr_OMCCTypes_printShortToken _OMCCTypes_printShortToken

#define ParserModelica_printStack_rettype_1 targ1
typedef struct ParserModelica_printStack_rettype_s
{
  modelica_metatype targ1; /* outList */
} ParserModelica_printStack_rettype;

ParserModelica_printStack_rettype _ParserModelica_printStack(modelica_metatype _inList, modelica_metatype _cBuff);
#define boxptr_ParserModelica_printStack _ParserModelica_printStack

#define ParserModelica_reduce_rettype_1 targ1
typedef struct ParserModelica_reduce_rettype_s
{
  modelica_metatype targ1; /* env2 */
} ParserModelica_reduce_rettype;

ParserModelica_reduce_rettype _ParserModelica_reduce(modelica_integer _rule, modelica_metatype _env, modelica_metatype _pt);
#define ParserModelica_reduce_rettypeboxed_1 targ1
typedef struct ParserModelica_reduce_rettypeboxed_s
{
  modelica_metatype targ1; /* env2 */
} ParserModelica_reduce_rettypeboxed;

ParserModelica_reduce_rettypeboxed boxptr_ParserModelica_reduce(modelica_metatype _rule, modelica_metatype _env, modelica_metatype _pt);
#define ParseCodeModelica_actionRed_rettype_1 targ1
#define ParseCodeModelica_actionRed_rettype_2 targ2
#define ParseCodeModelica_actionRed_rettype_3 targ3
typedef struct ParseCodeModelica_actionRed_rettype_s
{
  modelica_metatype targ1; /* astStk2 */
  modelica_boolean targ2; /* error */
  modelica_metatype targ3; /* errorMsg */
} ParseCodeModelica_actionRed_rettype;

ParseCodeModelica_actionRed_rettype _ParseCodeModelica_actionRed(modelica_integer _act, modelica_metatype _astStk, modelica_metatype _mm_r2);
#define ParseCodeModelica_actionRed_rettypeboxed_1 targ1
#define ParseCodeModelica_actionRed_rettypeboxed_2 targ2
#define ParseCodeModelica_actionRed_rettypeboxed_3 targ3
typedef struct ParseCodeModelica_actionRed_rettypeboxed_s
{
  modelica_metatype targ1; /* astStk2 */
  modelica_metatype targ2; /* error */
  modelica_metatype targ3; /* errorMsg */
} ParseCodeModelica_actionRed_rettypeboxed;

ParseCodeModelica_actionRed_rettypeboxed boxptr_ParseCodeModelica_actionRed(modelica_metatype _act, modelica_metatype _astStk, modelica_metatype _mm_r2);
#define OMCCTypes_printInfoError_rettype_1 targ1
typedef struct OMCCTypes_printInfoError_rettype_s
{
  modelica_metatype targ1; /* strTk */
} OMCCTypes_printInfoError_rettype;

OMCCTypes_printInfoError_rettype _OMCCTypes_printInfoError(modelica_metatype _info);
#define boxptr_OMCCTypes_printInfoError _OMCCTypes_printInfoError

#define ParseCodeModelica_reduceStringStack_rettype_1 targ1
typedef struct ParseCodeModelica_reduceStringStack_rettype_s
{
  modelica_metatype targ1; /* skStringRes */
} ParseCodeModelica_reduceStringStack_rettype;

ParseCodeModelica_reduceStringStack_rettype _ParseCodeModelica_reduceStringStack(modelica_metatype _skString, modelica_integer _nTokens);
#define ParseCodeModelica_reduceStringStack_rettypeboxed_1 targ1
typedef struct ParseCodeModelica_reduceStringStack_rettypeboxed_s
{
  modelica_metatype targ1; /* skStringRes */
} ParseCodeModelica_reduceStringStack_rettypeboxed;

ParseCodeModelica_reduceStringStack_rettypeboxed boxptr_ParseCodeModelica_reduceStringStack(modelica_metatype _skString, modelica_metatype _nTokens);
#define ParseCodeModelica_getInfo_rettype_1 targ1
#define ParseCodeModelica_getInfo_rettype_2 targ2
typedef struct ParseCodeModelica_getInfo_rettype_s
{
  modelica_metatype targ1; /* info */
  modelica_metatype targ2; /* skTokenRes */
} ParseCodeModelica_getInfo_rettype;

ParseCodeModelica_getInfo_rettype _ParseCodeModelica_getInfo(modelica_metatype _skToken, modelica_integer _nTokens);
#define ParseCodeModelica_getInfo_rettypeboxed_1 targ1
#define ParseCodeModelica_getInfo_rettypeboxed_2 targ2
typedef struct ParseCodeModelica_getInfo_rettypeboxed_s
{
  modelica_metatype targ1; /* info */
  modelica_metatype targ2; /* skTokenRes */
} ParseCodeModelica_getInfo_rettypeboxed;

ParseCodeModelica_getInfo_rettypeboxed boxptr_ParseCodeModelica_getInfo(modelica_metatype _skToken, modelica_metatype _nTokens);
#define ParseCodeModelica_trimquotes_rettype_1 targ1
typedef struct ParseCodeModelica_trimquotes_rettype_s
{
  modelica_metatype targ1; /* outString */
} ParseCodeModelica_trimquotes_rettype;

ParseCodeModelica_trimquotes_rettype _ParseCodeModelica_trimquotes(modelica_metatype _inString);
#define boxptr_ParseCodeModelica_trimquotes _ParseCodeModelica_trimquotes

#define ParseCodeModelica_fixArray_rettype_1 targ1
#define ParseCodeModelica_fixArray_rettype_2 targ2
typedef struct ParseCodeModelica_fixArray_rettype_s
{
  modelica_metatype targ1; /* v1ElementAttributes2 */
  modelica_metatype targ2; /* v2TypeSpec2 */
} ParseCodeModelica_fixArray_rettype;

ParseCodeModelica_fixArray_rettype _ParseCodeModelica_fixArray(modelica_metatype _v1ElementAttributes, modelica_metatype _v2TypeSpec);
#define boxptr_ParseCodeModelica_fixArray _ParseCodeModelica_fixArray

#define System_getCurrentTime_rettype_1 targ1
typedef struct System_getCurrentTime_rettype_s
{
  modelica_real targ1; /* outValue */
} System_getCurrentTime_rettype;

System_getCurrentTime_rettype _System_getCurrentTime();
#define System_getCurrentTime_rettypeboxed_1 targ1
typedef struct System_getCurrentTime_rettypeboxed_s
{
  modelica_metatype targ1; /* outValue */
} System_getCurrentTime_rettypeboxed;

System_getCurrentTime_rettypeboxed boxptr_System_getCurrentTime();

extern double SystemImpl__getCurrentTime();
#define ParseCodeModelica_push_rettype_1 targ1
typedef struct ParseCodeModelica_push_rettype_s
{
  modelica_metatype targ1; /* astStk2 */
} ParseCodeModelica_push_rettype;

ParseCodeModelica_push_rettype _ParseCodeModelica_push(modelica_metatype _astStk, modelica_metatype _inVal, modelica_metatype _token);
#define boxptr_ParseCodeModelica_push _ParseCodeModelica_push

#define ParserModelica_translate_rettype_1 targ1
typedef struct ParserModelica_translate_rettype_s
{
  modelica_integer targ1; /* tok2 */
} ParserModelica_translate_rettype;

ParserModelica_translate_rettype _ParserModelica_translate(modelica_integer _tok1, modelica_metatype _pt);
#define ParserModelica_translate_rettypeboxed_1 targ1
typedef struct ParserModelica_translate_rettypeboxed_s
{
  modelica_metatype targ1; /* tok2 */
} ParserModelica_translate_rettypeboxed;

ParserModelica_translate_rettypeboxed boxptr_ParserModelica_translate(modelica_metatype _tok1, modelica_metatype _pt);
#define ParserModelica_printBuffer_rettype_1 targ1
typedef struct ParserModelica_printBuffer_rettype_s
{
  modelica_metatype targ1; /* outList */
} ParserModelica_printBuffer_rettype;

ParserModelica_printBuffer_rettype _ParserModelica_printBuffer(modelica_metatype _inList);
#define boxptr_ParserModelica_printBuffer _ParserModelica_printBuffer

#define ParseCodeModelica_getAST_rettype_1 targ1
typedef struct ParseCodeModelica_getAST_rettype_s
{
  modelica_metatype targ1; /* ast */
} ParseCodeModelica_getAST_rettype;

ParseCodeModelica_getAST_rettype _ParseCodeModelica_getAST(modelica_metatype _astStk);
#define boxptr_ParseCodeModelica_getAST _ParseCodeModelica_getAST

#define ParseCodeModelica_initAstStack_rettype_1 targ1
typedef struct ParseCodeModelica_initAstStack_rettype_s
{
  modelica_metatype targ1; /* astStack2 */
} ParseCodeModelica_initAstStack_rettype;

ParseCodeModelica_initAstStack_rettype _ParseCodeModelica_initAstStack(modelica_metatype _astStack);
#define boxptr_ParseCodeModelica_initAstStack _ParseCodeModelica_initAstStack


void _System_startTimer();
#define boxptr_System_startTimer _System_startTimer

extern void System_startTimer();
#define LexerModelica_scan_rettype_1 targ1
typedef struct LexerModelica_scan_rettype_s
{
  modelica_metatype targ1; /* tokens */
} LexerModelica_scan_rettype;

LexerModelica_scan_rettype _LexerModelica_scan(modelica_metatype _fileName, modelica_boolean _debug);
#define LexerModelica_scan_rettypeboxed_1 targ1
typedef struct LexerModelica_scan_rettypeboxed_s
{
  modelica_metatype targ1; /* tokens */
} LexerModelica_scan_rettypeboxed;

LexerModelica_scan_rettypeboxed boxptr_LexerModelica_scan(modelica_metatype _fileName, modelica_metatype _debug);
#define LexerModelica_loadSourceCode_rettype_1 targ1
typedef struct LexerModelica_loadSourceCode_rettype_s
{
  modelica_metatype targ1; /* program */
} LexerModelica_loadSourceCode_rettype;

LexerModelica_loadSourceCode_rettype _LexerModelica_loadSourceCode(modelica_metatype _fileName);
#define boxptr_LexerModelica_loadSourceCode _LexerModelica_loadSourceCode

#define System_readFile_rettype_1 targ1
typedef struct System_readFile_rettype_s
{
  modelica_metatype targ1; /* outString */
} System_readFile_rettype;

System_readFile_rettype _System_readFile(modelica_metatype _inString);
#define boxptr_System_readFile _System_readFile

extern const char* System_readFile(const char* /*_inString*/);
#define Flags_new_rettype_1 targ1
typedef struct Flags_new_rettype_s
{
  modelica_metatype targ1; /* outArgs */
} Flags_new_rettype;

Flags_new_rettype _Flags_new(modelica_metatype _inArgs);
#define boxptr_Flags_new _Flags_new

#define Flags_readArgs_rettype_1 targ1
typedef struct Flags_readArgs_rettype_s
{
  modelica_metatype targ1; /* outArgs */
} Flags_readArgs_rettype;

Flags_readArgs_rettype _Flags_readArgs(modelica_metatype _inArgs);
#define boxptr_Flags_readArgs _Flags_readArgs


void _Flags_saveFlags(modelica_metatype _inFlags);
#define boxptr_Flags_saveFlags _Flags_saveFlags

#define List_filter1OnTrue_rettype_1 targ1
typedef struct List_filter1OnTrue_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_filter1OnTrue_rettype;

List_filter1OnTrue_rettype _List_filter1OnTrue(modelica_metatype _inList, modelica_fnptr inFilterFunc, modelica_metatype _inArg1);
#define boxptr_List_filter1OnTrue _List_filter1OnTrue

#define List_filter1OnTrue__tail_rettype_1 targ1
typedef struct List_filter1OnTrue__tail_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_filter1OnTrue__tail_rettype;

List_filter1OnTrue__tail_rettype _List_filter1OnTrue__tail(modelica_metatype _inList, modelica_fnptr inFilterFunc, modelica_metatype _inArg1, modelica_metatype _inAccumList);
#define boxptr_List_filter1OnTrue__tail _List_filter1OnTrue__tail

#define List_consOnTrue_rettype_1 targ1
typedef struct List_consOnTrue_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_consOnTrue_rettype;

List_consOnTrue_rettype _List_consOnTrue(modelica_boolean _inCondition, modelica_metatype _inElement, modelica_metatype _inList);
#define List_consOnTrue_rettypeboxed_1 targ1
typedef struct List_consOnTrue_rettypeboxed_s
{
  modelica_metatype targ1; /* outList */
} List_consOnTrue_rettypeboxed;

List_consOnTrue_rettypeboxed boxptr_List_consOnTrue(modelica_metatype _inCondition, modelica_metatype _inElement, modelica_metatype _inList);
#define Flags_readArg_rettype_1 targ1
typedef struct Flags_readArg_rettype_s
{
  modelica_boolean targ1; /* outNotConsumed */
} Flags_readArg_rettype;

Flags_readArg_rettype _Flags_readArg(modelica_metatype _inArg, modelica_metatype _inFlags);
#define Flags_readArg_rettypeboxed_1 targ1
typedef struct Flags_readArg_rettypeboxed_s
{
  modelica_metatype targ1; /* outNotConsumed */
} Flags_readArg_rettypeboxed;

Flags_readArg_rettypeboxed boxptr_Flags_readArg(modelica_metatype _inArg, modelica_metatype _inFlags);

void _Flags_parseFlag(modelica_metatype _inFlag, modelica_metatype _inFlags);
#define boxptr_Flags_parseFlag _Flags_parseFlag


void _Flags_parseFlag2(modelica_metatype _inFlag, modelica_metatype _inValues, modelica_metatype _inFlags);
#define boxptr_Flags_parseFlag2 _Flags_parseFlag2


void _Flags_parseConfigFlag(modelica_metatype _inFlag, modelica_metatype _inValues, modelica_metatype _inFlags);
#define boxptr_Flags_parseConfigFlag _Flags_parseConfigFlag


void _Flags_setConfigFlag(modelica_metatype _inFlag, modelica_metatype _inConfigData, modelica_metatype _inValues);
#define boxptr_Flags_setConfigFlag _Flags_setConfigFlag

#define Flags_updateConfigFlagArray_rettype_1 targ1
typedef struct Flags_updateConfigFlagArray_rettype_s
{
  modelica_metatype targ1; /* outFlags */
} Flags_updateConfigFlagArray_rettype;

Flags_updateConfigFlagArray_rettype _Flags_updateConfigFlagArray(modelica_metatype _inFlags, modelica_metatype _inValue, modelica_metatype _inFlag);
#define boxptr_Flags_updateConfigFlagArray _Flags_updateConfigFlagArray


void _Flags_applySideEffects(modelica_metatype _inFlag, modelica_metatype _inValue);
#define boxptr_Flags_applySideEffects _Flags_applySideEffects


void _Debug_bcall2(modelica_boolean _inBoolean, modelica_fnptr inFuncTypeTypeATypeBTo, modelica_metatype _inTypeA, modelica_metatype _inTypeB);

void boxptr_Debug_bcall2(modelica_metatype _inBoolean, modelica_fnptr inFuncTypeTypeATypeBTo, modelica_metatype _inTypeA, modelica_metatype _inTypeB);

void _Flags_setConfigEnum(modelica_metatype _inFlag, modelica_integer _inValue);

void boxptr_Flags_setConfigEnum(modelica_metatype _inFlag, modelica_metatype _inValue);

void _Flags_setConfigValue(modelica_metatype _inFlag, modelica_metatype _inValue);
#define boxptr_Flags_setConfigValue _Flags_setConfigValue

#define Flags_loadFlags_rettype_1 targ1
typedef struct Flags_loadFlags_rettype_s
{
  modelica_metatype targ1; /* outFlags */
} Flags_loadFlags_rettype;

Flags_loadFlags_rettype _Flags_loadFlags();
#define boxptr_Flags_loadFlags _Flags_loadFlags

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

void _Corba_setSessionName(modelica_metatype _inSessionName);
#define boxptr_Corba_setSessionName _Corba_setSessionName

extern void Corba_setSessionName(const char* /*_inSessionName*/);
#define Flags_configFlagsIsEqualIndex_rettype_1 targ1
typedef struct Flags_configFlagsIsEqualIndex_rettype_s
{
  modelica_boolean targ1; /* outEqualIndex */
} Flags_configFlagsIsEqualIndex_rettype;

Flags_configFlagsIsEqualIndex_rettype _Flags_configFlagsIsEqualIndex(modelica_metatype _inFlag1, modelica_metatype _inFlag2);
#define Flags_configFlagsIsEqualIndex_rettypeboxed_1 targ1
typedef struct Flags_configFlagsIsEqualIndex_rettypeboxed_s
{
  modelica_metatype targ1; /* outEqualIndex */
} Flags_configFlagsIsEqualIndex_rettypeboxed;

Flags_configFlagsIsEqualIndex_rettypeboxed boxptr_Flags_configFlagsIsEqualIndex(modelica_metatype _inFlag1, modelica_metatype _inFlag2);

void _ErrorExt_setShowErrorMessages(modelica_boolean _inShow);

void boxptr_ErrorExt_setShowErrorMessages(modelica_metatype _inShow);

extern void Error_setShowErrorMessages(int /*_inShow*/);
#define Flags_stringFlagData_rettype_1 targ1
typedef struct Flags_stringFlagData_rettype_s
{
  modelica_metatype targ1; /* outValue */
} Flags_stringFlagData_rettype;

Flags_stringFlagData_rettype _Flags_stringFlagData(modelica_metatype _inValues, modelica_metatype _inExpectedType, modelica_metatype _inName);
#define boxptr_Flags_stringFlagData _Flags_stringFlagData

#define Flags_printActualTypeStr_rettype_1 targ1
typedef struct Flags_printActualTypeStr_rettype_s
{
  modelica_metatype targ1; /* outTypeStr */
} Flags_printActualTypeStr_rettype;

Flags_printActualTypeStr_rettype _Flags_printActualTypeStr(modelica_metatype _inType);
#define boxptr_Flags_printActualTypeStr _Flags_printActualTypeStr

#define Util_stringBool_rettype_1 targ1
typedef struct Util_stringBool_rettype_s
{
  modelica_boolean targ1; /* outBoolean */
} Util_stringBool_rettype;

Util_stringBool_rettype _Util_stringBool(modelica_metatype _inString);
#define Util_stringBool_rettypeboxed_1 targ1
typedef struct Util_stringBool_rettypeboxed_s
{
  modelica_metatype targ1; /* outBoolean */
} Util_stringBool_rettypeboxed;

Util_stringBool_rettypeboxed boxptr_Util_stringBool(modelica_metatype _inString);
#define Util_stringBool2_rettype_1 targ1
typedef struct Util_stringBool2_rettype_s
{
  modelica_boolean targ1; /* outBoolean */
} Util_stringBool2_rettype;

Util_stringBool2_rettype _Util_stringBool2(modelica_metatype _inString);
#define Util_stringBool2_rettypeboxed_1 targ1
typedef struct Util_stringBool2_rettypeboxed_s
{
  modelica_metatype targ1; /* outBoolean */
} Util_stringBool2_rettypeboxed;

Util_stringBool2_rettypeboxed boxptr_Util_stringBool2(modelica_metatype _inString);
#define System_tolower_rettype_1 targ1
typedef struct System_tolower_rettype_s
{
  modelica_metatype targ1; /* outString */
} System_tolower_rettype;

System_tolower_rettype _System_tolower(modelica_metatype _inString);
#define boxptr_System_tolower _System_tolower

extern const char* System_tolower(const char* /*_inString*/);
#define Flags_printExpectedTypeStr_rettype_1 targ1
typedef struct Flags_printExpectedTypeStr_rettype_s
{
  modelica_metatype targ1; /* outTypeStr */
} Flags_printExpectedTypeStr_rettype;

Flags_printExpectedTypeStr_rettype _Flags_printExpectedTypeStr(modelica_metatype _inType);
#define boxptr_Flags_printExpectedTypeStr _Flags_printExpectedTypeStr

#define Util_tuple21_rettype_1 targ1
typedef struct Util_tuple21_rettype_s
{
  modelica_metatype targ1; /* outTypeA */
} Util_tuple21_rettype;

Util_tuple21_rettype _Util_tuple21(modelica_metatype _inTplTypeATypeB);
#define boxptr_Util_tuple21 _Util_tuple21

#define Util_assoc_rettype_1 targ1
typedef struct Util_assoc_rettype_s
{
  modelica_metatype targ1; /* val */
} Util_assoc_rettype;

Util_assoc_rettype _Util_assoc(modelica_metatype _key, modelica_metatype _lst);
#define boxptr_Util_assoc _Util_assoc

#define List_getMemberOnTrue_rettype_1 targ1
typedef struct List_getMemberOnTrue_rettype_s
{
  modelica_metatype targ1; /* outElement */
} List_getMemberOnTrue_rettype;

List_getMemberOnTrue_rettype _List_getMemberOnTrue(modelica_metatype _inValue, modelica_metatype _inList, modelica_fnptr inCompFunc);
#define boxptr_List_getMemberOnTrue _List_getMemberOnTrue

#define Flags_matchConfigFlag_rettype_1 targ1
typedef struct Flags_matchConfigFlag_rettype_s
{
  modelica_boolean targ1; /* outMatches */
} Flags_matchConfigFlag_rettype;

Flags_matchConfigFlag_rettype _Flags_matchConfigFlag(modelica_metatype _inFlagName, modelica_metatype _inFlag);
#define Flags_matchConfigFlag_rettypeboxed_1 targ1
typedef struct Flags_matchConfigFlag_rettypeboxed_s
{
  modelica_metatype targ1; /* outMatches */
} Flags_matchConfigFlag_rettypeboxed;

Flags_matchConfigFlag_rettypeboxed boxptr_Flags_matchConfigFlag(modelica_metatype _inFlagName, modelica_metatype _inFlag);
#define Util_getOptionOrDefault_rettype_1 targ1
typedef struct Util_getOptionOrDefault_rettype_s
{
  modelica_metatype targ1; /* unOption */
} Util_getOptionOrDefault_rettype;

Util_getOptionOrDefault_rettype _Util_getOptionOrDefault(modelica_metatype _inOption, modelica_metatype _default);
#define boxptr_Util_getOptionOrDefault _Util_getOptionOrDefault


void _Flags_setConfigBool(modelica_metatype _inFlag, modelica_boolean _inValue);

void boxptr_Flags_setConfigBool(modelica_metatype _inFlag, modelica_metatype _inValue);

void _Flags_printHelp(modelica_metatype _inTopics);
#define boxptr_Flags_printHelp _Flags_printHelp

#define Flags_printFlagValidOptionsDesc_rettype_1 targ1
typedef struct Flags_printFlagValidOptionsDesc_rettype_s
{
  modelica_metatype targ1; /* outString */
} Flags_printFlagValidOptionsDesc_rettype;

Flags_printFlagValidOptionsDesc_rettype _Flags_printFlagValidOptionsDesc(modelica_metatype _inFlag);
#define boxptr_Flags_printFlagValidOptionsDesc _Flags_printFlagValidOptionsDesc

#define Flags_printFlagOptionDesc_rettype_1 targ1
typedef struct Flags_printFlagOptionDesc_rettype_s
{
  modelica_metatype targ1; /* outString */
} Flags_printFlagOptionDesc_rettype;

Flags_printFlagOptionDesc_rettype _Flags_printFlagOptionDesc(modelica_metatype _inOption);
#define boxptr_Flags_printFlagOptionDesc _Flags_printFlagOptionDesc

#define Util_stringWrap_rettype_1 targ1
typedef struct Util_stringWrap_rettype_s
{
  modelica_metatype targ1; /* outStrings */
} Util_stringWrap_rettype;

Util_stringWrap_rettype _Util_stringWrap(modelica_metatype _inString, modelica_integer _inWrapLength, modelica_metatype _inDelimiter);
#define Util_stringWrap_rettypeboxed_1 targ1
typedef struct Util_stringWrap_rettypeboxed_s
{
  modelica_metatype targ1; /* outStrings */
} Util_stringWrap_rettypeboxed;

Util_stringWrap_rettypeboxed boxptr_Util_stringWrap(modelica_metatype _inString, modelica_metatype _inWrapLength, modelica_metatype _inDelimiter);
#define Util_stringWrap2_rettype_1 targ1
typedef struct Util_stringWrap2_rettype_s
{
  modelica_metatype targ1; /* outStrings */
} Util_stringWrap2_rettype;

Util_stringWrap2_rettype _Util_stringWrap2(modelica_metatype _inString, modelica_integer _inWrapLength, modelica_metatype _inDelimiter, modelica_integer _inDelimiterLength, modelica_metatype _inAccumString, modelica_integer _inStringLength, modelica_metatype _inAccumStrings);
#define Util_stringWrap2_rettypeboxed_1 targ1
typedef struct Util_stringWrap2_rettypeboxed_s
{
  modelica_metatype targ1; /* outStrings */
} Util_stringWrap2_rettypeboxed;

Util_stringWrap2_rettypeboxed boxptr_Util_stringWrap2(modelica_metatype _inString, modelica_metatype _inWrapLength, modelica_metatype _inDelimiter, modelica_metatype _inDelimiterLength, modelica_metatype _inAccumString, modelica_metatype _inStringLength, modelica_metatype _inAccumStrings);
#define List_split_rettype_1 targ1
#define List_split_rettype_2 targ2
typedef struct List_split_rettype_s
{
  modelica_metatype targ1; /* outList1 */
  modelica_metatype targ2; /* outList2 */
} List_split_rettype;

List_split_rettype _List_split(modelica_metatype _inList, modelica_integer _inPosition);
#define List_split_rettypeboxed_1 targ1
#define List_split_rettypeboxed_2 targ2
typedef struct List_split_rettypeboxed_s
{
  modelica_metatype targ1; /* outList1 */
  modelica_metatype targ2; /* outList2 */
} List_split_rettypeboxed;

List_split_rettypeboxed boxptr_List_split(modelica_metatype _inList, modelica_metatype _inPosition);
#define List_split2_rettype_1 targ1
#define List_split2_rettype_2 targ2
typedef struct List_split2_rettype_s
{
  modelica_metatype targ1; /* outList1 */
  modelica_metatype targ2; /* outList2 */
} List_split2_rettype;

List_split2_rettype _List_split2(modelica_metatype _inList1, modelica_metatype _inList2, modelica_integer _inPosition);
#define List_split2_rettypeboxed_1 targ1
#define List_split2_rettypeboxed_2 targ2
typedef struct List_split2_rettypeboxed_s
{
  modelica_metatype targ1; /* outList1 */
  modelica_metatype targ2; /* outList2 */
} List_split2_rettypeboxed;

List_split2_rettypeboxed boxptr_List_split2(modelica_metatype _inList1, modelica_metatype _inList2, modelica_metatype _inPosition);
#define List_position_rettype_1 targ1
typedef struct List_position_rettype_s
{
  modelica_integer targ1; /* outPosition */
} List_position_rettype;

List_position_rettype _List_position(modelica_metatype _inElement, modelica_metatype _inList);
#define List_position_rettypeboxed_1 targ1
typedef struct List_position_rettypeboxed_s
{
  modelica_metatype targ1; /* outPosition */
} List_position_rettypeboxed;

List_position_rettypeboxed boxptr_List_position(modelica_metatype _inElement, modelica_metatype _inList);
#define List_position__impl_rettype_1 targ1
typedef struct List_position__impl_rettype_s
{
  modelica_integer targ1; /* outPosition */
} List_position__impl_rettype;

List_position__impl_rettype _List_position__impl(modelica_metatype _inElement, modelica_metatype _inList, modelica_integer _inPosition);
#define List_position__impl_rettypeboxed_1 targ1
typedef struct List_position__impl_rettypeboxed_s
{
  modelica_metatype targ1; /* outPosition */
} List_position__impl_rettypeboxed;

List_position__impl_rettypeboxed boxptr_List_position__impl(modelica_metatype _inElement, modelica_metatype _inList, modelica_metatype _inPosition);
#define Util_stringPadRight_rettype_1 targ1
typedef struct Util_stringPadRight_rettype_s
{
  modelica_metatype targ1; /* outString */
} Util_stringPadRight_rettype;

Util_stringPadRight_rettype _Util_stringPadRight(modelica_metatype _inString, modelica_integer _inPadWidth, modelica_metatype _inPadString);
#define Util_stringPadRight_rettypeboxed_1 targ1
typedef struct Util_stringPadRight_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Util_stringPadRight_rettypeboxed;

Util_stringPadRight_rettypeboxed boxptr_Util_stringPadRight(modelica_metatype _inString, modelica_metatype _inPadWidth, modelica_metatype _inPadString);
#define List_fill_rettype_1 targ1
typedef struct List_fill_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_fill_rettype;

List_fill_rettype _List_fill(modelica_metatype _inElement, modelica_integer _inCount);
#define List_fill_rettypeboxed_1 targ1
typedef struct List_fill_rettypeboxed_s
{
  modelica_metatype targ1; /* outList */
} List_fill_rettypeboxed;

List_fill_rettypeboxed boxptr_List_fill(modelica_metatype _inElement, modelica_metatype _inCount);

void _Debug_fprintln(modelica_metatype _flag, modelica_metatype _str);
#define boxptr_Debug_fprintln _Debug_fprintln


void _Debug_bprintln(modelica_boolean _cond, modelica_metatype _str);

void boxptr_Debug_bprintln(modelica_metatype _cond, modelica_metatype _str);
#define Flags_isSet_rettype_1 targ1
typedef struct Flags_isSet_rettype_s
{
  modelica_boolean targ1; /* outValue */
} Flags_isSet_rettype;

Flags_isSet_rettype _Flags_isSet(modelica_metatype _inFlag);
#define Flags_isSet_rettypeboxed_1 targ1
typedef struct Flags_isSet_rettypeboxed_s
{
  modelica_metatype targ1; /* outValue */
} Flags_isSet_rettypeboxed;

Flags_isSet_rettypeboxed boxptr_Flags_isSet(modelica_metatype _inFlag);
#define List_fill__tail_rettype_1 targ1
typedef struct List_fill__tail_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_fill__tail_rettype;

List_fill__tail_rettype _List_fill__tail(modelica_metatype _inElement, modelica_integer _inCount, modelica_metatype _inAccumList);
#define List_fill__tail_rettypeboxed_1 targ1
typedef struct List_fill__tail_rettypeboxed_s
{
  modelica_metatype targ1; /* outList */
} List_fill__tail_rettypeboxed;

List_fill__tail_rettypeboxed boxptr_List_fill__tail(modelica_metatype _inElement, modelica_metatype _inCount, modelica_metatype _inAccumList);
#define Flags_printDebugFlag_rettype_1 targ1
typedef struct Flags_printDebugFlag_rettype_s
{
  modelica_metatype targ1; /* outString */
} Flags_printDebugFlag_rettype;

Flags_printDebugFlag_rettype _Flags_printDebugFlag(modelica_metatype _inFlag);
#define boxptr_Flags_printDebugFlag _Flags_printDebugFlag


void _Flags_printUsage();
#define boxptr_Flags_printUsage _Flags_printUsage

#define Flags_printAllConfigFlags_rettype_1 targ1
typedef struct Flags_printAllConfigFlags_rettype_s
{
  modelica_metatype targ1; /* outString */
} Flags_printAllConfigFlags_rettype;

Flags_printAllConfigFlags_rettype _Flags_printAllConfigFlags();
#define boxptr_Flags_printAllConfigFlags _Flags_printAllConfigFlags

#define Flags_printConfigFlag_rettype_1 targ1
typedef struct Flags_printConfigFlag_rettype_s
{
  modelica_metatype targ1; /* outString */
} Flags_printConfigFlag_rettype;

Flags_printConfigFlag_rettype _Flags_printConfigFlag(modelica_metatype _inFlag);
#define boxptr_Flags_printConfigFlag _Flags_printConfigFlag

#define Flags_printValidOptions_rettype_1 targ1
typedef struct Flags_printValidOptions_rettype_s
{
  modelica_metatype targ1; /* outString */
} Flags_printValidOptions_rettype;

Flags_printValidOptions_rettype _Flags_printValidOptions(modelica_metatype _inFlag);
#define boxptr_Flags_printValidOptions _Flags_printValidOptions

#define Flags_printFlagOptionDescShort_rettype_1 targ1
typedef struct Flags_printFlagOptionDescShort_rettype_s
{
  modelica_metatype targ1; /* outString */
} Flags_printFlagOptionDescShort_rettype;

Flags_printFlagOptionDescShort_rettype _Flags_printFlagOptionDescShort(modelica_metatype _inOption);
#define boxptr_Flags_printFlagOptionDescShort _Flags_printFlagOptionDescShort

#define Flags_printConfigFlagName_rettype_1 targ1
typedef struct Flags_printConfigFlagName_rettype_s
{
  modelica_metatype targ1; /* outString */
} Flags_printConfigFlagName_rettype;

Flags_printConfigFlagName_rettype _Flags_printConfigFlagName(modelica_metatype _inFlag);
#define boxptr_Flags_printConfigFlagName _Flags_printConfigFlagName

#define Util_stringPadLeft_rettype_1 targ1
typedef struct Util_stringPadLeft_rettype_s
{
  modelica_metatype targ1; /* outString */
} Util_stringPadLeft_rettype;

Util_stringPadLeft_rettype _Util_stringPadLeft(modelica_metatype _inString, modelica_integer _inPadWidth, modelica_metatype _inPadString);
#define Util_stringPadLeft_rettypeboxed_1 targ1
typedef struct Util_stringPadLeft_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} Util_stringPadLeft_rettypeboxed;

Util_stringPadLeft_rettypeboxed boxptr_Util_stringPadLeft(modelica_metatype _inString, modelica_metatype _inPadWidth, modelica_metatype _inPadString);
#define Settings_getVersionNr_rettype_1 targ1
typedef struct Settings_getVersionNr_rettype_s
{
  modelica_metatype targ1; /* outString */
} Settings_getVersionNr_rettype;

Settings_getVersionNr_rettype _Settings_getVersionNr();
#define boxptr_Settings_getVersionNr _Settings_getVersionNr

extern const char* Settings_getVersionNr();

void _List_map1__0(modelica_metatype _inList, modelica_fnptr inFunc, modelica_metatype _inArg1);
#define boxptr_List_map1__0 _List_map1__0


void _Flags_setDebugFlag(modelica_metatype _inFlag, modelica_metatype _inFlags);
#define boxptr_Flags_setDebugFlag _Flags_setDebugFlag


void _Flags_setDebugFlag2(modelica_metatype _inFlag, modelica_boolean _inValue, modelica_metatype _inFlags);

void boxptr_Flags_setDebugFlag2(modelica_metatype _inFlag, modelica_metatype _inValue, modelica_metatype _inFlags);
#define Flags_updateDebugFlagArray_rettype_1 targ1
#define Flags_updateDebugFlagArray_rettype_2 targ2
typedef struct Flags_updateDebugFlagArray_rettype_s
{
  modelica_metatype targ1; /* outFlags */
  modelica_boolean targ2; /* outOldValue */
} Flags_updateDebugFlagArray_rettype;

Flags_updateDebugFlagArray_rettype _Flags_updateDebugFlagArray(modelica_metatype _inFlags, modelica_boolean _inValue, modelica_metatype _inFlag);
#define Flags_updateDebugFlagArray_rettypeboxed_1 targ1
#define Flags_updateDebugFlagArray_rettypeboxed_2 targ2
typedef struct Flags_updateDebugFlagArray_rettypeboxed_s
{
  modelica_metatype targ1; /* outFlags */
  modelica_metatype targ2; /* outOldValue */
} Flags_updateDebugFlagArray_rettypeboxed;

Flags_updateDebugFlagArray_rettypeboxed boxptr_Flags_updateDebugFlagArray(modelica_metatype _inFlags, modelica_metatype _inValue, modelica_metatype _inFlag);
#define Flags_matchDebugFlag_rettype_1 targ1
typedef struct Flags_matchDebugFlag_rettype_s
{
  modelica_boolean targ1; /* outMatches */
} Flags_matchDebugFlag_rettype;

Flags_matchDebugFlag_rettype _Flags_matchDebugFlag(modelica_metatype _inFlagName, modelica_metatype _inFlag);
#define Flags_matchDebugFlag_rettypeboxed_1 targ1
typedef struct Flags_matchDebugFlag_rettypeboxed_s
{
  modelica_metatype targ1; /* outMatches */
} Flags_matchDebugFlag_rettypeboxed;

Flags_matchDebugFlag_rettypeboxed boxptr_Flags_matchDebugFlag(modelica_metatype _inFlagName, modelica_metatype _inFlag);
#define Util_stringRest_rettype_1 targ1
typedef struct Util_stringRest_rettype_s
{
  modelica_metatype targ1; /* outRest */
} Util_stringRest_rettype;

Util_stringRest_rettype _Util_stringRest(modelica_metatype _inString);
#define boxptr_Util_stringRest _Util_stringRest

#define List_flatten_rettype_1 targ1
typedef struct List_flatten_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_flatten_rettype;

List_flatten_rettype _List_flatten(modelica_metatype _inList);
#define boxptr_List_flatten _List_flatten

#define List_flatten__tail_rettype_1 targ1
typedef struct List_flatten__tail_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_flatten__tail_rettype;

List_flatten__tail_rettype _List_flatten__tail(modelica_metatype _inList, modelica_metatype _inAccumList);
#define boxptr_List_flatten__tail _List_flatten__tail

#define List_map1_rettype_1 targ1
typedef struct List_map1_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_map1_rettype;

List_map1_rettype _List_map1(modelica_metatype _inList, modelica_fnptr inFunc, modelica_metatype _inArg1);
#define boxptr_List_map1 _List_map1

#define List_map1__tail_rettype_1 targ1
typedef struct List_map1__tail_rettype_s
{
  modelica_metatype targ1; /* outList */
} List_map1__tail_rettype;

List_map1__tail_rettype _List_map1__tail(modelica_metatype _inList, modelica_fnptr inFunc, modelica_metatype _inArg1, modelica_metatype _inAccumList);
#define boxptr_List_map1__tail _List_map1__tail

#define System_strtok_rettype_1 targ1
typedef struct System_strtok_rettype_s
{
  modelica_metatype targ1; /* strings */
} System_strtok_rettype;

System_strtok_rettype _System_strtok(modelica_metatype _string, modelica_metatype _token);
#define boxptr_System_strtok _System_strtok

extern modelica_metatype System_strtok(const char* /*_string*/, const char* /*_token*/);

#ifdef __cplusplus
}
#endif
#endif

