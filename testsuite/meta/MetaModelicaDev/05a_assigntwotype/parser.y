%{
#include <stdio.h>

#define YYSTYPE void*
void* absyntree;

int yyerror(char *s)
{
  extern int yylineno;
  fprintf(stderr,"Syntax error at or near line %d.\n",yylineno);
  exit(1);
}

int yywrap()
{
  return 1;
}

#ifdef RML
#include "yacclib.h"
#include "AssignTwoType.h"
#ifndef AssignTwoType__STRING
#define AssignTwoType__STRING(X) yyerror(X)
#endif
#else
#include "meta_modelica.h"
void* getAST()
{
  return absyntree;
}

/* Program */
const char* AssignTwoType_PROGRAM__desc__fields[] = {"expLst","exp"};
struct record_description AssignTwoType_PROGRAM__desc = {
    "AssignTwoType_PROGRAM",
    "AssignTwoType.PROGRAM",
    AssignTwoType_PROGRAM__desc__fields
};

#define AssignTwoType__PROGRAM(X1,X2) (mmc_mk_box3(3,&AssignTwoType_PROGRAM__desc,(X1),(X2)))

/* Exp */
const char* AssignTwoType_INT__desc__fields[] = {"integer"};
struct record_description AssignTwoType_INT__desc = {
    "AssignTwoType_INT",
    "AssignTwoType.INT",
    AssignTwoType_INT__desc__fields
};
const char* AssignTwoType_REAL__desc__fields[] = {"real"};
struct record_description AssignTwoType_REAL__desc = {
    "AssignTwoType_REAL",
    "AssignTwoType.REAL",
    AssignTwoType_REAL__desc__fields
};
const char* AssignTwoType_BINARY__desc__fields[] = {"exp1","binOp2","exp3"};
struct record_description AssignTwoType_BINARY__desc = {
    "AssignTwoType_BINARY",
    "AssignTwoType.BINARY",
    AssignTwoType_BINARY__desc__fields
};
const char* AssignTwoType_UNARY__desc__fields[] = {"unOp","exp"};
struct record_description AssignTwoType_UNARY__desc = {
    "AssignTwoType_UNARY",
    "AssignTwoType.UNARY",
    AssignTwoType_UNARY__desc__fields
};
const char* AssignTwoType_ASSIGN__desc__fields[] = {"ident","exp"};
struct record_description AssignTwoType_ASSIGN__desc = {
    "AssignTwoType_ASSIGN",
    "AssignTwoType.ASSIGN",
    AssignTwoType_ASSIGN__desc__fields
};
const char* AssignTwoType_IDENT__desc__fields[] = {"ident"};
struct record_description AssignTwoType_IDENT__desc = {
    "AssignTwoType_IDENT",
    "AssignTwoType.IDENT",
    AssignTwoType_IDENT__desc__fields
};
const char* AssignTwoType_STRING__desc__fields[] = {"string"};
struct record_description AssignTwoType_STRING__desc = {
    "AssignTwoType_STRING",
    "AssignTwoType.STRING",
    AssignTwoType_STRING__desc__fields
};

#define AssignTwoType__INT(X1) (mmc_mk_box2(3,&AssignTwoType_INT__desc,(X1)))
#define AssignTwoType__REAL(X1) (mmc_mk_box2(4,&AssignTwoType_REAL__desc,(X1)))
#define AssignTwoType__BINARY(X1,OP,X2) (mmc_mk_box4(5,&AssignTwoType_BINARY__desc,(X1),(OP),(X2)))
#define AssignTwoType__UNARY(OP,X1) (mmc_mk_box3(6,&AssignTwoType_UNARY__desc,(OP),(X1)))
#define AssignTwoType__ASSIGN(X1,X2) (mmc_mk_box3(7,&AssignTwoType_ASSIGN__desc,(X1),(X2)))
#define AssignTwoType__IDENT(X1) (mmc_mk_box2(8,&AssignTwoType_IDENT__desc,(X1)))
#define AssignTwoType__STRING(X1) (mmc_mk_box2(9,&AssignTwoType_STRING__desc,(X1)))

/* BinOp */
const char* AssignTwoType_ADD__desc__fields[] = {};
struct record_description AssignTwoType_ADD__desc = {
    "AssignTwoType_ADD",
    "AssignTwoType.ADD",
    AssignTwoType_ADD__desc__fields
};
const char* AssignTwoType_SUB__desc__fields[] = {};
struct record_description AssignTwoType_SUB__desc = {
    "AssignTwoType_SUB",
    "AssignTwoType.SUB",
    AssignTwoType_SUB__desc__fields
};
const char* AssignTwoType_MUL__desc__fields[] = {};
struct record_description AssignTwoType_MUL__desc = {
    "AssignTwoType_MUL",
    "AssignTwoType.MUL",
    AssignTwoType_MUL__desc__fields
};
const char* AssignTwoType_DIV__desc__fields[] = {};
struct record_description AssignTwoType_DIV__desc = {
    "AssignTwoType_DIV",
    "AssignTwoType.DIV",
    AssignTwoType_DIV__desc__fields
};

#define AssignTwoType__ADD (mmc_mk_box1(3,&AssignTwoType_ADD__desc))
#define AssignTwoType__SUB (mmc_mk_box1(4,&AssignTwoType_SUB__desc))
#define AssignTwoType__MUL (mmc_mk_box1(5,&AssignTwoType_MUL__desc))
#define AssignTwoType__DIV (mmc_mk_box1(6,&AssignTwoType_DIV__desc))

/* UnOp */
const char* AssignTwoType_NEG__desc__fields[] = {};
struct record_description AssignTwoType_NEG__desc = {
    "AssignTwoType_NEG",
    "AssignTwoType.NEG",
    AssignTwoType_NEG__desc__fields
};

#define AssignTwoType__NEG (mmc_mk_box1(3,&AssignTwoType_NEG__desc))
#endif

%}

%token T_SEMIC
%token T_ASSIGN
%token T_IDENT
%token T_INTCONST
%token T_REALCONST
%token T_STRINGCONST
%token T_LPAREN T_RPAREN
%token T_ADD
%token T_SUB
%token T_MUL
%token T_DIV
%token T_GARBAGE

%token T_ERR

%%

/* Yacc BNF grammar of the expression language Assigntwotypes */

program         :  assignments T_SEMIC expression
                        { absyntree = (void*) AssignTwoType__PROGRAM($1, $3);}

assignments     :  assignments  assignment
                        { $$ = (void*) mmc_mk_cons($2, $1);}
                |
                        { $$ = (void*) mmc_mk_nil();}

assignment      :  T_IDENT  T_ASSIGN  expression
                        { $$ = (void*) AssignTwoType__ASSIGN($1, $3);}

expression      :  term
                        { $$ = $1;}
                |  expression  weak_operator  term
                        { $$ = (void*) AssignTwoType__BINARY($1, $2, $3);}

term            :  u_element
                        { $$ = $1;}
                |  term  strong_operator  u_element
                        { $$ = (void*) AssignTwoType__BINARY($1, $2, $3);}

u_element       :  element
                        { $$ = $1;}
                |  unary_operator  element
                        { $$ = (void*) AssignTwoType__UNARY($1, $2);}

element         :  T_INTCONST
                        { $$ = (void*) AssignTwoType__INT($1);}
                |  T_REALCONST
                        { $$ = (void*) AssignTwoType__REAL($1);}
                |  T_STRINGCONST
                        { $$ = (void*) AssignTwoType__STRING($1); }
                |  T_IDENT
                        { $$ = (void*) AssignTwoType__IDENT($1);}
                |  T_LPAREN  expression  T_RPAREN
                        { $$ = $2;}
                |  T_LPAREN  assignment  T_RPAREN
                        { $$ = $2;}

weak_operator   :  T_ADD
                        { $$ = (void*) AssignTwoType__ADD;}
                |  T_SUB
                        { $$ = (void*) AssignTwoType__SUB;}

strong_operator :  T_MUL
                        { $$ = (void*) AssignTwoType__MUL;}
                |  T_DIV
                        { $$ = (void*) AssignTwoType__DIV;}

unary_operator  :  T_SUB
                        { $$ = (void*) AssignTwoType__NEG;}


