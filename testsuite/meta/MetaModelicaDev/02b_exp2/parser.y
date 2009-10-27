%{
#include <stdlib.h>
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
#include "Exp2.h"
#include "yacclib.h"
#ifndef Exp2__FAC
#define Exp2__FAC (void*)yyerror("")
#endif
#ifndef Exp2__POW
#define Exp2__POW (void*)yyerror("")
#endif
#else
#include "meta_modelica.h"

void* getAST()
{
  return absyntree;
}

/* Exp */
const char* Exp2_BINARY__desc__fields[] = {"Exp2","binOp2","exp3"};
struct record_description Exp2_BINARY__desc = {
    "Exp2_BINARY",
    "Exp2.BINARY",
    Exp2_BINARY__desc__fields
};
const char* Exp2_UNARY__desc__fields[] = {"unOp","exp"};
struct record_description Exp2_UNARY__desc = {
    "Exp2_UNARY",
    "Exp2.UNARY",
    Exp2_UNARY__desc__fields
};
#define Exp2__BINARY(X1,OP,X2) (mmc_mk_box4(4,&Exp2_BINARY__desc,(X1),(OP),(X2)))
#define Exp2__UNARY(OP,X1) (mmc_mk_box3(5,&Exp2_UNARY__desc,(OP),(X1)))

/* BinOp */
const char* Exp2_ADD__desc__fields[] = {};
struct record_description Exp2_ADD__desc = {
    "Exp2_ADD",
    "Exp2.ADD",
    Exp2_ADD__desc__fields
};
const char* Exp2_SUB__desc__fields[] = {};
struct record_description Exp2_SUB__desc = {
    "Exp2_SUB",
    "Exp2.SUB",
    Exp2_SUB__desc__fields
};
const char* Exp2_MUL__desc__fields[] = {};
struct record_description Exp2_MUL__desc = {
    "Exp2_MUL",
    "Exp2.MUL",
    Exp2_MUL__desc__fields
};
const char* Exp2_DIV__desc__fields[] = {};
struct record_description Exp2_DIV__desc = {
    "Exp2_DIV",
    "Exp2.DIV",
    Exp2_DIV__desc__fields
};
const char* Exp2_POW__desc__fields[] = {};
struct record_description Exp2_POW__desc = {
    "Exp2_POW",
    "Exp2.POW",
    Exp2_POW__desc__fields
};

#define Exp2__ADD (mmc_mk_box1(3,&Exp2_ADD__desc))
#define Exp2__SUB (mmc_mk_box1(4,&Exp2_SUB__desc))
#define Exp2__MUL (mmc_mk_box1(5,&Exp2_MUL__desc))
#define Exp2__DIV (mmc_mk_box1(6,&Exp2_DIV__desc))
#define Exp2__POW (mmc_mk_box1(8,&Exp2_POW__desc))

/* UnOp */
const char* Exp2_NEG__desc__fields[] = {};
struct record_description Exp2_NEG__desc = {
    "Exp2_NEG",
    "Exp2.NEG",
    Exp2_NEG__desc__fields
};
const char* Exp2_FAC__desc__fields[] = {};
struct record_description Exp2_FAC__desc = {
    "Exp2_FAC",
    "Exp2.FAC",
    Exp2_FAC__desc__fields
};

#define Exp2__NEG (mmc_mk_box1(3,&Exp2_NEG__desc))
#define Exp2__FAC (mmc_mk_box1(4,&Exp2_FAC__desc))
#endif

%}

%token T_INTCONST
%token T_LPAREN T_RPAREN
%token T_ADD
%token T_SUB
%token T_MUL
%token T_DIV
%token T_GARBAGE
%token T_FACTORIAL
%token T_POW

%token T_ERR

%%

/* Yacc BNF Syntax of the expression language Exp2 */

program
                 :  expression
                    { absyntree = $1; }

expression       :  term
                 |  expression  T_ADD  term
                    { $$ = Exp2__BINARY($1, Exp2__ADD, $3);}
                 |  expression  T_SUB  term
                    { $$ = Exp2__BINARY($1, Exp2__SUB, $3);}
                 
term             :  u_element
                 |  term  T_MUL  u_element
                    { $$ = Exp2__BINARY($1, Exp2__MUL, $3);}
                 |  term  T_DIV  u_element
                    { $$ = Exp2__BINARY($1, Exp2__DIV, $3);}

u_element        :  element
                 |  T_SUB  element
                    { $$ = Exp2__UNARY(Exp2__NEG, $2);}
                 |  T_FACTORIAL  element
                    { $$ = Exp2__UNARY(Exp2__FAC, $2);}
                 |  element T_POW  u_element
                    { $$ = Exp2__BINARY($1, Exp2__POW, $3);}

element          :  T_INTCONST
                 |  T_LPAREN  expression  T_RPAREN
                    { $$ = $2;}




