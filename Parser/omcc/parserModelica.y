%{
type AstTree = Absyn.Stmt;
type Stmt = Absyn.Stmt;
type IdentLst = Absyn.IdentLst;
type Ident = Absyn.Ident;
type Exp = Absyn.Exp;
type BinOp = Absyn.BinOp;
type RelOp = Absyn.RelOp;

constant list<String> lstSemValue2 = {};

constant list<String> lstSemValue = {
  "error","undetermined","read",   "write", ":=", 
  "if",  "then",         "endif",  "else",  "to", 
  "do",  "end",          "while",  "(",      ")", 
  "Identity", "Integer", "=",      "<=",     "<",
  ">",    ">=",          "<>",     "+",      "-", 
  "*",     "/",          ";",      "" };

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
%token T_ALGORITHM 
%token T_AND 
%token T_ANNOTATION 
%token BLOCK 
%token CLASS 
%token CONNECT 
%token CONNECTOR 
%token CONSTANT 
%token DISCRETE 
%token DER 
%token DEFINEUNIT 
%token EACH 
%token ELSE 
%token ELSEIF 
%token ELSEWHEN 
%token T_END 
%token ENUMERATION 
%token EQUATION 
%token ENCAPSULATED 
%token EXPANDABLE 
%token EXTENDS 
%token CONSTRAINEDBY 
%token EXTERNAL 
%token T_FALSE 
%token FINAL 
%token FLOW 
%token FOR 
%token FUNCTION 
%token IF 
%token IMPORT 
%token T_IN 
%token INITIAL 
%token INNER 
%token T_INPUT 
%token LOOP 
%token MODEL 
%token T_NOT 
%token T_OUTER 
%token OPERATOR 
%token OVERLOAD 
%token T_OR 
%token T_OUTPUT 
%token T_PACKAGE 
%token PARAMETER 
%token PARTIAL 
%token PROTECTED 
%token PUBLIC 
%token RECORD 
%token REDECLARE 
%token REPLACEABLE 
%token RESULTS 
%token THEN 
%token T_TRUE 
%token TYPE 
%token UNSIGNED_REAL 
%token WHEN 
%token WHILE 
%token WITHIN 
%token RETURN 
%token BREAK  
%token DOT 
%token LPAR 
%token RPAR 
%token LBRACK 
%token RBRACK 
%token LBRACE 
%token RBRACE 
%token EQUALS 
%token ASSIGN 
%token COMMA 
%token COLON 
%token SEMICOLON 
%token CODE 
%token CODE_NAME 
%token CODE_EXP 
%token CODE_VAR 
%token PURE 
%token IMPURE
%token IDENT
%token DIGIT 

%token  STAR
%token  MINUS
%token  PLUS
%token  LESSEQ
%token  LESSGT
%token  LESS
%token  GREATER
%token  GREATEREQ
%token  EQEQ
%token  POWER
%token SLASH

%token STRING

%token PLUS_EW
%token MINUS_EW 
%token STAR_EW
%token SLASH_EW 
%token POWER_EW

%token STREAM

%%

/* Yacc BNF grammar of the PAM language */

program/*Stmt*/             :  series
                                { (absyntree)[Stmt] = $1[Stmt]; }
series/*Stmt*/                :  statement 
                              { $$[Stmt] = Absyn.SEQ($1[Stmt], Absyn.SKIP()); } 
                      |  statement series
                                { $$[Stmt] = Absyn.SEQ($1[Stmt], $2[Stmt]); }

statement/*Stmt*/             :  input_statement T_SEMIC
                                { $$[Stmt] = $1[Stmt]; }
                      |  output_statement T_SEMIC
                                { $$[Stmt] = $1[Stmt]; }
                      |  assignment_statement T_SEMIC
                                { $$[Stmt] = $1[Stmt]; }
                      |  conditional_statement
                                { $$[Stmt] = $1[Stmt]; }
                      |  definite_loop
                                { $$[Stmt] = $1[Stmt]; }
                      |  while_loop
                                { $$[Stmt] = $1[Stmt]; }

input_statement/*Stmt*/ :  T_READ  variable_list
                                { $$[Stmt] = Absyn.READ($2[IdentLst]); }

output_statement/*Stmt*/  :  T_WRITE  variable_list
                                { $$[Stmt] = Absyn.WRITE($2[IdentLst]); }

variable_list/*IdentLst*/     :  variable
                                { $$[IdentLst] = $1[Ident]::{}; }
                      |  variable variable_list
                                { $$[IdentLst] = $1[Ident]::$2[IdentLst]; }

assignment_statement/*Stmt*/  :  variable  T_ASSIGN  expression
                                { $$[Stmt] = Absyn.ASSIGN($1[Ident], $3[Exp]); }

conditional_statement/*Stmt*/ :  T_IF comparison T_THEN series T_ENDIF
                                { $$[Stmt] = Absyn.IF($2[Exp], $4[Stmt], Absyn.SKIP()); }
                      |  T_IF comparison T_THEN series 
                                         T_ELSE series T_ENDIF
                                { $$[Stmt] = Absyn.IF($2[Exp], $4[Stmt], $6[Stmt]); }

definite_loop/*Stmt*/         :  T_TO expression T_DO series T_END
                                { $$[Stmt] = Absyn.TODO($2[Exp], $4[Stmt]); }

while_loop/*Stmt*/            :  T_WHILE comparison T_DO series T_END
                                { $$[Stmt] = Absyn.WHILE($2[Exp], $4[Stmt]); }

expression/*Exp*/       :  term
                                { $$[Exp] = $1[Exp]; }
                 |  expression  weak_operator  term
                                { $$[Exp] = Absyn.BINARY($1[Exp], $2[BinOp], $3[Exp]); }

term/*Exp*/             :  element
                                { $$[Exp] = $1[Exp]; }
                 |  term  strong_operator  element
                                { $$[Exp] = Absyn.BINARY($1[Exp], $2[BinOp], $3[Exp]); }

element/*Exp*/          :  constant
                                { $$[Exp] = Absyn.INT($1[Integer]); }
                 |  variable
                                { $$[Exp] = Absyn.IDENT($1[Ident]); }
                 |  T_LPAREN  expression  T_RPAREN
                                { $$[Exp] = $2[Exp]; }

comparison/*Exp*/       :  expression  relation  expression
                                { $$[Exp] = Absyn.RELATION($1[Exp], $2[RelOp], $3[Exp]); }

variable/*String*/         :  T_IDENT
                                { $$[Ident] = $1; }
constant/*Integer*/         :  T_INTCONST
                                { $$[Integer] = $1; }

relation/*RelOp*/         : T_EQ { $$[RelOp] = Absyn.EQ();}
                 | T_LE { $$[RelOp] = Absyn.LE();}
                 | T_LT { $$[RelOp] = Absyn.LT();}
                 | T_GT { $$[RelOp] = Absyn.GT();}
                 | T_GE { $$[RelOp] = Absyn.GE();}
                 | T_NE { $$[RelOp] = Absyn.NE();}

weak_operator/*BinOp*/    : T_ADD { $$[BinOp] = Absyn.ADD();}
                 | T_SUB { $$[BinOp] = Absyn.SUB();}

strong_operator/*BinOp*/  : T_MUL { $$[BinOp] = Absyn.MUL();}
                 | T_DIV { $$[BinOp] = Absyn.DIV();}

%%

function printAST "print the AST built by the parsing"
  input AstStack astStk "MultiTypedStack used by the parser";
  output AstTree ast "returns the AST in the final type of the tree";
  list<Absyn.Stmt> retStk;
  algorithm
    ASTSTACK(stackStmt=retStk) := astStk;
    printAny(ast);
    ast::_ := retStk;
end printAST;

function getSemValue "retrieves semval from tokens"
  input Integer tokenId;
  output String tokenSemValue "returns semantic value of the token";
  array<String> values;
  algorithm
    values := listArray(lstSemValue);
   tokenSemValue := values[tokenId];
end getSemValue;
