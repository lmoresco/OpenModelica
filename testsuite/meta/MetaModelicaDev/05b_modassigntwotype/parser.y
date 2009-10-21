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
#include "Absyn.h"
#include "yacclib.h"
#ifndef Absyn__STRING
#define Absyn__STRING(X) yyerror(X)
#endif
#else
#include "meta_modelica.h"
void* getAST()
{
  return absyntree;
}

/* Exp */
const char* Absyn_INT__desc__fields[] = {"integer"};
struct record_description Absyn_INT__desc = {
    "Absyn_INT",
    "Absyn.INT",
    Absyn_INT__desc__fields
};
const char* Absyn_REAL__desc__fields[] = {"real"};
struct record_description Absyn_REAL__desc = {
    "Absyn_REAL",
    "Absyn.REAL",
    Absyn_REAL__desc__fields
};
const char* Absyn_BINARY__desc__fields[] = {"exp1","binOp2","exp3"};
struct record_description Absyn_BINARY__desc = {
    "Absyn_BINARY",
    "Absyn.BINARY",
    Absyn_BINARY__desc__fields
};
const char* Absyn_UNARY__desc__fields[] = {"unOp","exp"};
struct record_description Absyn_UNARY__desc = {
    "Absyn_UNARY",
    "Absyn.UNARY",
    Absyn_UNARY__desc__fields
};
const char* Absyn_ASSIGN__desc__fields[] = {"ident","exp"};
struct record_description Absyn_ASSIGN__desc = {
    "Absyn_ASSIGN",
    "Absyn.ASSIGN",
    Absyn_ASSIGN__desc__fields
};
const char* Absyn_IDENT__desc__fields[] = {"ident"};
struct record_description Absyn_IDENT__desc = {
    "Absyn_IDENT",
    "Absyn.IDENT",
    Absyn_IDENT__desc__fields
};
const char* Absyn_STRING__desc__fields[] = {"string"};
struct record_description Absyn_STRING__desc = {
    "Absyn_STRING",
    "Absyn.STRING",
    Absyn_STRING__desc__fields
};

#define Absyn__INT(X1) (mmc_mk_box2(3,&Absyn_INT__desc,(X1)))
#define Absyn__REAL(X1) (mmc_mk_box2(4,&Absyn_REAL__desc,(X1)))
#define Absyn__BINARY(X1,OP,X2) (mmc_mk_box4(5,&Absyn_BINARY__desc,(X1),(OP),(X2)))
#define Absyn__UNARY(OP,X1) (mmc_mk_box3(6,&Absyn_UNARY__desc,(OP),(X1)))
#define Absyn__ASSIGN(X1,X2) (mmc_mk_box3(7,&Absyn_ASSIGN__desc,(X1),(X2)))
#define Absyn__IDENT(X1) (mmc_mk_box2(8,&Absyn_IDENT__desc,(X1)))
#define Absyn__STRING(X1) (mmc_mk_box2(9,&Absyn_STRING__desc,(X1)))

/* BinOp */
const char* Absyn_ADD__desc__fields[] = {};
struct record_description Absyn_ADD__desc = {
    "Absyn_ADD",
    "Absyn.ADD",
    Absyn_ADD__desc__fields
};
const char* Absyn_SUB__desc__fields[] = {};
struct record_description Absyn_SUB__desc = {
    "Absyn_SUB",
    "Absyn.SUB",
    Absyn_SUB__desc__fields
};
const char* Absyn_MUL__desc__fields[] = {};
struct record_description Absyn_MUL__desc = {
    "Absyn_MUL",
    "Absyn.MUL",
    Absyn_MUL__desc__fields
};
const char* Absyn_DIV__desc__fields[] = {};
struct record_description Absyn_DIV__desc = {
    "Absyn_DIV",
    "Absyn.DIV",
    Absyn_DIV__desc__fields
};

#define Absyn__ADD (mmc_mk_box1(3,&Absyn_ADD__desc))
#define Absyn__SUB (mmc_mk_box1(4,&Absyn_SUB__desc))
#define Absyn__MUL (mmc_mk_box1(5,&Absyn_MUL__desc))
#define Absyn__DIV (mmc_mk_box1(6,&Absyn_DIV__desc))

/* UnOp */
const char* Absyn_NEG__desc__fields[] = {};
struct record_description Absyn_NEG__desc = {
    "Absyn_NEG",
    "Absyn.NEG",
    Absyn_NEG__desc__fields
};

#define Absyn__NEG (mmc_mk_box1(3,&Absyn_NEG__desc))
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

program         :  assignment
                        { absyntree = $1; }
                |  expression
                        { absyntree = $1; }

assignment      :  T_IDENT  T_ASSIGN  expression
                        { $$ = Absyn__ASSIGN($1, $3); }

expression      :  term
                        { $$ = $1;  }
                |  expression  weak_operator  term
                        { $$ = Absyn__BINARY($1, $2, $3);}

term            :  u_element
                        { $$ = $1;}
                |  term  strong_operator  u_element
                        { $$ = Absyn__BINARY($1, $2, $3);}

u_element       :  element
                        { $$ = $1;}
                |  unary_operator  element
                        { $$ = Absyn__UNARY($1, $2);}

element         :  T_INTCONST
                        { $$ = Absyn__INT($1);}
                |  T_REALCONST
                        { $$ = Absyn__REAL($1);}
                |  T_STRINGCONST
                        { $$ = Absyn__STRING($1);}
                |  T_IDENT
                        { $$ = Absyn__IDENT($1);}
                |  T_LPAREN  expression  T_RPAREN
                        { $$ = $2;}
                |  T_LPAREN  assignment  T_RPAREN
                        { $$ = $2;}

weak_operator   :  T_ADD
                        { $$ = Absyn__ADD;}
                |  T_SUB
                        { $$ = Absyn__SUB;}

strong_operator :  T_MUL
                        { $$ = Absyn__MUL;}
                |  T_DIV
                        { $$ = Absyn__DIV;}

unary_operator  :  T_SUB
                        { $$ = Absyn__NEG;}
