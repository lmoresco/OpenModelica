%{
#include <stdio.h>
#include "yacclib.h"
#include "Absyn.h"
 
typedef void *rml_t;
#define YYSTYPE rml_t
extern rml_t absyntree;
 
%}
 
%token T_PROGRAM
%token T_BODY
%token T_END
%token T_IF
%token T_THEN
%token T_ELSE
%token T_WHILE
%token T_DO
 
%token T_WRITE
%token T_ASSIGN
%token T_SEMICOLON
%token T_COLON
 
%token T_CONST_INT
%token T_CONST_REAL
%token T_CONST_BOOL
%token T_IDENT
 
%token T_LPAREN T_RPAREN
 
%nonassoc T_LT T_LE T_GT T_GE T_NE T_EQ
%left T_PLUS  T_MINUS
%left T_TIMES T_DIVIDE
%left T_UMINUS
 
%token T_GARBAGE
 
%%
 
program
        : T_PROGRAM decl_list T_BODY stmt_list T_END T_PROGRAM
        { absyntree = Absyn__PROG($2,$4); }
 
decl_list
        : 
            { $$ = mk_nil();}
        | decl decl_list
            { $$ = mk_cons($1,$2); }
 
decl
        : T_IDENT T_COLON T_IDENT T_SEMICOLON
        { $$ = Absyn__NAMEDECL($1,$3);}
 
stmt_list
        : 
            { $$ = mk_nil();}
        | stmt stmt_list
            { $$ = mk_cons($1,$2); }
 
stmt
        : simple_stmt T_SEMICOLON
        | combined_stmt
 
simple_stmt
        : assign_stmt
        | write_stmt
        | noop_stmt
 
combined_stmt
        : if_stmt
        | while_stmt
 
assign_stmt
: T_IDENT T_ASSIGN expr
            { $$ = Absyn__ASSIGN($1,$3);}
 
write_stmt
        : T_WRITE expr
            { $$ = Absyn__WRITE($2);}
 
noop_stmt
        :
            { $$ = Absyn__NOOP;}
 
if_stmt
        : T_IF expr T_THEN stmt_list T_ELSE stmt_list T_END T_IF
            { $$ = Absyn__IF($2,$4,$6); }
        | T_IF expr T_THEN stmt_list T_END T_IF
            { $$ = Absyn__IF($2,$4,mk_cons(Absyn__NOOP,mk_nil())); }
 
while_stmt
        : T_WHILE expr T_DO stmt_list T_END T_WHILE
            { $$ = Absyn__WHILE($2,$4); }
 
expr
        : T_CONST_INT
        | T_CONST_REAL
        | T_CONST_BOOL
        | T_LPAREN expr T_RPAREN
            { $$ = $2;}
        | T_IDENT
            { $$ = Absyn__VARIABLE($1);}
        | expr_bin
        | expr_un
        | expr_rel
 
expr_bin
        : expr T_PLUS expr
            { $$ = Absyn__BINARY($1, Absyn__ADD,$3);}
        | expr T_MINUS expr
            { $$ = Absyn__BINARY($1, Absyn__SUB,$3);}
        | expr T_TIMES expr
            { $$ = Absyn__BINARY($1, Absyn__MUL,$3);}
        | expr T_DIVIDE expr
            { $$ = Absyn__BINARY($1, Absyn__DIV,$3);}
        
expr_un
        : T_MINUS expr %prec T_UMINUS
            { $$ = Absyn__UNARY(Absyn__ADD,$2);}
 
expr_rel
        : expr T_LT expr
            { $$ = Absyn__RELATION($1,Absyn__LT,$3);}
        | expr T_LE expr
            { $$ = Absyn__RELATION($1,Absyn__LE,$3);}
        | expr T_GT expr
            { $$ = Absyn__RELATION($1,Absyn__GT,$3);}
        | expr T_GE expr
            { $$ = Absyn__RELATION($1,Absyn__GE,$3);}
        | expr T_NE expr
            { $$ = Absyn__RELATION($1,Absyn__NE,$3);}
        | expr T_EQ expr
            { $$ = Absyn__RELATION($1,Absyn__EQ,$3);}
 
%%
