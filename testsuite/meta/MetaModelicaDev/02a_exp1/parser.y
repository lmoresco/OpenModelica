%{
#include <stdio.h>
#include "meta_modelica.h"

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

void* getAST()
{
  return absyntree;
}

const char* Exp1_ADDop__desc__fields[] = {"exp1","exp2"};
struct record_description Exp1_ADDop__desc = {
    "Exp1_ADDop",
    "Exp1.ADDop",
    Exp1_ADDop__desc__fields
};
const char* Exp1_SUBop__desc__fields[] = {"exp1","exp2"};
struct record_description Exp1_SUBop__desc = {
    "Exp1_SUBop",
    "Exp1.SUBop",
    Exp1_SUBop__desc__fields
};
const char* Exp1_MULop__desc__fields[] = {"exp1","exp2"};
struct record_description Exp1_MULop__desc = {
    "Exp1_MULop",
    "Exp1.MULop",
    Exp1_MULop__desc__fields
};
const char* Exp1_DIVop__desc__fields[] = {"exp1","exp2"};
struct record_description Exp1_DIVop__desc = {
    "Exp1_DIVop",
    "Exp1.DIVop",
    Exp1_DIVop__desc__fields
};
const char* Exp1_NEGop__desc__fields[] = {"exp"};
struct record_description Exp1_NEGop__desc = {
    "Exp1_NEGop",
    "Exp1.NEGop",
    Exp1_NEGop__desc__fields
};
const char* Exp1_POWop__desc__fields[] = {"exp1","exp2"};
struct record_description Exp1_POWop__desc = {
    "Exp1_POWop",
    "Exp1.POWop",
    Exp1_POWop__desc__fields
};
const char* Exp1_FACop__desc__fields[] = {"exp"};
struct record_description Exp1_FACop__desc = {
    "Exp1_FACop",
    "Exp1.FACop",
    Exp1_FACop__desc__fields
};

#define Exp1__ADDop(X1,X2) (mmc_mk_box3(4,&Exp1_ADDop__desc,(X1),(X2)))
#define Exp1__SUBop(X1,X2) (mmc_mk_box3(5,&Exp1_SUBop__desc,(X1),(X2)))
#define Exp1__MULop(X1,X2) (mmc_mk_box3(6,&Exp1_MULop__desc,(X1),(X2)))
#define Exp1__DIVop(X1,X2) (mmc_mk_box3(7,&Exp1_DIVop__desc,(X1),(X2)))
#define Exp1__NEGop(X1)    (mmc_mk_box2(8,&Exp1_NEGop__desc,(X1)))
#define Exp1__POWop(X1,X2) (mmc_mk_box3(9,&Exp1_POWop__desc,(X1),(X2)))
#define Exp1__FACop(X1)    (mmc_mk_box2(10,&Exp1_FACop__desc,(X1)))

%}

%token T_INTCONST
%token T_LPAREN T_RPAREN
%token T_ADD
%token T_SUB
%token T_MUL
%token T_DIV
%token T_GARBAGE
%token T_ERR

%token T_POW
%token T_FACTORIAL

%%

/* Yacc BNF Syntax of the expression language Exp1 */

program
                 :  expression
                    { absyntree = $1; }

expression       :  term
                 |  expression  T_ADD  term
                    { $$ = Exp1__ADDop($1,$3);}
                 |  expression  T_SUB  term
                    { $$ = Exp1__SUBop($1,$3);}
                 
term             :  u_element
                 |  term  T_MUL  u_element
                    { $$ = Exp1__MULop($1,$3);}
                 |  term  T_DIV  u_element
                    { $$ = Exp1__DIVop($1,$3);}

u_element        :  element
                 |  T_SUB  element
                    { $$ = Exp1__NEGop($2);}
                 |  T_FACTORIAL  element
                    { $$ = Exp1__FACop($2);}
                 |  element T_POW  u_element
                    { $$ = Exp1__POWop($1,$3);}

element          :  T_INTCONST
                 |  T_LPAREN  expression  T_RPAREN
                    { $$ = $2;}
