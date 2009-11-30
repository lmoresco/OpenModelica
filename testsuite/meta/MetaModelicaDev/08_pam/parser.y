%{
#include <stdio.h>

#ifdef RML
#include "yacclib.h"
#include "Pam.h"
#else
#include "meta_modelica.h"
void yyerror(char *str);
typedef void *rml_t;
#define YYSTYPE rml_t
rml_t absyntree;

void* parse()
{
  yyparse();
  return absyntree;
}

/* BinOp */
extern struct record_description Pam_ADD__desc;
extern struct record_description Pam_SUB__desc;
extern struct record_description Pam_MUL__desc;
extern struct record_description Pam_DIV__desc;

#define Pam_ADD (mmc_mk_box1(3,&Pam_ADD__desc))
#define Pam_SUB (mmc_mk_box1(4,&Pam_SUB__desc))
#define Pam_MUL (mmc_mk_box1(5,&Pam_MUL__desc))
#define Pam_DIV (mmc_mk_box1(6,&Pam_DIV__desc))

/* RelOp */
extern struct record_description Pam_EQ__desc;
extern struct record_description Pam_GT__desc;
extern struct record_description Pam_LT__desc;
extern struct record_description Pam_LE__desc;
extern struct record_description Pam_GE__desc;
extern struct record_description Pam_NE__desc;

#define Pam_EQ (mmc_mk_box1(3,&Pam_EQ__desc))
#define Pam_GT (mmc_mk_box1(4,&Pam_GT__desc))
#define Pam_LT (mmc_mk_box1(5,&Pam_LT__desc))
#define Pam_LE (mmc_mk_box1(6,&Pam_LE__desc))
#define Pam_GE (mmc_mk_box1(7,&Pam_GE__desc))
#define Pam_NE (mmc_mk_box1(8,&Pam_NE__desc))

/* Exp */
extern struct record_description Pam_INT__desc;
extern struct record_description Pam_IDENT__desc;
extern struct record_description Pam_BINARY__desc;
extern struct record_description Pam_RELATION__desc;

#define Pam_INT(X1)            (mmc_mk_box2(3,&Pam_INT__desc,(X1)))
#define Pam_IDENT(X1)          (mmc_mk_box2(4,&Pam_IDENT__desc,(X1)))
#define Pam_BINARY(X1,X2,X3)   (mmc_mk_box4(5,&Pam_BINARY__desc,(X1),(X2),(X3)))
#define Pam_RELATION(X1,X2,X3) (mmc_mk_box4(6,&Pam_RELATION__desc,(X1),(X2),(X3)))

/* Stmt */
extern struct record_description Pam_ASSIGN__desc;
extern struct record_description Pam_IF__desc;
extern struct record_description Pam_WHILE__desc;
extern struct record_description Pam_TODO__desc;
extern struct record_description Pam_READ__desc;
extern struct record_description Pam_WRITE__desc;
extern struct record_description Pam_SEQ__desc;
extern struct record_description Pam_SKIP__desc;

#define Pam_ASSIGN(X1,X2) (mmc_mk_box3(3,&Pam_ASSIGN__desc,(X1),(X2)))
#define Pam_IF(X1,X2,X3)  (mmc_mk_box4(4,&Pam_IF__desc,(X1),(X2),(X3)))
#define Pam_WHILE(X1,X2)  (mmc_mk_box3(5,&Pam_WHILE__desc,(X1),(X2)))
#define Pam_TODO(X1,X2)   (mmc_mk_box3(6,&Pam_TODO__desc,(X1),(X2)))
#define Pam_READ(X1)      (mmc_mk_box2(7,&Pam_READ__desc,(X1)))
#define Pam_WRITE(X1)     (mmc_mk_box2(8,&Pam_WRITE__desc,(X1)))
#define Pam_SEQ(X1,X2)    (mmc_mk_box3(9,&Pam_SEQ__desc,(X1),(X2)))
#define Pam_SKIP          (mmc_mk_box1(10,&Pam_SKIP__desc))

#endif

%}

%token T_READ
%token T_WRITE
%token T_ASSIGN
%token T_IF
%token T_THEN
%token T_ENDIF
%token T_ELSE
%token T_TO
%token T_DO
%token T_END
%token T_WHILE
%token T_LPAREN
%token T_RPAREN
%token T_IDENT
%token T_INTCONST
%token T_EQ
%token T_LE
%token T_LT
%token T_GT
%token T_GE
%token T_NE
%token T_ADD
%token T_SUB
%token T_MUL
%token T_DIV
%token T_SEMIC
%token T_COMMENT

%%

/* Yacc BNF grammar of the PAM language */

program               :  series
                                { absyntree = $1; }
series                :  statement
                                { $$ = Pam_SEQ($1, Pam_SKIP); }
                      |  statement series
                                { $$ = Pam_SEQ($1, $2); }

statement             :  input_statement T_SEMIC
                                { $$ = $1; }
                      |  output_statement T_SEMIC
                                { $$ = $1; }
                      |  assignment_statement T_SEMIC
                                { $$ = $1; }
                      |  conditional_statement
                                { $$ = $1; }
                      |  definite_loop
                                { $$ = $1; }
                      |  while_loop
                                { $$ = $1; }

input_statement       :  T_READ  variable_list
                                { $$ = Pam_READ($2); }

output_statement      :  T_WRITE  variable_list
                                { $$ = Pam_WRITE($2); }

variable_list         :  variable
                                { $$ = mmc_mk_cons($1, mmc_mk_nil()); }
                      |  variable variable_list
                                { $$ = mmc_mk_cons($1, $2); }

assignment_statement  :  variable  T_ASSIGN  expression
                                { $$ = Pam_ASSIGN($1, $3); }

conditional_statement :  T_IF comparison T_THEN series T_ENDIF
                                { $$ = Pam_IF($2, $4, Pam_SKIP); }
                      |  T_IF comparison T_THEN series 
                                         T_ELSE series T_ENDIF
                                { $$ = Pam_IF($2, $4, $6); }

definite_loop         :  T_TO expression T_DO series T_END
                                { $$ = Pam_TODO($2, $4); }

while_loop            :  T_WHILE comparison T_DO series T_END
                                { $$ = Pam_WHILE($2, $4); }

expression       :  term
                                { $$ = $1; }
                 |  expression  weak_operator  term
                                { $$ = Pam_BINARY($1, $2, $3); }

term             :  element
                                { $$ = $1; }
                 |  term  strong_operator  element
                                { $$ = Pam_BINARY($1, $2, $3); }

element          :  constant
                                { $$ = $1; }
                 |  variable
                                { $$ = Pam_IDENT($1); }
                 |  T_LPAREN  expression  T_RPAREN
                                { $$ = $2; }

comparison       :  expression  relation  expression
                                { $$ = Pam_RELATION($1, $2, $3); }

variable         :  T_IDENT
                                { $$ = $1; }
constant         :  T_INTCONST
                                { $$ = $1; }

relation         : T_EQ { $$ = Pam_EQ;}
                 | T_LE { $$ = Pam_LE;}
                 | T_LT { $$ = Pam_LT;}
                 | T_GT { $$ = Pam_GT;}
                 | T_GE { $$ = Pam_GE;}
                 | T_NE { $$ = Pam_NE;}

weak_operator    : T_ADD { $$ = Pam_ADD;}
                 | T_SUB { $$ = Pam_SUB;}

strong_operator  : T_MUL { $$ = Pam_MUL;}
                 | T_DIV { $$ = Pam_DIV;}

%%

void yyerror(char *str) {
        extern int linenr;
        printf("%s on line %d!\n", str, linenr);
}

