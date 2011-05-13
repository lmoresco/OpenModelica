%{
import Absyn;
/* Type Declarations */
type AstTree = Absyn.Program;
type Token = OMCCTypes.Token;  
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
type Exps = list<Exp>;
type Subscript = Absyn.Subscript;
type ArrayDim = list<Subscript>;
type Operator = Absyn.Operator;
type Case = Absyn.Case;
type Cases = list<Case>;
type MatchType = Absyn.MatchType;
type Restriction = Absyn.Restriction;
type InnerOuter = Absyn.InnerOuter;
type ComponentRef = Absyn.ComponentRef;
type Variability = Absyn.Variability;
type RedeclareKeywords = Absyn.RedeclareKeywords;
type NamedArg=Absyn.NamedArg;
type TypeSpec=Absyn.TypeSpec;
type TypeSpecs=list<TypeSpec>;
type ComponentItem=Absyn.ComponentItem;
type ComponentItems=list<ComponentItem>;
type Component=Absyn.Component;
type EquationItem = Absyn.EquationItem;
type EquationItems = list<EquationItem>;
type Equation = Absyn.Equation;
type Elseif = tuple<Exp, list<EquationItem>>;
type Elseifs = list<Elseif>;
type ForIterator= Absyn.ForIterator;
type ForIterators = list<ForIterator>; 
type Elsewhen = tuple<Exp, list<EquationItem>>;
type Elsewhens = list<Elsewhen>;
type FunctionArgs = Absyn.FunctionArgs;
type NamedArgs = list<NamedArg>;
type AlgorithmItem = Absyn.AlgorithmItem;
type AlgorithmItems = list<AlgorithmItem>;
type Algorithm = Absyn.Algorithm;
type AlgElseif = tuple<Exp, list<AlgorithmItem>>;
type AlgElseifs = list<AlgElseif>;
type AlgElsewhen = tuple<Exp, list<AlgorithmItem>>;
type AlgElsewhens = list<AlgElsewhen>;
type ExpElseif = tuple<Exp, Exp>;
type ExpElseifs = list<ExpElseif>;
type EnumDef = Absyn.EnumDef;
type EnumLiteral = Absyn.EnumLiteral;
type EnumLiterals = list<EnumLiteral>;
type Modification = Absyn.Modification;
type Boolean3 = tuple<Boolean,Boolean,Boolean>;
type Boolean2 = tuple<Boolean,Boolean>;

constant list<String> lstSemValue3 = {};

constant list<String> lstSemValue = {
   "error", "$undefined", "ALGORITHM", "AND", "ANNOTATION",
  "BLOCK", "CLASS", "CONNECT", "CONNECTOR", "CONSTANT", "DISCRETE", "DER",
  "DEFINEUNIT", "EACH", "ELSE", "ELSEIF", "ELSEWHEN", "END",
  "ENUMERATION", "EQUATION", "ENCAPSULATED", "EXPANDABLE", "EXTENDS",
  "CONSTRAINEDBY", "EXTERNAL", "FALSE", "FINAL", "FLOW", "FOR",
  "FUNCTION", "IF", "IMPORT", "IN", "INITIAL", "INNER", "INPUT",
  "LOOP", "MODEL", "NOT", "OUTER", "OPERATOR", "OVERLOAD", "OR",
  "OUTPUT", "PACKAGE", "PARAMETER", "PARTIAL", "PROTECTED", "PUBLIC",
  "RECORD", "REDECLARE", "REPLACEABLE", "RESULTS", "THEN", "TRUE",
  "TYPE", "REAL", "WHEN", "WHILE", "WITHIN", "RETURN", "BREAK",
  ".", "(", ")", "[", "]", "{", "}", "=",
  "ASSIGN", "COMMA", "COLON", "SEMICOLON", "CODE", "CODE_NAME", "CODE_EXP",
  "CODE_VAR", "PURE", "IMPURE", "Identity", "DIGIT", "INTEGER",
  "*", "-", "+", "<=", "<>", "<", ">",
  ">=", "==", "^", "SLASH", "STRING", ".+", ".-",
  ".*", "./", ".*", "STREAM", "AS", "CASE", "EQUALITY",
  "FAILURE", "GUARD", "LOCAL", "MATCH", "MATCHCONTINUE", "UNIONTYPE",
  "ALLWILD", "WILD", "SUBTYPEOF", "COLONCOLON", "MOD", "$accept",
  "program", "within", "classes_list", "class", "classprefix",
  "encapsulated", "partial", "restriction", "classdef",
  "classdefenumeration", "classdefderived", "enumeration", "enumlist",
  "enumliteral", "classparts", "classpart", "restClass",
  "algorithmsection", "algorithmitem", "algorithm", "if_algorithm",
  "algelseifs", "algelseif", "when_algorithm", "algelsewhens",
  "algelsewhen", "equationsection", "equationitem", "equation",
  "when_equation", "elsewhens", "elsewhen", "foriterators", "foriterator",
  "if_equation", "elseifs", "elseif", "elementItems", "elementItem",
  "element", "componentclause", "componentitems", "componentitem",
  "component", "modification", "redeclarekeywords", "innerouter",
  "importelementspec", "classelementspec", "import", "elementspec",
  "elementAttr", "variability", "direction", "typespec", "arrayComplex",
  "typespecs", "arraySubscripts", "arrayDim", "functioncall",
  "functionargs", "namedargs", "namedarg", "exp", "matchcont", "if_exp",
  "expelseifs", "expelseif", "matchlocal", "cases", "case", "casearg",
  "simpleExp", "headtail", "rangeExp", "logicexp", "logicterm",
  "logfactor", "relterm", "addterm", "term", "factor", "expElement",
  "tuple", "explist", "explist2", "cref", "woperator", "soperator",
  "power", "relOperator", "path", "ident", "string", "comment"};

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
%token UNSIGNED_INTEGER

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

//%expect 35



%%

/* Yacc BNF grammar of the Modelica+MetaModelica language */

program             :  classes_list 
                                { (absyntree)[Program] = Absyn.PROGRAM($1[lstClass],Absyn.TOP(),Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); }
                       | within classes_list 
                                { (absyntree)[Program] = Absyn.PROGRAM($2[lstClass],$1[Within],Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); }
                               

within              :  WITHIN path SEMICOLON { $$[Within] = Absyn.WITHIN($2[Path]); }

classes_list            : class SEMICOLON { $$[lstClass] = $1[Class]::{}; } 
                        | class SEMICOLON classes_list { $$[lstClass] = $1[Class]::$2[lstClass]; }
                          /* restriction IDENT classdef T_END IDENT SEMICOLON
                                { if (not stringEqual($2,$5) ) then print(Types.printInfoError(info) + " Error: The identifier at start and end are different '" + $2 + "'");
                                   true = ($2 == $5);
                                  end if; $$[Class] = Absyn.CLASS($2,false,false,false,$1[Restriction],$3[ClassDef],info); }
                          */
                          
class                  : restriction IDENT classdef 
                                { $$[Class] = Absyn.CLASS($2,false,false,false,$1[Restriction],$3[ClassDef],info); }
                       | classprefix restriction IDENT classdef 
                                { (v1Boolean,v2Boolean,v3Boolean) = $1[Boolean3]; 
                                 $$[Class] = Absyn.CLASS($3,v1Boolean,v2Boolean,v3Boolean,$2[Restriction],$4[ClassDef],info); }          

classprefix            : FINAL encapsulated partial  
                         { $$[Boolean3] = (true,$2[Boolean],$3[Boolean]); }
                        | ENCAPSULATED partial   
                         { $$[Boolean3] = (false,true,$1[Boolean]); }
                        | PARTIAL   
                         { $$[Boolean3] = (false,false,$1[Boolean]); }

encapsulated           : ENCAPSULATED { $$[Boolean] = true;   }
                        | /* empty */ { $$[Boolean] = false; }
                        
partial                : PARTIAL { $$[Boolean] = true;   }
                        | /* empty */ { $$[Boolean] = false; }
                           
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
						| OPERATOR FUNCTION { $$[Restriction] = Absyn.R_OPERATOR_FUNCTION(); }
						| OPERATOR RECORD { $$[Restriction] = Absyn.R_OPERATOR_RECORD(); }
	                    | OPERATOR { $$[Restriction] = Absyn.R_OPERATOR(); }
						
classdef             : classparts T_END IDENT  
                          { $$[ClassDef] = Absyn.PARTS({},$1[ClassParts],NONE()); } 
                     | string classparts T_END IDENT 
                          { $$[ClassDef] = Absyn.PARTS({},$2[ClassParts],SOME($1)); }
                     | classdefenumeration   
                          { $$[ClassDef] = $1[ClassDef]; };
                     | classdefderived   
                          { $$[ClassDef] = $1[ClassDef]; };
                     
classdefenumeration  :  EQUALS ENUMERATION RPAR enumeration LPAR comment
                          { $$[ClassDef] = Absyn.ENUMERATION($4[EnumDef],SOME($6[Comment])); }
                                                 
classdefderived     : EQUALS typespec comment 
                        { $$[ClassDef] = Absyn.DERIVED($2[TypeSpec],Absyn.ATTR(false,false,Absyn.VAR(), Absyn.BIDIR(),{}),{},SOME($3[Comment])); }   
                    | EQUALS elementAttr typespec comment
                        { $$[ClassDef] = Absyn.DERIVED($3[TypeSpec],$2[ElementAttributes],{},SOME($4[Comment])); }                    

enumeration         : enumlist { $$[EnumDef] = Absyn.ENUMLITERALS($1[EnumLiterals]); }
                     | COLON { $$[EnumDef] = Absyn.ENUM_COLON(); }
                     
enumlist          :  enumliteral { $$[EnumLiterals] = $1[EnumLiteral]::{}; }
                   | enumliteral COMMA enumlist { $$[EnumLiterals] = $1[EnumLiteral]::$3[EnumLiterals]; }

enumliteral          : ident comment { $$[EnumLiteral] = Absyn.ENUMLITERAL($1[Ident],SOME($2[Comment])); }

classparts           : classpart { $$[ClassParts] = $1[ClassPart]::{}; }
                      | classpart classparts { $$[ClassParts] = $1[ClassPart]::$2[ClassParts]; }

classpart           : elementItems { $$[ClassPart] = Absyn.PUBLIC($1[ElementItems]); }
                     | restClass { $$[ClassPart] = $1[ClassPart]; }

                     
                     
restClass              : PUBLIC elementItems { $$[ClassPart] = Absyn.PUBLIC($1[ElementItems]); }
                        | PROTECTED elementItems { $$[ClassPart] = Absyn.PROTECTED($1[ElementItems]); } 
                        | EQUATION { $$[ClassPart] = Absyn.EQUATIONS({}); }
                        | EQUATION equationsection { $$[ClassPart] = Absyn.EQUATIONS($1[EquationItems]); }
                        | INITIAL EQUATION equationsection { $$[ClassPart] = Absyn.INITIALEQUATIONS($1[EquationItems]); }  
                        | T_ALGORITHM { $$[ClassPart] = Absyn.ALGORITHMS({}); }
                        | T_ALGORITHM algorithmsection { $$[ClassPart] = Absyn.ALGORITHMS($1[AlgorithmItems]); } 
                        | INITIAL T_ALGORITHM algorithmsection { $$[ClassPart] = Absyn.INITIALALGORITHMS($1[AlgorithmItems]); }
                       /* | EXTERNAL externalDecl annotation    */

/* ALGORITHMS */

algorithmsection        :  algorithmitem { $$[AlgorithmItems] = $1[AlgorithmItem]::{}; }
                        | algorithmitem algorithmsection { $$[AlgorithmItems] = $1[AlgorithmItem]::$2[AlgorithmItems]; }

algorithmitem           : algorithm comment SEMICOLON 
                          { $$[AlgorithmItem] = Absyn.ALGORITHMITEM($1[Algorithm],SOME($2[Comment]),info); }  

algorithm              :  simpleExp ASSIGN exp  // TOREV: cref or any exp?  { $$[Algorithm] = Absyn.ALG_ASSIGN(Absyn.CREF($1[ComponentRef]),$2[Exp]); }
                            { $$[Algorithm] = Absyn.ALG_ASSIGN($1[Exp],$2[Exp]); }
                        | cref functioncall 
                            { $$[Algorithm] = Absyn.ALG_NORETCALL($1[ComponentRef],$2[FunctionArgs]); }     
                        | tuple ASSIGN exp
                            { $$[Algorithm] = Absyn.ALG_ASSIGN($1[Exp],$3[Exp]); }
                        | RETURN  
                            { $$[Algorithm] = Absyn.ALG_RETURN(); }
                        | BREAK  
                             { $$[Algorithm] = Absyn.ALG_BREAK(); }
                        | if_algorithm 
                             { $$[Algorithm] = $1[Algorithm]; }
                        | when_algorithm 
                             { $$[Algorithm] = $1[Algorithm]; }
                        | FOR foriterators LOOP algorithmsection T_END FOR
                             { $$[Algorithm] = Absyn.ALG_FOR($3[ForIterators],$5[AlgorithmItems]); }
                        | WHILE exp LOOP  algorithmsection T_END WHILE
                            { $$[Algorithm] = Absyn.ALG_WHILE($3[Exp],$5[AlgorithmItems]); }    
                           
if_algorithm           : IF exp THEN T_END IF { $$[Algorithm] = Absyn.ALG_IF($2[Exp],{},{},{}); } // warning empty if 
                       |IF exp THEN algorithmsection T_END IF { $$[Algorithm] = Absyn.ALG_IF($2[Exp],$4[AlgorithmItems],{},{}); } 
                       | IF exp THEN algorithmsection ELSE algorithmsection T_END IF { $$[Algorithm] = Absyn.ALG_IF($2[Exp],$4[AlgorithmItems],{},$6[AlgorithmItems]); }
                       | IF exp THEN algorithmsection algelseifs T_END IF { $$[Algorithm] = Absyn.ALG_IF($2[Exp],$4[AlgorithmItems],$5[AlgElseifs],{}); }
                       | IF exp THEN algorithmsection algelseifs ELSE algorithmsection T_END IF { $$[Algorithm] = Absyn.ALG_IF($2[Exp],$4[AlgorithmItems],$5[AlgElseifs],$7[AlgorithmItems]); }

algelseifs              :  algelseif { $$[AlgElseifs] = $1[AlgElseif]::{}; }
                        | algelseif algelseifs { $$[AlgElseifs] = $1[AlgElseif]::$2[AlgElseifs]; }

algelseif               : ELSEIF exp THEN algorithmsection  { $$[AlgElseif] = ($2[Exp],$4[AlgorithmItems]); }                                                      

when_algorithm        :  WHEN exp THEN algorithmsection T_END WHEN 
                           { $$[Algorithm] = Absyn.ALG_WHEN_A($2[Exp],$4[AlgorithmItems],{}); }
                     | WHEN exp THEN algorithmsection algelsewhens T_END WHEN 
                           { $$[Algorithm] = Absyn.ALG_WHEN_A($2[Exp],$4[AlgorithmItems],$5[AlgElsewhens]); }     

algelsewhens               :  algelsewhen { $$[AlgElsewhens] = $1[AlgElsewhen]::{}; }
                        | algelsewhen algelsewhens { $$[AlgElsewhens] = $1[AlgElsewhen]::$2[AlgElsewhens]; }

algelsewhen               : ELSEWHEN exp THEN algorithmsection  { $$[AlgElsewhen] = ($2[Exp],$4[AlgorithmItems]); } 


/* EQUATIONS */
equationsection        :  equationitem { $$[EquationItems] = $1[EquationItem]::{}; }
                        | equationitem equationsection { $$[EquationItems] = $1[EquationItem]::$2[EquationItems]; }

equationitem           :  equation comment SEMICOLON 
                          { $$[EquationItem] = Absyn.EQUATIONITEM($1[Equation],SOME($2[Comment]),info); }  

equation               : exp EQUALS exp 
                             { $$[Equation] = Absyn.EQ_EQUALS($1[Exp],$2[Exp]); }
                        | if_equation 
                             { $$[Equation] = $1[Equation]; }
                        | when_equation 
                             { $$[Equation] = $1[Equation]; }
                        | CONNECT LPAR cref COMMA cref RPAR 
                             { $$[Equation] = Absyn.EQ_CONNECT($3[ComponentRef],$5[ComponentRef]); }
                        | FOR foriterators LOOP equationsection T_END FOR
                             { $$[Equation] = Absyn.EQ_FOR($3[ForIterators],$5[EquationItems]); }
                        | cref functioncall { $$[Equation] = Absyn.EQ_NORETCALL($1[ComponentRef],$2[FunctionArgs]); }     
                                  
when_equation        :  WHEN exp THEN equationsection T_END WHEN 
                           { $$[Equation] = Absyn.EQ_WHEN_E($2[Exp],$4[EquationItems],{}); }
                     | WHEN exp THEN equationsection elsewhens T_END WHEN 
                           { $$[Equation] = Absyn.EQ_WHEN_E($2[Exp],$4[EquationItems],$5[Elsewhens]); }     

elsewhens               :  elsewhen { $$[Elsewhens] = $1[Elsewhen]::{}; }
                        | elsewhen elsewhens { $$[Elsewhens] = $1[Elsewhen]::$2[Elsewhens]; }

elsewhen               : ELSEWHEN exp THEN equationsection  { $$[Elsewhen] = ($2[Exp],$4[EquationItems]); } 

foriterators          : foriterator { $$[ForIterators] = $1[ForIterator]::{}; }
                      | foriterator COMMA foriterators { $$[ForIterators] = $1[ForIterator]::$2[ForIterators]; }

foriterator           : IDENT { $$[ForIterator] = Absyn.ITERATOR($1,NONE(),NONE()); }
                      | IDENT T_IN rangeExp { $$[ForIterator] = Absyn.ITERATOR($1,NONE(),SOME($3[Exp])); }

if_equation           : IF exp THEN equationsection T_END IF { $$[Equation] = Absyn.EQ_IF($2[Exp],$4[EquationItems],{},{}); } 
                      | IF exp THEN equationsection ELSE equationsection T_END IF { $$[Equation] = Absyn.EQ_IF($2[Exp],$4[EquationItems],{},$6[EquationItems]); }
                      | IF exp THEN equationsection elseifs T_END IF { $$[Equation] = Absyn.EQ_IF($2[Exp],$4[EquationItems],$5[Elseifs],{}); }
                      | IF exp THEN equationsection elseifs ELSE equationsection T_END IF { $$[Equation] = Absyn.EQ_IF($2[Exp],$4[EquationItems],$5[Elseifs],$7[EquationItems]); }

elseifs               :  elseif { $$[Elseifs] = $1[Elseif]::{}; }
                        | elseif elseifs { $$[Elseifs] = $1[Elseif]::$2[Elseifs]; }

elseif               : ELSEIF exp THEN equationsection  { $$[Elseif] = ($2[Exp],$4[EquationItems]); }

/* Expressions and Elements */                    

elementItems         : elementItem { $$[ElementItems] = $1[ElementItem]::{}; }
                      | elementItem elementItems { $$[ElementItems] = $1[ElementItem]::$2[ElementItems]; }

elementItem         : element SEMICOLON { $$[ElementItem] = Absyn.ELEMENTITEM($1[Element]); }

element             : componentclause 
                        { $$[Element] = $1[Element]; }
                    | importelementspec 
                        { $$[Element] = Absyn.ELEMENT(false,NONE(),Absyn.NOT_INNER_OUTER(),"IMPORT",$1[ElementSpec],info,NONE()); }
                    | classelementspec  
                        { $$[Element] = Absyn.ELEMENT(false,NONE(),Absyn.NOT_INNER_OUTER(),"CLASS",$1[ElementSpec],info,NONE()); }  

componentclause      : elementspec 
                        { $$[Element] = Absyn.ELEMENT(false,NONE(),Absyn.NOT_INNER_OUTER(),"ELEMENTSPEC",$1[ElementSpec],info,NONE()); }
	                    | innerouter elementspec 
	                        { $$[Element] = Absyn.ELEMENT(false,NONE(),$1[InnerOuter],"ELEMENTSPEC",$2[ElementSpec],info,NONE()); }
	                    | FINAL innerouter ident elementspec 
	                        { $$[Element] = Absyn.ELEMENT(true,NONE(),$1[InnerOuter],$3[Ident],$2[ElementSpec],info,NONE()); }
	                    | FINAL ident elementspec 
	                        { $$[Element] = Absyn.ELEMENT(true,NONE(),Absyn.NOT_INNER_OUTER(),$2[Ident],$3[ElementSpec],info,NONE()); }
	                    | redeclarekeywords innerouter ident elementspec 
	                        { $$[Element] = Absyn.ELEMENT(false,SOME($1[RedeclareKeywords]),$2[InnerOuter],$3[Ident],$4[ElementSpec],info,NONE()); }
	                    | redeclarekeywords ident elementspec 
	                        { $$[Element] = Absyn.ELEMENT(false,SOME($1[RedeclareKeywords]),Absyn.NOT_INNER_OUTER(),$2[Ident],$3[ElementSpec],info,NONE()); }
	                    | redeclarekeywords FINAL innerouter ident elementspec 
	                        { $$[Element] = Absyn.ELEMENT(true,SOME($1[RedeclareKeywords]),$3[InnerOuter],$4[Ident],$5[ElementSpec],info,NONE()); }
	                    | redeclarekeywords FINAL ident elementspec 
	                        { $$[Element] = Absyn.ELEMENT(true,SOME($1[RedeclareKeywords]),Absyn.NOT_INNER_OUTER(),$3[Ident],$4[ElementSpec],info,NONE()); }

componentitems      : componentitem { $$[ComponentItems] = $1[ComponentItem]::{}; }
                    | componentitem COMMA componentitems { $$[ComponentItems] = $1[ComponentItem]::$2[ComponentItems]; }

componentitem       : component comment { $$[ComponentItem] = Absyn.COMPONENTITEM($1[Component],NONE(),SOME($2[Comment])); }
                   
component           : ident { $$[Component] = Absyn.COMPONENT($1[Ident],{},NONE()); } 
                    | ident modification { $$[Component] = Absyn.COMPONENT($1[Ident],{},SOME($2[Modification])); }                                                                 

modification        : EQUALS exp { $$[Modification] = Absyn.CLASSMOD({},Absyn.EQMOD($2[Exp],info)); }
                    | ASSIGN exp { $$[Modification] = Absyn.CLASSMOD({},Absyn.EQMOD($2[Exp],info)); }  
                    
redeclarekeywords   : REDECLARE { $$[RedeclareKeywords] = Absyn.REDECLARE(); }
                    | REPLACEABLE { $$[RedeclareKeywords] = Absyn.REPLACEABLE(); }
                    | REDECLARE REPLACEABLE { $$[RedeclareKeywords] = Absyn.REDECLARE_REPLACEABLE(); }                  

innerouter		    : INNER { $$[InnerOuter] = Absyn.INNER(); }
                     | T_OUTER { $$[InnerOuter] = Absyn.OUTER(); }
                     | INNER T_OUTER { $$[InnerOuter] = Absyn.INNER_OUTER(); }
                    //| /* empty */ { $$[InnerOuter] = Absyn.NOT_INNER_OUTER(); }

                     
importelementspec    :  import comment { $$[ElementSpec] = Absyn.IMPORT($1[Import],SOME($2[Comment]),info); }

classelementspec    : class { $$[ElementSpec] = Absyn.CLASSDEF(false,$1[Class]); }                     
                    | REPLACEABLE class { $$[ElementSpec] = Absyn.CLASSDEF(true,$2[Class]); }
                                                            
import              : IMPORT path  { $$[Import] = Absyn.QUAL_IMPORT($2[Path]); }
                     | IMPORT path DOT STAR { $$[Import] = Absyn.QUAL_IMPORT($2[Path]); }

elementspec          :  elementAttr typespec componentitems
                        { $$[ElementSpec] = Absyn.COMPONENTS($1[ElementAttributes],$2[TypeSpec],$3[ComponentItems]); }
                      |  typespec componentitems
                        { $$[ElementSpec] = Absyn.COMPONENTS(Absyn.ATTR(false,false,Absyn.VAR(), Absyn.BIDIR(),{}),$1[TypeSpec],$2[ComponentItems]); }
                       
elementAttr          : direction 
                         { $$[ElementAttributes] = Absyn.ATTR(false,false,Absyn.VAR(), $1[Direction],{}); }
                      | variability  
                         { $$[ElementAttributes] = Absyn.ATTR(false,false,$1[Variability], Absyn.BIDIR(),{}); }
                      | variability direction 
                         { $$[ElementAttributes] = Absyn.ATTR(false,false,$1[Variability], $2[Direction],{}); }
                      | STREAM variability direction 
                         { $$[ElementAttributes] = Absyn.ATTR(false,true,$2[Variability], $3[Direction],{}); }
                      | FLOW variability direction 
                         { $$[ElementAttributes] = Absyn.ATTR(true,false,$2[Variability], $3[Direction],{}); } 
                         
variability          : PARAMETER { $$[Variability] = Absyn.PARAM(); } 
                      | CONSTANT { $$[Variability] = Absyn.CONST(); } 
                      | DISCRETE { $$[Variability] = Absyn.DISCRETE(); }
                     // | /* empty */ { $$[Variability] = Absyn.VAR(); } 

direction           : T_INPUT { $$[Direction] = Absyn.INPUT(); } 
                     | T_OUTPUT { $$[Direction] = Absyn.OUTPUT(); }
                    // | /* empty */ { $$[Direction] = Absyn.BIDIR(); }              

/* Type specification */

typespec             : path arraySubscripts { $$[TypeSpec] = Absyn.TPATH($1[Path],SOME($2[ArrayDim])); }
                     | path arrayComplex { $$[TypeSpec] = Absyn.TCOMPLEX($1[Path],$2[TypeSpecs],NONE()); }

arrayComplex        : LESS typespecs GREATER { $$[TypeSpecs] = $1[TypeSpecs]; }

typespecs           : typespec { $$[TypeSpecs] = $1[TypeSpec]::{}; }
                     | typespec COMMA typespecs { $$[TypeSpecs] = $1[TypeSpec]::$2[TypeSpecs]; }

arraySubscripts     : LBRACK arrayDim RBRACK { $$[ArrayDim] = $1[ArrayDim]; }
                    | /* empty */ { $$[ArrayDim] = {}; }                      
                     
arrayDim			: exp { $$[ArrayDim] = Absyn.SUBSCRIPT($1[Exp])::{}; }
                     | exp COMMA arrayDim { $$[ArrayDim] = Absyn.SUBSCRIPT($1[Exp])::$2[ArrayDim]; }

/* function calls */

functioncall        : LPAR functionargs RPAR { $$[FunctionArgs] = $1[FunctionArgs]; }
                  
functionargs        : namedargs 
                       { $$[FunctionArgs] = Absyn.FUNCTIONARGS({},$1[NamedArgs]); }
                    | explist2 
                       { $$[FunctionArgs] = Absyn.FUNCTIONARGS($1[Exps],{}); }
                    | explist2 COMMA namedargs // TODO: Test for LALR grammar, may not work shift/reduce conflict 
                       { $$[FunctionArgs] = Absyn.FUNCTIONARGS($1[Exps],$2[NamedArgs]); } 

namedargs           : namedarg { $$[NamedArgs] = $1[NamedArg]::{}; }
                     | namedarg COMMA namedargs { $$[NamedArgs] = $1[NamedArg]::$2[NamedArgs]; }
                     

namedarg            : ident EQUALS exp { $$[NamedArg] = Absyn.NAMEDARG($1[Ident],$2[Exp]);  }

/* expressions */
                     
exp					: simpleExp { $$[Exp] = $1[Exp]; }
                     | if_exp { $$[Exp] = $1[Exp]; }
                     | matchcont { $$[Exp] = $1[Exp]; }

matchcont        : MATCH exp cases T_END MATCH { $$[Exp] = Absyn.MATCHEXP(Absyn.MATCH(),$2[Exp],{},$3[Cases],NONE()); }
                 | MATCH exp matchlocal cases T_END MATCH { $$[Exp] = Absyn.MATCHEXP(Absyn.MATCH(),$2[Exp],$3[ElementItems],$4[Cases],NONE()); }
                 | MATCHCONTINUE exp cases T_END MATCHCONTINUE { $$[Exp] = Absyn.MATCHEXP(Absyn.MATCHCONTINUE(),$2[Exp],{},$3[Cases],NONE()); }
                 | MATCHCONTINUE exp matchlocal cases T_END MATCHCONTINUE { $$[Exp] = Absyn.MATCHEXP(Absyn.MATCHCONTINUE(),$2[Exp],$3[ElementItems],$4[Cases],NONE()); }


if_exp           : IF exp THEN exp ELSE exp { $$[Exp] = Absyn.IFEXP($2[Exp],$4[Exp],$6[Exp],{}); }
                 | IF exp THEN exp expelseifs ELSE exp T_END IF { $$[Exp] = Absyn.IFEXP($2[Exp],$4[Exp],$7[Exp],$5[ExpElseifs]); }
                   
expelseifs              :  expelseif { $$[ExpElseifs] = $1[ExpElseif]::{}; }
                        | expelseif expelseifs { $$[ExpElseifs] = $1[ExpElseif]::$2[ExpElseifs]; }

expelseif               : ELSEIF exp THEN exp  { $$[ExpElseif] = ($2[Exp],$4[Exp]); }                                                    
                     

matchlocal        : LOCAL elementItems { $$[ElementItems] = $1[ElementItems]; }

cases             : case { $$[Cases] = $1[Case]::{}; }
                  | case cases { $$[Cases] = $1[Case]::$2[Cases]; }  
                                    
case              : CASE casearg THEN exp SEMICOLON 
                       { $$[Case] = Absyn.CASE($2[Exp],info,{},{},$4[Exp],info,NONE(),info); }
                  | CASE casearg EQUATION THEN exp SEMICOLON 
                       { $$[Case] = Absyn.CASE($2[Exp],info,{},{},$4[Exp],info,NONE(),info);  }
                  | CASE casearg EQUATION equationsection THEN exp SEMICOLON 
                       { $$[Case] = Absyn.CASE($2[Exp],info,{},$4[EquationItems],$6[Exp],info,NONE(),info); }
                  | ELSE THEN exp SEMICOLON 
                       { $$[Case] = Absyn.ELSE({},{},$3[Exp],info,NONE(),info); } 
                  | ELSE EQUATION equationsection THEN exp SEMICOLON 
                       { $$[Case] = Absyn.ELSE({},$3[EquationItems],$5[Exp],info,NONE(),info); }

casearg          : exp { $$[Exp] = $1[Exp]; }
                 

simpleExp        : logicexp { $$[Exp] = $1[Exp]; }
                  | rangeExp { $$[Exp] = $1[Exp]; }
                  | headtail { $$[Exp] = $1[Exp]; }
                  | ident AS simpleExp { $$[Exp] = Absyn.AS($1[Ident],$2[Exp]); }
                  
headtail        : logicexp COLONCOLON logicexp { $$[Exp] = Absyn.CONS($1[Exp],$3[Exp]); }
                 | logicexp COLONCOLON headtail { $$[Exp] = Absyn.CONS($1[Exp],$3[Exp]); }

rangeExp          : logicexp COLON logicexp { $$[Exp] = Absyn.RANGE($1[Exp],NONE(),$3[Exp]); }
                  | logicexp COLON logicexp COLON logicexp { $$[Exp] = Absyn.RANGE($1[Exp],SOME($3[Exp]),$5[Exp]); }                  
				   
logicexp          : logicterm { $$[Exp] = $1[Exp]; }
                   | logicterm T_OR logicexp { $$[Exp] = Absyn.LBINARY($1[Exp],Absyn.OR(),$2[Exp]); }

logicterm          : logfactor { $$[Exp] = $1[Exp]; }
                   | logfactor T_AND logicterm { $$[Exp] = Absyn.LBINARY($1[Exp],Absyn.AND(),$2[Exp]); }

logfactor         : relterm  { $$[Exp] = $1[Exp]; }
                   | T_NOT relterm { $$[Exp] = Absyn.LUNARY(Absyn.NOT(),$1[Exp]); }  

relterm            : addterm { $$[Exp] = $1[Exp]; }
                   | addterm relOperator addterm { $$[Exp] = Absyn.RELATION($1[Exp],$2[Operator],$3[Exp]); }

addterm             : term { $$[Exp] = $1[Exp]; }
                    | woperator term { $$[Exp] = Absyn.UNARY($1[Operator],$2[Exp]); }
                    | term woperator addterm { $$[Exp] = Absyn.BINARY($1[Exp],$2[Operator],$3[Exp]); }                                          

term               : factor { $$[Exp] = $1[Exp]; }
					| factor soperator term { $$[Exp] = Absyn.BINARY($1[Exp],$2[Operator],$3[Exp]); }                                          

factor              : expElement { $$[Exp] = $1[Exp]; }
					| expElement power factor  { $$[Exp] = Absyn.BINARY($1[Exp],$2[Operator],$3[Exp]); }                    
					
expElement          : UNSIGNED_INTEGER { $$[Exp] = Absyn.INTEGER(stringInt($1)); }
                     | cref { $$[Exp] = Absyn.CREF($1[ComponentRef]); }
                     | T_FALSE { $$[Exp] = Absyn.BOOL(false); }
                     | T_TRUE { $$[Exp] = Absyn.BOOL(true); }
                     | string { $$[Exp] = Absyn.STRING($1); }
                     | UNSIGNED_REAL { $$[Exp] = Absyn.REAL(stringReal($1)); } 
                     | tuple  { $$[Exp] = $1[Exp]; }
                     | LBRACE explist2 RBRACE { $$[Exp] = Absyn.ARRAY($2[Exps]); }
                     | cref functioncall { $$[Exp] = Absyn.CALL($1[ComponentRef],$2[FunctionArgs]); }
                     | LPAR simpleExp RPAR { $$[Exp] = $2[Exp]; }
                     
tuple               : LPAR explist RPAR { $$[Exp] = Absyn.TUPLE($2[Exps]); }

explist             : exp COMMA exp { $$[Exps] = {$1[Exp],$3[Exp]};  }
                    | exp COMMA explist { $$[Exps] = $1[Exp]::$3[Exps]; }
                    | /* empty */ { $$[Exps] = {}; }

explist2            : exp  { $$[Exps] = {$1[Exp]};  }
                    | exp COMMA explist2 { $$[Exps] = $1[Exp]::$3[Exps]; }
                    | /* empty */ { $$[Exps] = {}; }
                    
cref                :  ident arraySubscripts { $$[ComponentRef] = Absyn.CREF_IDENT($1[Ident],$2[ArrayDim]); }
                     | ident DOT cref  { $$[ComponentRef] = Absyn.CREF_QUAL($1[Ident],{},$3[ComponentRef]); }
                     | DOT cref  { $$[ComponentRef] = Absyn.CREF_FULLYQUALIFIED($2[ComponentRef]); }
                     | WILD { $$[ComponentRef] = Absyn.WILD();}    
                     | ALLWILD { $$[ComponentRef] = Absyn.ALLWILD();}                   
                     
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
                                                           
path                 : ident { $$[Path] = Absyn.IDENT($1[Ident]); }
                      | ident DOT path { $$[Path] = Absyn.QUALIFIED($1[Ident],$2[Path]); }
                      | DOT path { $$[Path] = Absyn.FULLYQUALIFIED($2[Path]); } 
                                
ident                :  IDENT { $$[Ident] = $1; }                      

string               : STRING { $$ = trimquotes($1); } // trim the quote of the string

comment              : string { $$[Comment] = Absyn.COMMENT(NONE(),SOME($1)); }
                     | /* empty */ { $$[Comment] = Absyn.COMMENT(NONE(),NONE()); }                     


%%

public function trimquotes
"removes chars in charsToRemove from inString"
  input String inString;
  output String outString;
 algorithm
  if (stringLength(inString)>2) then
    outString := System.substring(inString,2,stringLength(inString)-1);
  else
    outString := "";
  end if;
end trimquotes;

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
