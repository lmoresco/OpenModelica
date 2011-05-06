%{
import Absyn;

type AstTree = Absyn.Program;
type Token = Types.Token;  
type Program = Absyn.Program;
type Within = Absyn.Within;
type lstClass = list<Absyn.Class>;
type Class = Absyn.Class;
type Ident = Absyn.Ident;
type Path = Absyn.Path;
type ClassDef  = Absyn.ClassDef;

constant list<String> lstSemValue2 = {};

constant list<String> lstSemValue = {
  "error", "$undefined", "T_READ", "T_WRITE", "T_ASSIGN", "T_IF",
  "T_THEN", "T_ENDIF", "T_ELSE", "T_TO", "T_DO", "T_WHILE", "T_LPAREN",
  "T_RPAREN", "T_IDENT", "T_INTCONST", "T_EQ", "T_LE", "T_LT", "T_GT",
  "T_GE", "T_NE", "T_ADD", "T_SUB", "T_MUL", "T_DIV", "T_SEMIC",
  "T_ALGORITHM", "T_AND", "T_ANNOTATION", "BLOCK", "CLASS", "CONNECT",
  "CONNECTOR", "CONSTANT", "DISCRETE", "DER", "DEFINEUNIT", "EACH", "ELSE",
  "ELSEIF", "ELSEWHEN", "T_END", "ENUMERATION", "EQUATION", "ENCAPSULATED",
  "EXPANDABLE", "EXTENDS", "CONSTRAINEDBY", "EXTERNAL", "T_FALSE", "FINAL",
  "FLOW", "FOR", "FUNCTION", "IF", "IMPORT", "T_IN", "INITIAL", "INNER",
  "T_INPUT", "LOOP", "MODEL", "T_NOT", "T_OUTER", "OPERATOR", "OVERLOAD",
  "T_OR", "T_OUTPUT", "T_PACKAGE", "PARAMETER", "PARTIAL", "PROTECTED",
  "PUBLIC", "RECORD", "REDECLARE", "REPLACEABLE", "RESULTS", "THEN",
  "T_TRUE", "TYPE", "UNSIGNED_REAL", "WHEN", "WHILE", "WITHIN", "RETURN",
  "BREAK", "DOT", "LPAR", "RPAR", "LBRACK", "RBRACK", "LBRACE", "RBRACE",
  "EQUALS", "ASSIGN", "COMMA", "COLON", "SEMICOLON", "CODE", "CODE_NAME",
  "CODE_EXP", "CODE_VAR", "PURE", "IMPURE", "IDENT", "DIGIT", "STAR",
  "MINUS", "PLUS", "LESSEQ", "LESSGT", "LESS", "GREATER", "GREATEREQ",
  "EQEQ", "POWER", "SLASH", "STRING", "PLUS_EW", "MINUS_EW", "STAR_EW",
  "SLASH_EW", "POWER_EW", "STREAM", "AS", "CASE", "EQUALITY", "FAILURE",
  "GUARD", "LOCAL", "MATCH", "MATCHCONTINUE", "UNIONTYPE", "ALLWILD",
  "WILD", "SUBTYPEOF", "COLONCOLON", "MOD" };

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

%token AS
%token CASE
%token EQUALITY
%token FAILURE
%token GUARD
%token LOCAL
%token MATCH
%token MATCHCONTINUE
%token UNIONTYPE
%token ALLWILD
%token WILD
%token SUBTYPEOF
%token COLONCOLON
%token MOD

%%

/* Yacc BNF grammar of the PAM language */

program             :  classes_list 
                                { (absyntree)[Program] = Absyn.PROGRAM($1[lstClass],Absyn.TOP(),Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); }
                       | within classes_list 
                                { (absyntree)[Program] = Absyn.PROGRAM($2[lstClass],$1[Within],Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); }
                               

within              :  WITHIN path { $$[Within] = Absyn.WITHIN($2[Path]); }

classes_list            : class { $$[lstClass] = $1[Class]::{}; } 
                        | class classes_list { $$[lstClass] = $1[Class]::$2[lstClass]; }

class                      : CLASS Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_CLASS(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }
                           | MODEL Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_MODEL(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | RECORD Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_RECORD(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | T_PACKAGE Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_PACKAGE(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | FUNCTION Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_FUNCTION(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | TYPE Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_TYPE(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | UNIONTYPE Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_UNIONTYPE(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | BLOCK Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_BLOCK(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | CONNECTOR Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_CONNECTOR(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | ENUMERATION Ident classdef T_END Ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_ENUMERATION(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           
classdef             : path { $$[ClassDef] = Absyn.OVERLOAD({$1[Path]},NONE());}

path                 : IDENT { $$[Path] = Absyn.IDENT($1); }
                                
Ident                  :  IDENT
                                { $$[Ident] = $1; }

constant                :  DIGIT
                                { $$[Integer] = $1; }


%%

function printContentStack
  input AstStack astStk;
   list<Token> skToken;
  list<Path> skPath;
   list<ClassDef> skClassDef;
   list<Ident> skIdent;
   list<Class> skClass;
   list<Program> skProgram;
   list<lstClass> sklstClass;
   list<String> skString;
   list<Integer> skInteger;
algorithm
 ASTSTACK(stackToken=skToken,stackPath=skPath,stackClassDef=skClassDef,stackIdent=skIdent,stackClass=skClass,stackProgram=skProgram,stacklstClass=sklstClass,stackString=skString,stackInteger=skInteger) := astStk;
  
  print("\n Stack content:");
  print(" skToken:");
  print(intString(listLength(skToken)));
  print(" skPath:");
  print(intString(listLength(skPath)));
  print(" skClassDef:");
  print(intString(listLength(skClassDef)));
  print(" skIdent:");
  print(intString(listLength(skIdent)));
  print(" skClass:");
  print(intString(listLength(skClass)));
  print(" skProgram:");
  print(intString(listLength(skProgram)));
  print(" sklstClass:");
  print(intString(listLength(sklstClass)));
  print(" skString:");
  print(intString(listLength(skString)));
  print(" skInteger:");
  print(intString(listLength(skInteger)));
end printContentStack;
