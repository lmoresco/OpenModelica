#ifndef OMCC_main__H
#define OMCC_main__H
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
extern struct record_description Error_MessageType_SYNTAX__desc;
extern struct record_description Error_MessageType_GRAMMAR__desc;
extern struct record_description Error_MessageType_SYMBOLIC__desc;
extern struct record_description Error_MessageType_SIMULATION__desc;
extern struct record_description Error_Severity_WARNING__desc;
extern struct record_description Error_Severity_NOTIFICATION__desc;
extern struct record_description Absyn_Program_PROGRAM__desc;
extern struct record_description Absyn_TimeStamp_TIMESTAMP__desc;
extern struct record_description Absyn_Within_WITHIN__desc;
extern struct record_description Absyn_Path_QUALIFIED__desc;
extern struct record_description Absyn_Path_IDENT__desc;
extern struct record_description Absyn_Path_FULLYQUALIFIED__desc;
extern struct record_description Absyn_Within_TOP__desc;
extern struct record_description Absyn_Class_CLASS__desc;
extern struct record_description Absyn_Info_INFO__desc;
extern struct record_description Absyn_ClassDef_PARTS__desc;
extern struct record_description Absyn_ClassPart_PUBLIC__desc;
extern struct record_description Absyn_ElementItem_ELEMENTITEM__desc;
extern struct record_description Absyn_Element_ELEMENT__desc;
extern struct record_description Absyn_ConstrainClass_CONSTRAINCLASS__desc;
extern struct record_description Absyn_Comment_COMMENT__desc;
extern struct record_description Absyn_Annotation_ANNOTATION__desc;
extern struct record_description Absyn_ElementArg_MODIFICATION__desc;
extern struct record_description Absyn_Modification_CLASSMOD__desc;
extern struct record_description Absyn_EqMod_NOMOD__desc;
extern struct record_description Absyn_EqMod_EQMOD__desc;
extern struct record_description Absyn_Exp_INTEGER__desc;
extern struct record_description Absyn_Exp_REAL__desc;
extern struct record_description Absyn_Exp_CREF__desc;
extern struct record_description Absyn_ComponentRef_CREF__FULLYQUALIFIED__desc;
extern struct record_description Absyn_ComponentRef_CREF__QUAL__desc;
extern struct record_description Absyn_ComponentRef_CREF__IDENT__desc;
extern struct record_description Absyn_Subscript_NOSUB__desc;
extern struct record_description Absyn_Subscript_SUBSCRIPT__desc;
extern struct record_description Absyn_Exp_STRING__desc;
extern struct record_description Absyn_Exp_BOOL__desc;
extern struct record_description Absyn_Exp_BINARY__desc;
extern struct record_description Absyn_Exp_UNARY__desc;
extern struct record_description Absyn_Exp_LBINARY__desc;
extern struct record_description Absyn_Exp_LUNARY__desc;
extern struct record_description Absyn_Exp_RELATION__desc;
extern struct record_description Absyn_Exp_IFEXP__desc;
extern struct record_description Absyn_Exp_CALL__desc;
extern struct record_description Absyn_FunctionArgs_FUNCTIONARGS__desc;
extern struct record_description Absyn_NamedArg_NAMEDARG__desc;
extern struct record_description Absyn_Exp_PARTEVALFUNCTION__desc;
extern struct record_description Absyn_FunctionArgs_FOR__ITER__FARG__desc;
extern struct record_description Absyn_ForIterator_ITERATOR__desc;
extern struct record_description Absyn_Exp_ARRAY__desc;
extern struct record_description Absyn_Exp_MATRIX__desc;
extern struct record_description Absyn_Exp_RANGE__desc;
extern struct record_description Absyn_Exp_TUPLE__desc;
extern struct record_description Absyn_Exp_END__desc;
extern struct record_description Absyn_Exp_CODE__desc;
extern struct record_description Absyn_CodeNode_C__TYPENAME__desc;
extern struct record_description Absyn_CodeNode_C__VARIABLENAME__desc;
extern struct record_description Absyn_ComponentRef_WILD__desc;
extern struct record_description Absyn_ComponentRef_ALLWILD__desc;
extern struct record_description Absyn_ComponentRef_CREF__INVALID__desc;
extern struct record_description Absyn_CodeNode_C__CONSTRAINTSECTION__desc;
extern struct record_description Absyn_EquationItem_EQUATIONITEM__desc;
extern struct record_description Absyn_Equation_EQ__IF__desc;
extern struct record_description Absyn_EquationItem_EQUATIONITEMANN__desc;
extern struct record_description Absyn_Exp_AS__desc;
extern struct record_description Absyn_Exp_CONS__desc;
extern struct record_description Absyn_Exp_MATCHEXP__desc;
extern struct record_description Absyn_Case_CASE__desc;
extern struct record_description Absyn_Exp_LIST__desc;
extern struct record_description Absyn_ElementItem_ANNOTATIONITEM__desc;
extern struct record_description Absyn_ElementItem_LEXER__COMMENT__desc;
extern struct record_description Absyn_Case_ELSE__desc;
extern struct record_description Absyn_MatchType_MATCH__desc;
extern struct record_description Absyn_MatchType_MATCHCONTINUE__desc;
extern struct record_description Absyn_Equation_EQ__EQUALS__desc;
extern struct record_description Absyn_Equation_EQ__CONNECT__desc;
extern struct record_description Absyn_Equation_EQ__FOR__desc;
extern struct record_description Absyn_Equation_EQ__WHEN__E__desc;
extern struct record_description Absyn_Equation_EQ__NORETCALL__desc;
extern struct record_description Absyn_Equation_EQ__FAILURE__desc;
extern struct record_description Absyn_CodeNode_C__EQUATIONSECTION__desc;
extern struct record_description Absyn_CodeNode_C__ALGORITHMSECTION__desc;
extern struct record_description Absyn_AlgorithmItem_ALGORITHMITEM__desc;
extern struct record_description Absyn_Algorithm_ALG__ASSIGN__desc;
extern struct record_description Absyn_Algorithm_ALG__IF__desc;
extern struct record_description Absyn_AlgorithmItem_ALGORITHMITEMANN__desc;
extern struct record_description Absyn_Algorithm_ALG__FOR__desc;
extern struct record_description Absyn_Algorithm_ALG__PARFOR__desc;
extern struct record_description Absyn_Algorithm_ALG__WHILE__desc;
extern struct record_description Absyn_Algorithm_ALG__WHEN__A__desc;
extern struct record_description Absyn_Algorithm_ALG__NORETCALL__desc;
extern struct record_description Absyn_Algorithm_ALG__RETURN__desc;
extern struct record_description Absyn_Algorithm_ALG__BREAK__desc;
extern struct record_description Absyn_Algorithm_ALG__TRY__desc;
extern struct record_description Absyn_Algorithm_ALG__CATCH__desc;
extern struct record_description Absyn_Algorithm_ALG__THROW__desc;
extern struct record_description Absyn_Algorithm_ALG__FAILURE__desc;
extern struct record_description Absyn_CodeNode_C__ELEMENT__desc;
extern struct record_description Absyn_Element_DEFINEUNIT__desc;
extern struct record_description Absyn_Element_TEXT__desc;
extern struct record_description Absyn_CodeNode_C__EXPRESSION__desc;
extern struct record_description Absyn_CodeNode_C__MODIFICATION__desc;
extern struct record_description Absyn_Operator_ADD__desc;
extern struct record_description Absyn_Operator_SUB__desc;
extern struct record_description Absyn_Operator_MUL__desc;
extern struct record_description Absyn_Operator_DIV__desc;
extern struct record_description Absyn_Operator_POW__desc;
extern struct record_description Absyn_Operator_UPLUS__desc;
extern struct record_description Absyn_Operator_UMINUS__desc;
extern struct record_description Absyn_Operator_ADD__EW__desc;
extern struct record_description Absyn_Operator_SUB__EW__desc;
extern struct record_description Absyn_Operator_MUL__EW__desc;
extern struct record_description Absyn_Operator_DIV__EW__desc;
extern struct record_description Absyn_Operator_POW__EW__desc;
extern struct record_description Absyn_Operator_UPLUS__EW__desc;
extern struct record_description Absyn_Operator_UMINUS__EW__desc;
extern struct record_description Absyn_Operator_AND__desc;
extern struct record_description Absyn_Operator_OR__desc;
extern struct record_description Absyn_Operator_NOT__desc;
extern struct record_description Absyn_Operator_LESS__desc;
extern struct record_description Absyn_Operator_LESSEQ__desc;
extern struct record_description Absyn_Operator_GREATER__desc;
extern struct record_description Absyn_Operator_GREATEREQ__desc;
extern struct record_description Absyn_Operator_EQUAL__desc;
extern struct record_description Absyn_Operator_NEQUAL__desc;
extern struct record_description Absyn_ElementArg_REDECLARATION__desc;
extern struct record_description Absyn_ElementSpec_CLASSDEF__desc;
extern struct record_description Absyn_ElementSpec_EXTENDS__desc;
extern struct record_description Absyn_ElementSpec_IMPORT__desc;
extern struct record_description Absyn_Import_NAMED__IMPORT__desc;
extern struct record_description Absyn_Import_QUAL__IMPORT__desc;
extern struct record_description Absyn_Import_UNQUAL__IMPORT__desc;
extern struct record_description Absyn_Import_GROUP__IMPORT__desc;
extern struct record_description Absyn_GroupImport_GROUP__IMPORT__NAME__desc;
extern struct record_description Absyn_GroupImport_GROUP__IMPORT__RENAME__desc;
extern struct record_description Absyn_ElementSpec_COMPONENTS__desc;
extern struct record_description Absyn_ComponentItem_COMPONENTITEM__desc;
extern struct record_description Absyn_Component_COMPONENT__desc;
extern struct record_description Absyn_TypeSpec_TPATH__desc;
extern struct record_description Absyn_TypeSpec_TCOMPLEX__desc;
extern struct record_description Absyn_ElementAttributes_ATTR__desc;
extern struct record_description Absyn_Direction_INPUT__desc;
extern struct record_description Absyn_Direction_OUTPUT__desc;
extern struct record_description Absyn_Direction_BIDIR__desc;
extern struct record_description Absyn_Variability_VAR__desc;
extern struct record_description Absyn_Variability_DISCRETE__desc;
extern struct record_description Absyn_Variability_PARAM__desc;
extern struct record_description Absyn_Variability_CONST__desc;
extern struct record_description Absyn_Parallelism_PARGLOBAL__desc;
extern struct record_description Absyn_Parallelism_PARLOCAL__desc;
extern struct record_description Absyn_Parallelism_NON__PARALLEL__desc;
extern struct record_description Absyn_Each_EACH__desc;
extern struct record_description Absyn_Each_NON__EACH__desc;
extern struct record_description Absyn_RedeclareKeywords_REDECLARE__desc;
extern struct record_description Absyn_RedeclareKeywords_REPLACEABLE__desc;
extern struct record_description Absyn_RedeclareKeywords_REDECLARE__REPLACEABLE__desc;
extern struct record_description Absyn_InnerOuter_INNER__desc;
extern struct record_description Absyn_InnerOuter_OUTER__desc;
extern struct record_description Absyn_InnerOuter_INNER__OUTER__desc;
extern struct record_description Absyn_InnerOuter_NOT__INNER__OUTER__desc;
extern struct record_description Absyn_ClassPart_PROTECTED__desc;
extern struct record_description Absyn_ClassPart_CONSTRAINTS__desc;
extern struct record_description Absyn_ClassPart_EQUATIONS__desc;
extern struct record_description Absyn_ClassPart_INITIALEQUATIONS__desc;
extern struct record_description Absyn_ClassPart_ALGORITHMS__desc;
extern struct record_description Absyn_ClassPart_INITIALALGORITHMS__desc;
extern struct record_description Absyn_ClassPart_EXTERNAL__desc;
extern struct record_description Absyn_ExternalDecl_EXTERNALDECL__desc;
extern struct record_description Absyn_ClassDef_DERIVED__desc;
extern struct record_description Absyn_ClassDef_ENUMERATION__desc;
extern struct record_description Absyn_EnumDef_ENUMLITERALS__desc;
extern struct record_description Absyn_EnumLiteral_ENUMLITERAL__desc;
extern struct record_description Absyn_EnumDef_ENUM__COLON__desc;
extern struct record_description Absyn_ClassDef_OVERLOAD__desc;
extern struct record_description Absyn_ClassDef_CLASS__EXTENDS__desc;
extern struct record_description Absyn_ClassDef_PDER__desc;
extern struct record_description Absyn_Restriction_R__CLASS__desc;
extern struct record_description Absyn_Restriction_R__OPTIMIZATION__desc;
extern struct record_description Absyn_Restriction_R__MODEL__desc;
extern struct record_description Absyn_Restriction_R__RECORD__desc;
extern struct record_description Absyn_Restriction_R__BLOCK__desc;
extern struct record_description Absyn_Restriction_R__CONNECTOR__desc;
extern struct record_description Absyn_Restriction_R__EXP__CONNECTOR__desc;
extern struct record_description Absyn_Restriction_R__TYPE__desc;
extern struct record_description Absyn_Restriction_R__PACKAGE__desc;
extern struct record_description Absyn_Restriction_R__FUNCTION__desc;
extern struct record_description Absyn_FunctionRestriction_FR__NORMAL__FUNCTION__desc;
extern struct record_description Absyn_FunctionRestriction_FR__OPERATOR__FUNCTION__desc;
extern struct record_description Absyn_FunctionRestriction_FR__PARALLEL__FUNCTION__desc;
extern struct record_description Absyn_FunctionRestriction_FR__KERNEL__FUNCTION__desc;
extern struct record_description Absyn_Restriction_R__OPERATOR__desc;
extern struct record_description Absyn_Restriction_R__OPERATOR__RECORD__desc;
extern struct record_description Absyn_Restriction_R__ENUMERATION__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__INTEGER__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__REAL__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__STRING__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__BOOLEAN__desc;
extern struct record_description Absyn_Restriction_R__PREDEFINED__ENUMERATION__desc;
extern struct record_description Absyn_Restriction_R__UNIONTYPE__desc;
extern struct record_description Absyn_Restriction_R__METARECORD__desc;
extern struct record_description Absyn_Restriction_R__UNKNOWN__desc;
extern struct record_description Flags_Flags_FLAGS__desc;
extern struct record_description Error_MessageType_TRANSLATION__desc;
extern struct record_description Flags_FlagData_EMPTY__FLAG__desc;
extern struct record_description Flags_DebugFlag_DEBUG__FLAG__desc;
extern struct record_description Error_Message_MESSAGE__desc;
extern struct record_description Error_Severity_ERROR__desc;
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

void _OMCC_main(modelica_metatype _inStringLst);
#define boxptr_OMCC_main _OMCC_main

void _OMCC_printUsage();
#define boxptr_OMCC_printUsage _OMCC_printUsage

#define ParserGenerator_genParser_rettype_1 targ1
typedef struct ParserGenerator_genParser_rettype_s
{
  modelica_metatype targ1; /* result */
} ParserGenerator_genParser_rettype;

ParserGenerator_genParser_rettype _ParserGenerator_genParser(modelica_metatype _bisonFile, modelica_metatype _grammarFile, modelica_metatype _outFileName);
#define boxptr_ParserGenerator_genParser _ParserGenerator_genParser

#define ParserGenerator_buildParser_rettype_1 targ1
typedef struct ParserGenerator_buildParser_rettype_s
{
  modelica_boolean targ1; /* buildResult */
} ParserGenerator_buildParser_rettype;

ParserGenerator_buildParser_rettype _ParserGenerator_buildParser(modelica_metatype _outFileName);
#define ParserGenerator_buildParser_rettypeboxed_1 targ1
typedef struct ParserGenerator_buildParser_rettypeboxed_s
{
  modelica_metatype targ1; /* buildResult */
} ParserGenerator_buildParser_rettypeboxed;

ParserGenerator_buildParser_rettypeboxed boxptr_ParserGenerator_buildParser(modelica_metatype _outFileName);

void _System_writeFile(modelica_metatype _fileNameToWrite, modelica_metatype _stringToBeWritten);
#define boxptr_System_writeFile _System_writeFile

extern void System_writeFile(const char* /*_fileNameToWrite*/, const char* /*_stringToBeWritten*/);
#define System_stringReplace_rettype_1 targ1
typedef struct System_stringReplace_rettype_s
{
  modelica_metatype targ1; /* res */
} System_stringReplace_rettype;

System_stringReplace_rettype _System_stringReplace(modelica_metatype _str, modelica_metatype _source, modelica_metatype _target);
#define boxptr_System_stringReplace _System_stringReplace

extern const char* System_stringReplace(const char* /*_str*/, const char* /*_source*/, const char* /*_target*/);
#define ParserGenerator_getCurrentTimeStr_rettype_1 targ1
typedef struct ParserGenerator_getCurrentTimeStr_rettype_s
{
  modelica_metatype targ1; /* timeStr */
} ParserGenerator_getCurrentTimeStr_rettype;

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
#define System_readFile_rettype_1 targ1
typedef struct System_readFile_rettype_s
{
  modelica_metatype targ1; /* outString */
} System_readFile_rettype;

System_readFile_rettype _System_readFile(modelica_metatype _inString);
#define boxptr_System_readFile _System_readFile

extern const char* System_readFile(const char* /*_inString*/);
#define ParserGenerator_buildParserCode_rettype_1 targ1
typedef struct ParserGenerator_buildParserCode_rettype_s
{
  modelica_boolean targ1; /* buildResult */
} ParserGenerator_buildParserCode_rettype;

ParserGenerator_buildParserCode_rettype _ParserGenerator_buildParserCode(modelica_metatype _bisonCode, modelica_metatype _grammarFile, modelica_metatype _outFileName);
#define ParserGenerator_buildParserCode_rettypeboxed_1 targ1
typedef struct ParserGenerator_buildParserCode_rettypeboxed_s
{
  modelica_metatype targ1; /* buildResult */
} ParserGenerator_buildParserCode_rettypeboxed;

ParserGenerator_buildParserCode_rettypeboxed boxptr_ParserGenerator_buildParserCode(modelica_metatype _bisonCode, modelica_metatype _grammarFile, modelica_metatype _outFileName);
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
#define System_stringFind_rettype_1 targ1
typedef struct System_stringFind_rettype_s
{
  modelica_integer targ1; /* outInteger */
} System_stringFind_rettype;

System_stringFind_rettype _System_stringFind(modelica_metatype _str, modelica_metatype _searchStr);
#define System_stringFind_rettypeboxed_1 targ1
typedef struct System_stringFind_rettypeboxed_s
{
  modelica_metatype targ1; /* outInteger */
} System_stringFind_rettypeboxed;

System_stringFind_rettypeboxed boxptr_System_stringFind(modelica_metatype _str, modelica_metatype _searchStr);

extern int System_stringFind(const char* /*_str*/, const char* /*_searchStr*/);
#define System_stringFindString_rettype_1 targ1
typedef struct System_stringFindString_rettype_s
{
  modelica_metatype targ1; /* outString */
} System_stringFindString_rettype;

System_stringFindString_rettype _System_stringFindString(modelica_metatype _str, modelica_metatype _searchStr);
#define boxptr_System_stringFindString _System_stringFindString

extern const char* System_stringFindString(const char* /*_str*/, const char* /*_searchStr*/);
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
#define ParserGenerator_processRule_rettype_1 targ1
#define ParserGenerator_processRule_rettype_2 targ2
#define ParserGenerator_processRule_rettype_3 targ3
typedef struct ParserGenerator_processRule_rettype_s
{
  modelica_metatype targ1; /* processedRules */
  modelica_integer targ2; /* numTk */
  modelica_metatype targ3; /* types2 */
} ParserGenerator_processRule_rettype;

ParserGenerator_processRule_rettype _ParserGenerator_processRule(modelica_metatype _rule, modelica_metatype _types);
#define ParserGenerator_processRule_rettypeboxed_1 targ1
#define ParserGenerator_processRule_rettypeboxed_2 targ2
#define ParserGenerator_processRule_rettypeboxed_3 targ3
typedef struct ParserGenerator_processRule_rettypeboxed_s
{
  modelica_metatype targ1; /* processedRules */
  modelica_metatype targ2; /* numTk */
  modelica_metatype targ3; /* types2 */
} ParserGenerator_processRule_rettypeboxed;

ParserGenerator_processRule_rettypeboxed boxptr_ParserGenerator_processRule(modelica_metatype _rule, modelica_metatype _types);
#define ParserGenerator_replaceTokenVal_rettype_1 targ1
typedef struct ParserGenerator_replaceTokenVal_rettype_s
{
  modelica_metatype targ1; /* result */
} ParserGenerator_replaceTokenVal_rettype;

ParserGenerator_replaceTokenVal_rettype _ParserGenerator_replaceTokenVal(modelica_metatype _rule, modelica_integer _tok);
#define ParserGenerator_replaceTokenVal_rettypeboxed_1 targ1
typedef struct ParserGenerator_replaceTokenVal_rettypeboxed_s
{
  modelica_metatype targ1; /* result */
} ParserGenerator_replaceTokenVal_rettypeboxed;

ParserGenerator_replaceTokenVal_rettypeboxed boxptr_ParserGenerator_replaceTokenVal(modelica_metatype _rule, modelica_metatype _tok);
#define ParserGenerator_findTypeResult_rettype_1 targ1
typedef struct ParserGenerator_findTypeResult_rettype_s
{
  modelica_metatype targ1; /* typeTok */
} ParserGenerator_findTypeResult_rettype;

ParserGenerator_findTypeResult_rettype _ParserGenerator_findTypeResult(modelica_metatype _rule);
#define boxptr_ParserGenerator_findTypeResult _ParserGenerator_findTypeResult

#define ParserGenerator_findTypeToken_rettype_1 targ1
typedef struct ParserGenerator_findTypeToken_rettype_s
{
  modelica_metatype targ1; /* typeTok */
} ParserGenerator_findTypeToken_rettype;

ParserGenerator_findTypeToken_rettype _ParserGenerator_findTypeToken(modelica_metatype _rule, modelica_integer _tok);
#define ParserGenerator_findTypeToken_rettypeboxed_1 targ1
typedef struct ParserGenerator_findTypeToken_rettypeboxed_s
{
  modelica_metatype targ1; /* typeTok */
} ParserGenerator_findTypeToken_rettypeboxed;

ParserGenerator_findTypeToken_rettypeboxed boxptr_ParserGenerator_findTypeToken(modelica_metatype _rule, modelica_metatype _tok);
#define ParserGenerator_numTokens_rettype_1 targ1
typedef struct ParserGenerator_numTokens_rettype_s
{
  modelica_integer targ1; /* num */
} ParserGenerator_numTokens_rettype;

ParserGenerator_numTokens_rettype _ParserGenerator_numTokens(modelica_metatype _rule);
#define ParserGenerator_numTokens_rettypeboxed_1 targ1
typedef struct ParserGenerator_numTokens_rettypeboxed_s
{
  modelica_metatype targ1; /* num */
} ParserGenerator_numTokens_rettypeboxed;

ParserGenerator_numTokens_rettypeboxed boxptr_ParserGenerator_numTokens(modelica_metatype _rule);
#define ParserGenerator_reduceToken_rettype_1 targ1
typedef struct ParserGenerator_reduceToken_rettype_s
{
  modelica_metatype targ1; /* reduce */
} ParserGenerator_reduceToken_rettype;

ParserGenerator_reduceToken_rettype _ParserGenerator_reduceToken(modelica_metatype _rule, modelica_integer _tok);
#define ParserGenerator_reduceToken_rettypeboxed_1 targ1
typedef struct ParserGenerator_reduceToken_rettypeboxed_s
{
  modelica_metatype targ1; /* reduce */
} ParserGenerator_reduceToken_rettypeboxed;

ParserGenerator_reduceToken_rettypeboxed boxptr_ParserGenerator_reduceToken(modelica_metatype _rule, modelica_metatype _tok);
#define System_regex_rettype_1 targ1
#define System_regex_rettype_2 targ2
typedef struct System_regex_rettype_s
{
  modelica_integer targ1; /* numMatches */
  modelica_metatype targ2; /* strs */
} System_regex_rettype;

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
#define ParserGenerator_findValue_rettype_1 targ1
typedef struct ParserGenerator_findValue_rettype_s
{
  modelica_integer targ1; /* value */
} ParserGenerator_findValue_rettype;

ParserGenerator_findValue_rettype _ParserGenerator_findValue(modelica_metatype _bisonCode, modelica_metatype _variable);
#define ParserGenerator_findValue_rettypeboxed_1 targ1
typedef struct ParserGenerator_findValue_rettypeboxed_s
{
  modelica_metatype targ1; /* value */
} ParserGenerator_findValue_rettypeboxed;

ParserGenerator_findValue_rettypeboxed boxptr_ParserGenerator_findValue(modelica_metatype _bisonCode, modelica_metatype _variable);
#define ParserGenerator_readPrologEpilog_rettype_1 targ1
typedef struct ParserGenerator_readPrologEpilog_rettype_s
{
  modelica_metatype targ1; /* parserCodeIncluded */
} ParserGenerator_readPrologEpilog_rettype;

ParserGenerator_readPrologEpilog_rettype _ParserGenerator_readPrologEpilog(modelica_metatype _parserCode, modelica_metatype _grammarFileName);
#define boxptr_ParserGenerator_readPrologEpilog _ParserGenerator_readPrologEpilog

#define ParserGenerator_buildTokens_rettype_1 targ1
typedef struct ParserGenerator_buildTokens_rettype_s
{
  modelica_boolean targ1; /* buildResult */
} ParserGenerator_buildTokens_rettype;

ParserGenerator_buildTokens_rettype _ParserGenerator_buildTokens(modelica_metatype _bisonCode, modelica_metatype _outFileName);
#define ParserGenerator_buildTokens_rettypeboxed_1 targ1
typedef struct ParserGenerator_buildTokens_rettypeboxed_s
{
  modelica_metatype targ1; /* buildResult */
} ParserGenerator_buildTokens_rettypeboxed;

ParserGenerator_buildTokens_rettypeboxed boxptr_ParserGenerator_buildTokens(modelica_metatype _bisonCode, modelica_metatype _outFileName);
#define System_trim_rettype_1 targ1
typedef struct System_trim_rettype_s
{
  modelica_metatype targ1; /* outString */
} System_trim_rettype;

System_trim_rettype _System_trim(modelica_metatype _inString, modelica_metatype _charsToRemove);
#define boxptr_System_trim _System_trim

extern const char* System_trim(const char* /*_inString*/, const char* /*_charsToRemove*/);
#define System_strtok_rettype_1 targ1
typedef struct System_strtok_rettype_s
{
  modelica_metatype targ1; /* strings */
} System_strtok_rettype;

System_strtok_rettype _System_strtok(modelica_metatype _string, modelica_metatype _token);
#define boxptr_System_strtok _System_strtok

extern modelica_metatype System_strtok(const char* /*_string*/, const char* /*_token*/);
#define ParserGenerator_buildParseTable_rettype_1 targ1
typedef struct ParserGenerator_buildParseTable_rettype_s
{
  modelica_boolean targ1; /* buildResult */
} ParserGenerator_buildParseTable_rettype;

ParserGenerator_buildParseTable_rettype _ParserGenerator_buildParseTable(modelica_metatype _bisonCode, modelica_metatype _outFileName);
#define ParserGenerator_buildParseTable_rettypeboxed_1 targ1
typedef struct ParserGenerator_buildParseTable_rettypeboxed_s
{
  modelica_metatype targ1; /* buildResult */
} ParserGenerator_buildParseTable_rettypeboxed;

ParserGenerator_buildParseTable_rettypeboxed boxptr_ParserGenerator_buildParseTable(modelica_metatype _bisonCode, modelica_metatype _outFileName);
#define LexerGenerator_genLexer_rettype_1 targ1
typedef struct LexerGenerator_genLexer_rettype_s
{
  modelica_metatype targ1; /* result */
} LexerGenerator_genLexer_rettype;

LexerGenerator_genLexer_rettype _LexerGenerator_genLexer(modelica_metatype _flexFile, modelica_metatype _grammarFile, modelica_metatype _outFileName);
#define boxptr_LexerGenerator_genLexer _LexerGenerator_genLexer

#define LexerGenerator_buildLexer_rettype_1 targ1
typedef struct LexerGenerator_buildLexer_rettype_s
{
  modelica_boolean targ1; /* buildResult */
} LexerGenerator_buildLexer_rettype;

LexerGenerator_buildLexer_rettype _LexerGenerator_buildLexer(modelica_metatype _outFileName);
#define LexerGenerator_buildLexer_rettypeboxed_1 targ1
typedef struct LexerGenerator_buildLexer_rettypeboxed_s
{
  modelica_metatype targ1; /* buildResult */
} LexerGenerator_buildLexer_rettypeboxed;

LexerGenerator_buildLexer_rettypeboxed boxptr_LexerGenerator_buildLexer(modelica_metatype _outFileName);
#define LexerGenerator_getCurrentTimeStr_rettype_1 targ1
typedef struct LexerGenerator_getCurrentTimeStr_rettype_s
{
  modelica_metatype targ1; /* timeStr */
} LexerGenerator_getCurrentTimeStr_rettype;

LexerGenerator_getCurrentTimeStr_rettype _LexerGenerator_getCurrentTimeStr();
#define boxptr_LexerGenerator_getCurrentTimeStr _LexerGenerator_getCurrentTimeStr

#define LexerGenerator_buildLexerCode_rettype_1 targ1
typedef struct LexerGenerator_buildLexerCode_rettype_s
{
  modelica_boolean targ1; /* buildResult */
} LexerGenerator_buildLexerCode_rettype;

LexerGenerator_buildLexerCode_rettype _LexerGenerator_buildLexerCode(modelica_metatype _flexCode, modelica_metatype _grammarFile, modelica_metatype _outFileName);
#define LexerGenerator_buildLexerCode_rettypeboxed_1 targ1
typedef struct LexerGenerator_buildLexerCode_rettypeboxed_s
{
  modelica_metatype targ1; /* buildResult */
} LexerGenerator_buildLexerCode_rettypeboxed;

LexerGenerator_buildLexerCode_rettypeboxed boxptr_LexerGenerator_buildLexerCode(modelica_metatype _flexCode, modelica_metatype _grammarFile, modelica_metatype _outFileName);
#define LexerGenerator_findValue_rettype_1 targ1
typedef struct LexerGenerator_findValue_rettype_s
{
  modelica_integer targ1; /* value */
} LexerGenerator_findValue_rettype;

LexerGenerator_findValue_rettype _LexerGenerator_findValue(modelica_metatype _flexCode, modelica_metatype _variable);
#define LexerGenerator_findValue_rettypeboxed_1 targ1
typedef struct LexerGenerator_findValue_rettypeboxed_s
{
  modelica_metatype targ1; /* value */
} LexerGenerator_findValue_rettypeboxed;

LexerGenerator_findValue_rettypeboxed boxptr_LexerGenerator_findValue(modelica_metatype _flexCode, modelica_metatype _variable);
#define LexerGenerator_substring2_rettype_1 targ1
typedef struct LexerGenerator_substring2_rettype_s
{
  modelica_metatype targ1; /* outString */
} LexerGenerator_substring2_rettype;

LexerGenerator_substring2_rettype _LexerGenerator_substring2(modelica_metatype _inString, modelica_integer _start, modelica_integer _stop);
#define LexerGenerator_substring2_rettypeboxed_1 targ1
typedef struct LexerGenerator_substring2_rettypeboxed_s
{
  modelica_metatype targ1; /* outString */
} LexerGenerator_substring2_rettypeboxed;

LexerGenerator_substring2_rettypeboxed boxptr_LexerGenerator_substring2(modelica_metatype _inString, modelica_metatype _start, modelica_metatype _stop);
#define LexerGenerator_readPrologEpilog_rettype_1 targ1
typedef struct LexerGenerator_readPrologEpilog_rettype_s
{
  modelica_metatype targ1; /* lexerCodeIncluded */
} LexerGenerator_readPrologEpilog_rettype;

LexerGenerator_readPrologEpilog_rettype _LexerGenerator_readPrologEpilog(modelica_metatype _lexerCode, modelica_metatype _grammarFileName);
#define boxptr_LexerGenerator_readPrologEpilog _LexerGenerator_readPrologEpilog

#define LexerGenerator_buildLexTable_rettype_1 targ1
typedef struct LexerGenerator_buildLexTable_rettype_s
{
  modelica_boolean targ1; /* buildResult */
} LexerGenerator_buildLexTable_rettype;

LexerGenerator_buildLexTable_rettype _LexerGenerator_buildLexTable(modelica_metatype _flexCode, modelica_metatype _outFileName);
#define LexerGenerator_buildLexTable_rettypeboxed_1 targ1
typedef struct LexerGenerator_buildLexTable_rettypeboxed_s
{
  modelica_metatype targ1; /* buildResult */
} LexerGenerator_buildLexTable_rettypeboxed;

LexerGenerator_buildLexTable_rettypeboxed boxptr_LexerGenerator_buildLexTable(modelica_metatype _flexCode, modelica_metatype _outFileName);
#define System_systemCall_rettype_1 targ1
typedef struct System_systemCall_rettype_s
{
  modelica_integer targ1; /* outInteger */
} System_systemCall_rettype;

System_systemCall_rettype _System_systemCall(modelica_metatype _inString);
#define System_systemCall_rettypeboxed_1 targ1
typedef struct System_systemCall_rettypeboxed_s
{
  modelica_metatype targ1; /* outInteger */
} System_systemCall_rettypeboxed;

System_systemCall_rettypeboxed boxptr_System_systemCall(modelica_metatype _inString);

extern int SystemImpl__systemCall(const char* /*_inString*/);
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


void _Error_addMessage(modelica_metatype _inErrorMsg, modelica_metatype _inMessageTokens);
#define boxptr_Error_addMessage _Error_addMessage


void _ErrorExt_addMessage(modelica_integer _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_metatype _msg, modelica_metatype _msg_tokens);

void boxptr_ErrorExt_addMessage(modelica_metatype _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_metatype _msg, modelica_metatype _msg_tokens);

extern void Error_addMessage(int /*_id*/, modelica_metatype /*_msg_type*/, modelica_metatype /*_msg_severity*/, const char* /*_msg*/, modelica_metatype /*_msg_tokens*/);

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

void _Print_printErrorBuf(modelica_metatype _inString);
#define boxptr_Print_printErrorBuf _Print_printErrorBuf

extern void Print_printErrorBuf(const char* /*_inString*/);
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

#ifdef __cplusplus
}
#endif
#endif

