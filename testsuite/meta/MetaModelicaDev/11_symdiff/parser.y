%{
#include <stdio.h>

#define YYSTYPE void*
void* absyntree;

int yyerror(char *s)
{
  extern int yylineno;
  fprintf(stderr,"Syntax error at or near line %d.\n",yylineno);
}

int yywrap()
{
  return 1;
}

#ifdef RML
#include "Exp.h"
#include "yacclib.h"
#else
#include "meta_modelica.h"
void* getAST()
{
  return absyntree;
}

/* Exp */
const char* Exp_REAL__desc__fields[] = {"real"};
struct record_description Exp_REAL__desc = {
    "Exp_REAL",
    "Exp.REAL",
    Exp_REAL__desc__fields
};
const char* Exp_ADD__desc__fields[] = {"exp1","exp2"};
struct record_description Exp_ADD__desc = {
    "Exp_ADD",
    "Exp.ADD",
    Exp_ADD__desc__fields
};
const char* Exp_SUB__desc__fields[] = {"exp1","exp2"};
struct record_description Exp_SUB__desc = {
    "Exp_SUB",
    "Exp.SUB",
    Exp_SUB__desc__fields
};
const char* Exp_MUL__desc__fields[] = {"exp1","exp2"};
struct record_description Exp_MUL__desc = {
    "Exp_MUL",
    "Exp.MUL",
    Exp_MUL__desc__fields
};
const char* Exp_DIV__desc__fields[] = {"exp1","exp2"};
struct record_description Exp_DIV__desc = {
    "Exp_DIV",
    "Exp.DIV",
    Exp_DIV__desc__fields
};
const char* Exp_NEG__desc__fields[] = {"exp"};
struct record_description Exp_NEG__desc = {
    "Exp_NEG",
    "Exp.NEG",
    Exp_NEG__desc__fields
};
const char* Exp_IDENT__desc__fields[] = {"id"};
struct record_description Exp_IDENT__desc = {
    "Exp_IDENT",
    "Exp.IDENT",
    Exp_IDENT__desc__fields
};
const char* Exp_CALL__desc__fields[] = {"id","args"};
struct record_description Exp_CALL__desc = {
    "Exp_CALL",
    "Exp.CALL",
    Exp_CALL__desc__fields
};

#define Exp__REAL(X1) (mmc_mk_box2(3,&Exp_REAL__desc,(X1)))
#define Exp__ADD(X1,X2) (mmc_mk_box3(4,&Exp_ADD__desc,(X1),(X2)))
#define Exp__SUB(X1,X2) (mmc_mk_box3(5,&Exp_SUB__desc,(X1),(X2)))
#define Exp__MUL(X1,X2) (mmc_mk_box3(6,&Exp_MUL__desc,(X1),(X2)))
#define Exp__DIV(X1,X2) (mmc_mk_box3(7,&Exp_DIV__desc,(X1),(X2)))
#define Exp__NEG(X1) (mmc_mk_box2(8,&Exp_NEG__desc,(X1)))
#define Exp__IDENT(X1) (mmc_mk_box2(9,&Exp_IDENT__desc,(X1)))
#define Exp__CALL(X1,X2) (mmc_mk_box3(10,&Exp_CALL__desc,(X1),(X2)))
#endif

%}

%token T_COMMA
%token T_ASSIGN
%token T_IDENT
%token T_REALCONST
%token T_LPAREN T_RPAREN
%token T_ADD
%token T_SUB
%token T_MUL
%token T_DIV
%token T_GARBAGE

%token T_ERR

%%

/* Yacc BNF grammar */

program         : expression
                        { absyntree = $1; }

expression      :  term
                        { $$ = $1;}
                |  expression  T_ADD  term
                        { $$ = (void*) Exp__ADD($1, $3);}
                |  expression  T_SUB  term
                        { $$ = (void*) Exp__SUB($1, $3);}

term            :  u_element
                        { $$ = $1;}
                |  term  T_MUL u_element
                        { $$ = (void*) Exp__MUL($1, $3);}
                |  term  T_DIV u_element
                        { $$ = (void*) Exp__DIV($1, $3);}

u_element       :  element
                        { $$ = $1;}
                |  T_SUB element
                        { $$ = (void*) Exp__NEG($2);}

element         :  T_REALCONST
                        { $$ = (void*) Exp__REAL($1);}
                |  T_IDENT T_LPAREN call_args T_RPAREN
                        { $$ = (void*) Exp__CALL($1,$3);}
                |  T_IDENT
                        { $$ = (void*) Exp__IDENT($1);}
                |  T_LPAREN  expression  T_RPAREN
                        { $$ = $2;}

call_args       :  expression
                        { $$ = (void*) mmc_mk_cons($1,mmc_mk_nil());}
                |  expression T_COMMA call_args
                        { $$ = (void*) mmc_mk_cons($1,$3);}

