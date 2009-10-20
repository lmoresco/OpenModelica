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
#include "yacclib.h"
#include "Assignment.h"
#else
#include "meta_modelica.h"
void* getAST()
{
  return absyntree;
}


/* Program */
const char* Assignment_PROGRAM__desc__fields[] = {"expLst","exp"};
struct record_description Assignment_PROGRAM__desc = {
    "Assignment_PROGRAM",
    "Assignment.PROGRAM",
    Assignment_PROGRAM__desc__fields
};

#define Assignment__PROGRAM(X1,X2) (mmc_mk_box3(3,&Assignment_PROGRAM__desc,(X1),(X2)))

/* Exp */
const char* Assignment_BINARY__desc__fields[] = {"Assignment","binOp2","exp3"};
struct record_description Assignment_BINARY__desc = {
    "Assignment_BINARY",
    "Assignment.BINARY",
    Assignment_BINARY__desc__fields
};
const char* Assignment_UNARY__desc__fields[] = {"unOp","exp"};
struct record_description Assignment_UNARY__desc = {
    "Assignment_UNARY",
    "Assignment.UNARY",
    Assignment_UNARY__desc__fields
};
const char* Assignment_ASSIGN__desc__fields[] = {"ident","exp"};
struct record_description Assignment_ASSIGN__desc = {
    "Assignment_ASSIGN",
    "Assignment.ASSIGN",
    Assignment_ASSIGN__desc__fields
};
const char* Assignment_IDENT__desc__fields[] = {"ident"};
struct record_description Assignment_IDENT__desc = {
    "Assignment_IDENT",
    "Assignment.IDENT",
    Assignment_IDENT__desc__fields
};

#define Assignment__BINARY(X1,OP,X2) (mmc_mk_box4(4,&Assignment_BINARY__desc,(X1),(OP),(X2)))
#define Assignment__UNARY(OP,X1) (mmc_mk_box3(5,&Assignment_UNARY__desc,(OP),(X1)))
#define Assignment__ASSIGN(X1,X2) (mmc_mk_box3(6,&Assignment_ASSIGN__desc,(X1),(X2)))
#define Assignment__IDENT(X1) (mmc_mk_box2(7,&Assignment_IDENT__desc,(X1)))

/* BinOp */
const char* Assignment_ADD__desc__fields[] = {};
struct record_description Assignment_ADD__desc = {
    "Assignment_ADD",
    "Assignment.ADD",
    Assignment_ADD__desc__fields
};
const char* Assignment_SUB__desc__fields[] = {};
struct record_description Assignment_SUB__desc = {
    "Assignment_SUB",
    "Assignment.SUB",
    Assignment_SUB__desc__fields
};
const char* Assignment_MUL__desc__fields[] = {};
struct record_description Assignment_MUL__desc = {
    "Assignment_MUL",
    "Assignment.MUL",
    Assignment_MUL__desc__fields
};
const char* Assignment_DIV__desc__fields[] = {};
struct record_description Assignment_DIV__desc = {
    "Assignment_DIV",
    "Assignment.DIV",
    Assignment_DIV__desc__fields
};

#define Assignment__ADD (mmc_mk_box1(3,&Assignment_ADD__desc))
#define Assignment__SUB (mmc_mk_box1(4,&Assignment_SUB__desc))
#define Assignment__MUL (mmc_mk_box1(5,&Assignment_MUL__desc))
#define Assignment__DIV (mmc_mk_box1(6,&Assignment_DIV__desc))

/* UnOp */
const char* Assignment_NEG__desc__fields[] = {};
struct record_description Assignment_NEG__desc = {
    "Assignment_NEG",
    "Assignment.NEG",
    Assignment_NEG__desc__fields
};

#define Assignment__NEG (mmc_mk_box1(3,&Assignment_NEG__desc))
#endif

%}

%token T_SEMIC
%token T_ASSIGN
%token T_IDENT
%token T_INTCONST
%token T_LPAREN T_RPAREN
%token T_ADD
%token T_SUB
%token T_MUL
%token T_DIV
%token T_GARBAGE

%token T_ERR

%%

/* Yacc BNF grammar of the expression language Assignments */

program         :  assignments T_SEMIC expression
                        { absyntree = Assignment__PROGRAM($1, $3);}

assignments     :  assignments  assignment
                        { $$ = mmc_mk_cons($2, $1);}
                |
                        { $$ = mmc_mk_nil();}

assignment      :  T_IDENT  T_ASSIGN  expression
                        { $$ = Assignment__ASSIGN($1, $3);}

expression      :  term
                        { $$ = $1;}
                |  expression  weak_operator  term
                        { $$ = Assignment__BINARY($1, $2, $3);}

term            :  u_element
                        { $$ = $1;}
                |  term  strong_operator  u_element
                        { $$ = Assignment__BINARY($1, $2, $3);}

u_element       :  element
                        { $$ = $1;}
                |  unary_operator  element
                        { $$ = Assignment__UNARY($1, $2);}

element         :  T_INTCONST
                        { $$ = $1;}
                |  T_IDENT
                        { $$ = Assignment__IDENT($1);}
                |  T_LPAREN  expression  T_RPAREN
                        { $$ = $2;}
                |  T_LPAREN  assignment  T_RPAREN
                        { $$ = $2;}

weak_operator   :  T_ADD
                        { $$ = Assignment__ADD;}
                |  T_SUB
                        { $$ = Assignment__SUB;}

strong_operator :  T_MUL
                        { $$ = Assignment__MUL;}
                |  T_DIV
                        { $$ = Assignment__DIV;}

unary_operator  :  T_SUB
                        { $$ = Assignment__NEG;}


