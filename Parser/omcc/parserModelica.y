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
type Case = Absyn.Case;
type Cases = list<Case>;
type MatchType = Absyn.MatchType;
type Restriction = Absyn.Restriction;
type InnerOuter = Absyn.InnerOuter;
type ComponentRef = Absyn.ComponentRef;

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

%expect 45



%%

/* Yacc BNF grammar of the Modelica+MetaModelica language */

program             :  classes_list 
                                { (absyntree)[Program] = Absyn.PROGRAM($1[lstClass],Absyn.TOP(),Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); }
                       | within classes_list 
                                { (absyntree)[Program] = Absyn.PROGRAM($2[lstClass],$1[Within],Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); }
                               

within              :  WITHIN path SEMICOLON { $$[Within] = Absyn.WITHIN($2[Path]); }

classes_list            : class { $$[lstClass] = $1[Class]::{}; } 
                        | class classes_list { $$[lstClass] = $1[Class]::$2[lstClass]; }

class                      : restriction IDENT classdef T_END IDENT SEMICOLON
                                { $$[Class] = Absyn.CLASS($2,false,false,false,$1[Restriction],$3[ClassDef],info); }
                           | PARTIAL restriction IDENT classdef T_END IDENT SEMICOLON
                                { $$[Class] = Absyn.CLASS($2,true,false,false,$1[Restriction],$3[ClassDef],info); }
                           | FINAL restriction IDENT classdef T_END IDENT SEMICOLON
                                { $$[Class] = Absyn.CLASS($2,false,true,false,$1[Restriction],$3[ClassDef],info); }
                           | ENCAPSULATED restriction IDENT classdef T_END IDENT SEMICOLON
                                { $$[Class] = Absyn.CLASS($2,false,false,true,$1[Restriction],$3[ClassDef],info); }
                           
restriction             : CLASS { $$[Restriction] = Absyn.R_CLASS(); }
						| MODEL { $$[Restriction] = Absyn.R_MODEL(); }
						| RECORD { $$[Restriction] = Absyn.R_RECORD(); }
						| T_PACKAGE { $$[Restriction] = Absyn.R_PACKAGE(); }
						| TYPE { $$[Restriction] = Absyn.R_TYPE(); }
						| FUNCTION { $$[Restriction] = Absyn.R_FUNCTION(); }
						| UNIONTYPE { $$[Restriction] = Absyn.R_UNIONTYPE(); }
						| BLOCK { $$[Restriction] = Absyn.R_BLOCK(); }
						| CONNECTOR { $$[Restriction] = Absyn.R_CONNECTOR(); }
						| EXPANDABLE CONNECTOR { $$[Restriction] = Absyn.R_EXP_CONNECTOR(); }
						| ENUMERATION { $$[Restriction] = Absyn.R_ENUMERATION(); }
						| OPERATOR { $$[Restriction] = Absyn.R_OPERATOR(); }
						| OPERATOR FUNCTION { $$[Restriction] = Absyn.R_OPERATOR_FUNCTION(); }
						| OPERATOR RECORD { $$[Restriction] = Absyn.R_OPERATOR_RECORD(); }

//class_specifier		: IDENT comment composition T_END IDENT SEMICOLON { $$ = 1$; }
                            
classdef             : classparts { $$[ClassDef] = Absyn.PARTS({},$1[ClassParts],NONE()); }
                     | STRING classparts { $$[ClassDef] = Absyn.PARTS({},$2[ClassParts],SOME($1)); }

classparts           : classpart { $$[ClassParts] = $1[ClassPart]::{}; }
                      | classpart classparts { $$[ClassParts] = $1[ClassPart]::$2[ClassParts]; }

classpart           : elementItems { $$[ClassPart] = Absyn.PUBLIC($1[ElementItems]); }
                     | restClass { $$[ClassPart] = $1[ClassPart]; }
                     
restClass              : PUBLIC elementItems { $$[ClassPart] = Absyn.PUBLIC($1[ElementItems]); }
                        | PROTECTED elementItems { $$[ClassPart] = Absyn.PROTECTED($1[ElementItems]); } 
                       /* | EQUATION elementItems { $$[ClassPart] = Absyn.EQUATIONS($1[ElementItems]); }  
                        | T_ALGORITHM elementItems { $$[ClassPart] = Absyn.ALGORITHMS($1[ElementItems]); } 
                        | EXTERNAL externalDecl annotation    */

elementItems           : elementItem { $$[ElementItems] = $1[ElementItem]::{}; }
                      | elementItem elementItems { $$[ElementItems] = $1[ElementItem]::$2[ElementItems]; }

elementItem         : element { $$[ElementItem] = Absyn.ELEMENTITEM($1[Element]); }

element             : innerouter elementspec { $$[Element] = Absyn.ELEMENT(true,NONE(),$1[InnerOuter],"",$2[ElementSpec],info,NONE()); }
                    | elementspec { $$[Element] = Absyn.ELEMENT(true,NONE(),Absyn.NOT_INNER_OUTER(),"",$1[ElementSpec],info,NONE()); }
                  

innerouter			: INNER { $$[InnerOuter] = Absyn.INNER(); }
                     | T_OUTER { $$[InnerOuter] = Absyn.OUTER(); }
                     | INNER T_OUTER { $$[InnerOuter] = Absyn.INNER_OUTER(); }
                     

elementspec         : import { $$[ElementSpec] = Absyn.IMPORT($1[Import],NONE(),info); }
                     | elementattributes SEMICOLON { $$[ElementSpec] = Absyn.COMPONENTS($1[ElementAttributes],Absyn.TPATH(Absyn.IDENT(""),NONE()),{}); }
                     | REPLACEABLE class { $$[ElementSpec] = Absyn.CLASSDEF(true,$2[Class]); }
                     | class { $$[ElementSpec] = Absyn.CLASSDEF(false,$1[Class]); }

elementattributes   : direction arrayDim {  $$[ElementAttributes] = Absyn.ATTR(false,false,Absyn.VAR(), $1[Direction],$2[ArrayDim]); }
                     | arrayDim   { $$[ElementAttributes] = Absyn.ATTR(false,false,Absyn.VAR(), Absyn.BIDIR(),$1[ArrayDim]); }   
                     | PARAMETER arrayDim  {  $$[ElementAttributes] = Absyn.ATTR(false,false,Absyn.PARAM(), Absyn.BIDIR(),$1[ArrayDim]); }   
                     | CONSTANT arrayDim  {  $$[ElementAttributes] = Absyn.ATTR(false,false,Absyn.CONST(), Absyn.BIDIR(),$1[ArrayDim]); }   

                     
arrayDim			: exp { $$[ArrayDim] = Absyn.SUBSCRIPT($1[Exp])::{}; }
                     | exp COLON arrayDim { $$[ArrayDim] = Absyn.SUBSCRIPT($1[Exp])::$2[ArrayDim]; }

direction           : T_INPUT { $$[Direction] = Absyn.INPUT(); } 
                     | T_OUTPUT { $$[Direction] = Absyn.OUTPUT(); }                                       

import              : IMPORT path SEMICOLON { $$[Import] = Absyn.QUAL_IMPORT($2[Path]); }

path                 : IDENT { $$[Path] = Absyn.IDENT($1); }
                                
ident                  :  IDENT { $$[Ident] = $1; }
                       | ident dotident { $$[Ident] = $1 + $2; }

dotident               : DOT IDENT { $$[Ident] = $1; }

//componentreference    : WILD { $$[ComponentRef] = Absyn.WILD();}    
//                        | ALLWILD { $$[ComponentRef] = Absyn.ALLWILD();}                       

//comment                : STRING { $$[Comment] = Absyn.COMMENT(NONE(),SOME($1)); }
                     
exp					: logicexp { $$[Exp] = $1[Exp]; }
                     | IF exp THEN exp ELSE exp T_END IF SEMICOLON { $$[Exp] = Absyn.IFEXP($2[Exp],$4[Exp],$6[Exp],{}); }
                     | matchtype exp  elementItems cases { $$[Exp] = Absyn.MATCHEXP($1[MatchType],$2[Exp],$3[ElementItems],$4[Cases],NONE()); }
                     // | IF exp THEN exp ELSEIF exp THEN exp ELSE exp { $$[Exp] = Absyn.IFEXP($2[Exp],$4[Exp],$6[Exp],{}); }

matchtype         : MATCH { $$[MatchType] = Absyn.MATCH(); }
                   | MATCHCONTINUE { $$[MatchType] = Absyn.MATCHCONTINUE(); }

cases             : case { $$[Cases] = $1[Case]::{}; }
                  | case cases { $$[Cases] = $1[Case]::$2[Cases]; }  
                                    
case              : CASE exp THEN exp { $$[Case] = Absyn.CASE($1[Exp],info,{},{},$4[Exp],info,NONE(),info); }
				   
logicexp          : logicterm { $$[Exp] = $1[Exp]; }
                   | logicterm T_OR logicterm { $$[Exp] = Absyn.LBINARY($1[Exp],Absyn.OR(),$2[Exp]); }

logicterm          : logfactor { $$[Exp] = $1[Exp]; }
                   | logfactor T_AND logfactor { $$[Exp] = Absyn.LBINARY($1[Exp],Absyn.AND(),$2[Exp]); }

logfactor         : relterm  { $$[Exp] = $1[Exp]; }
                   | T_NOT relterm { $$[Exp] = Absyn.LUNARY(Absyn.NOT(),$1[Exp]); }  

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
                     | name { $$[Exp] = Absyn.CREF(Absyn.CREF_IDENT($1[Ident],{})); }
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
