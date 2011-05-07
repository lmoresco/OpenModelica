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
type ClassPart = Absyn.ClassPart;
type ClassParts = list<ClassPart>;
type Import  = Absyn.Import;
type ElementItem = Absyn.ElementItem;
type ElementItems = list<Absyn.ElementItem>;
type Element = Absyn.Element;
type ElementSpec = Absyn.ElementSpec;
type ElementAttributes = Absyn.ElementAttributes;
type Comment = Absyn.Comment;
type Direction = Absyn.Direction;
type Exp = Absyn.Exp;
type Subscript = Absyn.Subscript;
type ArrayDim = list<Subscript>;
type Operator = Absyn.Operator;

constant list<String> lstSemValue2 = {};

constant list<String> lstSemValue = {
  "error", "$undefined","T_ALGORITHM", "T_AND", "T_ANNOTATION", "BLOCK", "CLASS", "CONNECT",
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
  "WILD", "SUBTYPEOF", "COLONCOLON", "MOD", "$accept", "program", "within",
  "classes_list", "class", "classdef", "classparts", "classpart",
  "elementItems", "elementItem", "element", "elementspec", "import",
  "path", "Ident", "comment"};

%}

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

%expect 6



%%

/* Yacc BNF grammar of the Modelica+MetaModelica language */

program             :  classes_list 
                                { (absyntree)[Program] = Absyn.PROGRAM($1[lstClass],Absyn.TOP(),Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); }
                       | within classes_list 
                                { (absyntree)[Program] = Absyn.PROGRAM($2[lstClass],$1[Within],Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); }
                               

within              :  WITHIN path SEMICOLON { $$[Within] = Absyn.WITHIN($2[Path]); }

classes_list            : class { $$[lstClass] = $1[Class]::{}; } 
                        | class classes_list { $$[lstClass] = $1[Class]::$2[lstClass]; }

class                      : CLASS ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_CLASS(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }
                           | PARTIAL CLASS ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],true,false,false,Absyn.R_CLASS(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }
                           | FINAL CLASS ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,true,false,Absyn.R_CLASS(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }
                           | ENCAPSULATED CLASS ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,true,Absyn.R_CLASS(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }
                           | MODEL ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_MODEL(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | RECORD ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_RECORD(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | T_PACKAGE ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_PACKAGE(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | FUNCTION ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_FUNCTION(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | TYPE ident classdef SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_TYPE(),$3[ClassDef],info); }      
                           | UNIONTYPE ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_UNIONTYPE(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | BLOCK ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_BLOCK(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | CONNECTOR ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_CONNECTOR(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      
                           | ENUMERATION ident classdef T_END ident SEMICOLON
                                { $$[Class] = Absyn.CLASS($2[Ident],false,false,false,Absyn.R_ENUMERATION(),$3[ClassDef],info); true=($5[Ident] == $2[Ident]); }      


                            
classdef             : path { $$[ClassDef] = Absyn.OVERLOAD({$1[Path]},NONE());}
                      | path comment { $$[ClassDef] = Absyn.OVERLOAD({$1[Path]},SOME($2[Comment])); }
                      | classparts { $$[ClassDef] = Absyn.PARTS({},$1[ClassParts],NONE()); }

classparts           : classpart { $$[ClassParts] = $1[ClassPart]::{}; }
                      | classpart classparts { $$[ClassParts] = $1[ClassPart]::$2[ClassParts]; }

classpart           : elementItems { $$[ClassPart] = Absyn.PUBLIC($1[ElementItems]); }

elementItems           : elementItem { $$[ElementItems] = $1[ElementItem]::{}; }
                      | elementItem elementItems { $$[ElementItems] = $1[ElementItem]::$2[ElementItems]; }

elementItem         : element { $$[ElementItem] = Absyn.ELEMENTITEM($1[Element]); }

element             : elementspec { $$[Element] = Absyn.ELEMENT(true,NONE(),Absyn.INNER(),"",$1[ElementSpec],info,NONE()); }

elementspec         : import { $$[ElementSpec] = Absyn.IMPORT($1[Import],NONE(),info); }
                     | elementattributes { $$[ElementSpec] = Absyn.COMPONENTS($1[ElementAttributes],Absyn.TPATH(Absyn.IDENT(""),NONE()),{}); }

elementattributes   : direction arrayDim {  $$[ElementAttributes] = Absyn.ATTR(false,false,Absyn.VAR(), $1[Direction],$2[ArrayDim]); }
                     | arrayDim {  $$[ElementAttributes] = Absyn.ATTR(false,false,Absyn.VAR(), Absyn.BIDIR(),$1[ArrayDim]); }   
                     | PARAMETER arrayDim {  $$[ElementAttributes] = Absyn.ATTR(false,false,Absyn.PARAM(), Absyn.BIDIR(),$1[ArrayDim]); }   
                     | CONSTANT arrayDim {  $$[ElementAttributes] = Absyn.ATTR(false,false,Absyn.CONST(), Absyn.BIDIR(),$1[ArrayDim]); }   
                     
arrayDim			: exp { $$[ArrayDim] = Absyn.SUBSCRIPT($1[Exp])::{}; }
                     | exp COLON arrayDim { $$[ArrayDim] = Absyn.SUBSCRIPT($1[Exp])::$2[ArrayDim]; }

direction           : T_INPUT { $$[Direction] = Absyn.INPUT(); } 
                     | T_OUTPUT { $$[Direction] = Absyn.OUTPUT(); }                                       

import              : IMPORT path SEMICOLON { $$[Import] = Absyn.QUAL_IMPORT($2[Path]); }

path                 : IDENT { $$[Path] = Absyn.IDENT($1); }
                                
ident                  :  IDENT { $$[Ident] = $1; }

comment                : STRING { $$[Comment] = Absyn.COMMENT(NONE(),SOME($1)); }
                       
exp					: logicexp { $$[Exp] = $1[Exp]; }

logicexp          : logicterm { $$[Exp] = $1[Exp]; }
                   | logicterm T_OR logicterm { $$[Exp] = Absyn.LBINARY($1[Exp],Absyn.OR(),$2[Exp]); }

logicterm          : logfactor { $$[Exp] = $1[Exp]; }
                   | logfactor T_AND logfactor { $$[Exp] = Absyn.LBINARY($1[Exp],Absyn.AND(),$2[Exp]); }

logfactor         : T_NOT relterm { $$[Exp] = Absyn.LUNARY(Absyn.NOT(),$1[Exp]); }  

relterm            : addterm { $$[Exp] = $1[Exp]; }
                   | addterm relOperator addterm { $$[Exp] = Absyn.RELATION($1[Exp],$2[Operator],$3[Exp]); }

addterm             : term { $$[Exp] = $1[Exp]; }
                    | woperator term { $$[Exp] = Absyn.UNARY($1[Operator],$2[Exp]); }
                    | term woperator term { $$[Exp] = Absyn.BINARY($1[Exp],$2[Operator],$3[Exp]); }                                          


term               : factor { $$[Exp] = $1[Exp]; }
					| factor soperator factor { $$[Exp] = Absyn.BINARY($1[Exp],$2[Operator],$3[Exp]); }                                          

factor              : expElement { $$[Exp] = $1[Exp]; }
					| expElement power expElement { $$[Exp] = Absyn.BINARY($1[Exp],$2[Operator],$3[Exp]); }                    

expElement          : constant { $$[Exp] = Absyn.INTEGER($1[Integer]); }
                     | name { $$[Exp] = Absyn.INTEGER($1[Integer]); }
                     | T_FALSE { $$[Exp] = Absyn.BOOL(false); }
                     | T_TRUE { $$[Exp] = Absyn.BOOL(true); }
                     | STRING { $$[Exp] = Absyn.STRING($1); }
                     
name                : ident { $$[Ident] = $1[Ident]; }
                     
woperator			: PLUS { $$[Operator] = Absyn.ADD(); }
                     | MINUS { $$[Operator] = Absyn.SUB(); }
                     |  PLUS_EW { $$[Operator] = Absyn.ADD_EW(); }
                     | MINUS_EW { $$[Operator] = Absyn.SUB_EW(); }
                    

soperator			: STAR { $$[Operator] = Absyn.MUL(); }
                     | SLASH { $$[Operator] = Absyn.DIV(); }
                     | STAR_EW { $$[Operator] = Absyn.MUL_EW(); }
                     | SLASH_EW { $$[Operator] = Absyn.DIV_EW(); }

power              : POWER  { $$[Operator] = Absyn.POW(); } 
                     | POWER_EW { $$[Operator] = Absyn.POW_EW(); }                                         

relOperator			: LESS { $$[Operator] = Absyn.LESS(); }
                     | LESSEQ { $$[Operator] = Absyn.LESSEQ(); }
                     | GREATER { $$[Operator] = Absyn.GREATER(); }
                     | GREATEREQ { $$[Operator] = Absyn.GREATEREQ(); }
                     | EQEQ { $$[Operator] = Absyn.EQUAL(); }
                     | LESSGT { $$[Operator] = Absyn.NEQUAL(); }
                                                           
constant                :  DIGIT { $$[Integer] = $1; }


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
