/* -*- C -*- */

#header <<

typedef enum { false=0, true=1 } bool;
/* #include "bool.h" */

#include "attrib.h"
#include "parser.h"
#include "modAST.h"

#define AST_FIELDS Attrib *attr; void *rml;
#define zzcr_ast(ast,atr,ttype,text) ast->attr=copy_attr(atr); ast->rml=NULL;


>>

<<

#include <stdlib.h>

/* #include "DLexerBase.h" */
/* #include "scanner.h" */
/* #include "AToken.h" */

#include "yacclib.h"
#include "errno.h"

static int errors=0;

static char *filename=NULL;
static char *outputfilename=NULL;

void newline()
{
  zzline++;
}

AST *zzmk_ast(AST *ast, Attrib *at)
{
  ast->attr = copy_attr(at);
  return ast;
}

>>

/**************************************************************/
/* Token definitions for the the lexical analyzer. */

#lexclass START
#token "/\*"		<< zzskip(); zzmode(C_STYLE_COMMENT); >>
#token IMPORT		"import"
#token CLASS_		"class"
#token BOUNDARY		"boundary"
#token MODEL		"model"
#token FUNCTION		"function"
#token PACKAGE		"package"
#token RECORD		"record"
#token BLOCK		"block"
#token CONNECTOR	"connector"
#token TYPE		"type"
#token END		"end"

#token ANNOTATION	"annotation"

#token EXTERNAL		"external"
#token EXTENDS		"extends"
#token PARAMETER	"parameter"
#token CONSTANT		"constant"
#token VIRTUAL		"virtual"
#token PARTIAL		"partial"
#token REDECLARE	"redeclare"
#token INPUT		"input"
#token OUTPUT		"output"
#token FLOW		"flow"

#token EQUATION		"equation"
#token ALGORITHM	"algorithm"
#token RESULTS		"results"

#token FINAL		"final"
#token PUBLIC		"public"
/* #token PRIVATE		"private" */
#token PROTECTED	"protected"
#token LPAR		"\("
#token RPAR		"\)"
#token LBRACK		"\["
#token RBRACK		"\]"
/* #token RECORD_BEGIN	"\{" */
/* #token RECORD_END	"\}" */
#token IF		"if"
#token THEN		"then"
#token ELSE		"else"
#token ELSEIF		"elseif"
/* #token ENDIF		"endif" */
/* #token WHEN		"when" */
/* #token ENDWHEN		"endwhen" */
#token OR		"or"
#token AND		"and"
#token NOT		"not"
#token TIME		"time"
#token FALS		"false"
#token TRU		"true"

/* #token FORALL		"forall" */
/* #token ENDFORALL	"endforall" */
#token IN		"in"
#token FOR		"for"
#token WHILE		"while"
#token LOOP		"loop"

#token DER		"der"

/*
#token NEW		"new"
#token INIT		"init"
#token DER		"der"
#token RESIDUE		"residue"
*/

#token EQUALS           "="

/* #tokclass COMP_BEGIN	{ LPAR RECORD_BEGIN } */
/* #tokclass COMP_END	{ RPAR RECORD_END } */

/* #tokclass ARR_ARG_BEG	{ LPAR LBRACK } */
/* #tokclass ARR_ARG_END   { RPAR RBRACK } */

#tokclass REL_OP 	{ "<" "<=" ">" ">=" "==" "<>" }
#tokclass ADD_OP	{ "\+" "\-" }
#tokclass MUL_OP	{ "\*" "/" }

#tokclass ASSIGN	{ "=" ":=" }

/* synthetic nodes */
#token EXTRA_TOKEN	/* used for synthetic nodes */
#token COMPONENTS
#token TYPE_PREFIX
#token FUNCALL

#token "//(~[\n])*"  << zzskip(); >> /* skip C++-style comments */

#token IDENT 		"([a-z]|[A-Z])([a-z]|[A-Z]|[0-9]|_)*"

#token STRING		"\"(~[\"])*\""

#token UNSIGNED_NUMBER	"[0-9]+{\.[0-9]*}{[eE]{[\+\-]}[0-9]+}"

#token "[\ \t]+"    << zzskip(); >>
#token "\n"         << zzskip(); newline(); >>

#lexclass C_STYLE_COMMENT

#token	"[\n\r]"	<< zzskip(); newline(); >>
#token	"\*/"		<< zzskip(); zzmode(START); >>
#token	"\*"		<< zzskip(); >>
#token	"~[\*\n\r]+"	<< zzskip(); >>


#lexclass START

/**************************************************************/
/* The main part of the Modelica parser. */

model_specification :
	(
	  cl:class_definition[false,false] ";"! 
	| import_statement
	)+
	"@"!
	;

import_statement :
	im:IMPORT^ STRING ";"! << /* #im->ni.type=IMPORT_STATEMENT; */ >>
	;

class_definition[bool is_virtual,bool is_final] :
	{ PARTIAL } 
        ( CLASS_
	| MODEL
	| RECORD
	| BLOCK
	| CONNECTOR
	| TYPE
	| PACKAGE
	| { EXTERNAL } FUNCTION )
        IDENT
	comment
	( composition END! { IDENT! } |
	  EQUALS IDENT { array_decl } { class_specialization } 	  
	)
        << Attrib a = $[CLASS_,"---"]; #0 = #(#[&a], #0); >>
	;

composition :
	default_public
	( public_elements    |
	  protected_elements |
	  equation_clause    |
	  algorithm_clause
	)*
	;

default_public:
	element_list[false]
        ;

public_elements: PUBLIC^ element_list[false];
protected_elements: PROTECTED^ element_list[true];


element_list[bool is_protected] :
	( el:element ";"! << /* if (is_protected) #el->ni.properties |= ELEMENT_PROTECTED; */ >>
	  | annotation ";"! )*
    ;

element :
	<< bool is_virtual=false; bool is_final=false; >>
	{ FINAL }
	( { VIRTUAL << is_virtual=true; >> } class_definition[is_virtual,is_final]
	| extends_clause
	| component_clause[ET_COMPONENT] )
	;

/*
 * Extends
 */

extends_clause:
	EXTENDS^ IDENT
	{ class_specialization }
	;

/*
 * Component clause
 */

component_clause![NodeType nt] : << Attrib a = $[COMPONENTS,"---"]; >>
	p:type_prefix
	s:type_specifier
	l:component_list[NO_SPECIAL]
        << #0 = #(#[&a], #p, #s, #l); >> 
	;

type_prefix : << Attrib a = $[TYPE_PREFIX,"---"]; >>
	{ f:FLOW      } 
	{ p:PARAMETER
	| c:CONSTANT  }
	{ i:INPUT     
	| o:OUTPUT    }
        << #0 = #(#[&a],#0); >>
	;

type_specifier :
	name_path
	;

component_list[NodeType nt] :
    component_declaration[nt] ( ","! component_declaration[nt] )*
	;

component_declaration[NodeType nt] :
        declaration[nt] comment
	;

declaration[NodeType nt] :
	i:IDENT^ << /* #i->ni.type=nt; */ >>
	{ array_decl  }
	{ specialization }
        ;

array_decl :
	brak:LBRACK^
	subscript_list
	RBRACK!
	<< /* #brak->setOpType(OP_ARRAYDECL); */ >>
	;

subscript_list :
	subscript 
 	( "," subscript )*
	;

subscript! :
  (expression ":")? ex1:expression ":" { ex2:expression }

	<< 
/* 	   if ex2 was parsed, build a [n:m] treee */
  /*if (ex2_ast) #0=#(0,#ex1,#[EXTRA_TOKEN,"|"],#ex2); */
/* 	   else build a [n:] tree */
  /* else #0=#(0,#ex1,#[EXTRA_TOKEN,"|"],#[EXTRA_TOKEN,"_"]); */
	>>

  | ":" { ex3:expression }
	<<
/* 	  if (ex3_ast) { */
/* 	    if ex3 was parsed, build a [:m] tree */
	    /* #0=#(0,#[EXTRA_TOKEN,"1"],#[EXTRA_TOKEN,"|"],#ex3); */
/* 	  } else { */
/* 	    else build a [:] tree */
	    /* #0=#(0,#[EXTRA_TOKEN,"_"]); */
/* 	  } */
	>>
  | ex4:expression
	<<
/* 	  single expression; build [n] tree */
  /* #0=#(0,#ex4); */
	>>
  ;

/*
 * Modification (here: specialization)
 */

specialization : 
	class_specialization { EQUALS expression }
	| EQUALS^ expression
	;

class_specialization :
	LPAR^ argument_list RPAR! 
	;

argument_list :
	argument ( ","! argument )*
	;

argument :
	element_modification
	| element_redeclaration
	;
 
element_modification :
	{ FINAL } 
	id:IDENT^ << /* #id->ni.type=ELEMENT_MOD; */ >> 
	{ array_decl } 
	specialization
	;

element_redeclaration :
	<< bool is_final=false; >>
	REDECLARE
	{ FINAL << is_final=true; >> }
	( extends_clause
	  | class_definition[false,is_final]
	  | component_clause1[ET_COMPONENT] )
	;

component_clause1[NodeType nt] :
	type_prefix
	type_specifier
	component_declaration[ET_COMPONENT]
	;

/* component_clause1![NodeType nt] : */
/* 	  type_prefix  */
/* 	  t:type_specifier << #t->ni.type=nt; >> */
/* 	  c:component_declaration[ET_COMPONENT] */
/* 	  // manual tree construction: */
/* 	  // the type specifier is a new root with the component_declaration */
/* 	  // as a child. */
/* 	  << #0=#(#t,#c); >> */
/* 	  ; */

/*
 * Equations
 */


equation_clause	: 
	EQUATION^ ( equation ";"! | annotation ";"! )*
	;

algorithm_clause :
	ALGORITHM^ ( equation ";"! | annotation ";"! )*
	;

equation :
	( simple_expression { ASSIGN^ expression }
	| conditional_equation
	| for_clause
	| while_clause )
	comment
	;

/* conditional_equation : */
/* 	  i:IF^ expression << #i->setOpType(OP_FUNCTION); #i->setTranslation("If"); >>  */
/* 	  THEN! */
/* 	  el:equation_list << #el->setTranslation(";"); >> */
/* 	  ( */
/* 	   elseif_clause */
/* 	  | ELSE! */
/* 	    el2:equation_list << #el2->setTranslation(";"); >> */
/* 	  |  */
/* 	  ) */
/* 	    END! IF! */
/* 	  ; */

/* elseif_clause: */
/* 	  e:ELSEIF^ << #e->setOpType(OP_FUNCTION); #e->setTranslation("If"); >> */
/* 	  expression THEN!  */
/* 	  el:equation_list << #el->setTranslation(";"); >> */
/* 	  ( elseif_clause | ELSE! el2:equation_list << #el2->setTranslation(";"); >> | ) */
/* 	  ; */

conditional_equation :
	<< bool is_elseif=false; /* AST *e_ast; */ >>

	i:IF^ expression THEN!

	el:equation_list << /* #el->setTranslation(";"); */ >>

	( ELSEIF! << is_elseif=true; >> expression THEN!
	el1:equation_list << /* #el1->setTranslation(";"); */ >> )*

/* 	The LT(1) is there just to silence an ANTLR warning. It's not used. */
	{ ( <</*LT(1),*/is_elseif>>? els:ELSE << /* #els->setTranslation("True"); */ >> | ELSE! )
	  el2:equation_list << /* #el2->setTranslation(";"); */ >> }

	END! IF!
	<< if (is_elseif) {
	  /* #i->setOpType(OP_FUNCTION); 
	     #i->setTranslation("Which"); */
	   } else {
	  /* #i->setOpType(OP_FUNCTION); 
	     #i->setTranslation("If");  */
	   }
	>>
	;

for_clause ! :
	for_:FOR id:IDENT IN! e1:expression ":"! e2:expression
	{ ":"! e3:expression } LOOP!
	el:equation_list << /* #el->setTranslation(";"); */ >>
	END! FOR!
	<< /* #for_=#[for_];
	   #for_->setOpType(OP_FUNCTION); 
	   #for_->setTranslation("For");
	   if (e3_ast) {
	     #0=#(#for_,
	          #(#[EXTRA_TOKEN,"="],#[id],#e1),
                  #(#[EXTRA_TOKEN,"<="],#[id],#e2),
	          #(#[EXTRA_TOKEN,"="],#[id],#(#[EXTRA_TOKEN,"+"],#[id],#e3)),
	          #el);
          } else {
	     #0=#(#for_,
	          #(#[EXTRA_TOKEN,"="],#[id],#e1),
                  #(#[EXTRA_TOKEN,"<="],#[id],#e2),
	          #(#[EXTRA_TOKEN,"++",OP_POSTFIX],#[id]),
	          #el);
           }	 */   
	>>
	;

while_clause :
	while_:WHILE^ expression LOOP!

	el:equation_list << /* #el->setTranslation(";"); */ >>
	END! WHILE!
	<< /* #while_->setOpType(OP_FUNCTION); 
	      #while_->setTranslation("While"); */
	>>
	;

equation_list :
	( equation ";"! )*
	<< /* #0=#(#[EXTRA_TOKEN],#0); */ >>
	;

/*
 * Expressions
 */

expression :

	simple_expression 
	| ifpart:IF^ << /* #ifpart->setOpType(OP_FUNCTION); #ifpart->setTranslation("If"); */ >>
	  expression 
	  THEN!
	  simple_expression
	  ELSE!
	  expression
	  ;

simple_expression :
	logical_term
	( o:OR^ logical_term << /* #o->setTranslation("||"); */ >>
	)*
	;

logical_term :
	logical_factor
	( a:AND^ logical_factor << /* #a->setTranslation("&&"); */ >>
	)*
	;

logical_factor :
	not:NOT^ relation
	| relation 
	;

relation :
	arithmetic_expression 
	{ rel:REL_OP^ arithmetic_expression 
	<< /* if (!strcmp(mytoken($rel)->getText(),"<>")) #rel->setTranslation("!=");
	      else if (!strcmp(mytoken($rel)->getText(),"==")) #rel->setTranslation("==="); */
	>>
	}
	;

arithmetic_expression :

	unary_arithmetic_expression
	(
	  ADD_OP^ term
	)*
	;

unary_arithmetic_expression:

	plus:"\+"^ term  << /* #plus->setOpType(OP_PREFIX); */ >>
      | minus:"\-"^ term << /* #minus->setOpType(OP_PREFIX); */ >>
      | term 
	;

term :

	factor
	(
	  MUL_OP^  factor
	)*
	;

factor :
	primary 
	{ "^"^ primary}

/* 	Easy translation of der() function by me. */
 	| op:DER^ LPAR! primary RPAR! 
		<< /* #op->setOpType(OP_POSTFIX);
		      #op->setTranslation("'"); */
		>>
	;

primary :
	<< bool is_matrix; >>
	par:LPAR^  << /* #par->setOpType(OP_BALANCED,')'); */ >> 
	expression RPAR!

	| op:LBRACK^ << /* #op->setOpType(OP_BALANCED,'}');
			   #op->setTranslation("{"); */ >>
	  column_expression > [is_matrix] 
	<< if (!is_matrix) {
	        /* Probable memory leak! */
/* 		elevate row expression to get rid of {{ }} */
	  /* #0->setDown(#0->down()->down()); */
		}
	>>
	  RBRACK!

	| nr:UNSIGNED_NUMBER /* << mytoken($nr)->convertFloat(); >> */
	| FALS/*E*/
	| TRU/*E*/
	| (name_path_function_arguments)? name_path_function_arguments
/* 	| new_component_reference */
	| (member_list)?
	| name_path
	| TIME
	| STRING
	;

name_path_function_arguments ! : << Attrib a = $[FUNCALL,"---"]; >>
	n:name_path f:function_arguments
	<< #0=#(#[&a],#n,#f); >>
	;

name_path :
	IDENT^ { dot:"."^ name_path }
	;

new_component_reference :
	a:array_op
	{ dot:"."^ << /* #dot->setTranslation("`"); */ >>  new_component_reference }
	;

member_list:
	comp_ref { dot:"."^ << /* #dot->setTranslation("Member"); #dot->setOpType(OP_FUNCTION); */ >> 
	( (member_list)? | name_path ) }
	;

comp_ref:
	name_path b:LBRACK^ << /* #b->setOpType(OP_ARRAYRANGE); */ >> subscript_list RBRACK!
	;

array_op :
	i:IDENT 
	{ brak:LBRACK^ subscript_list RBRACK! << /* #brak->setOpType(OP_ARRAYRANGE); */ >> }
	;

component_reference ! :
	i:IDENT { a:array_decl } { dot:"." c:component_reference }
	;

/* not in document's grammar */
column_expression > [bool is_matrix] :
	<< $is_matrix=false; >>
	row_expression ( ";"! row_expression << $is_matrix=true; >> )*
	;

row_expression :
	expression 
	( ","! expression 
	)*
        /* create token with translation {, balancer }, type BALANCED */
	<< /* #0=#(#[EXTRA_TOKEN,"{",OP_BALANCED,'}'],#0); */ >>
	;

function_arguments :
	p:LPAR^ expression ( ","! expression )* RPAR! 
	<< /* #p->setOpType(OP_FUNCTION); 
	      #p->setTranslation(""); */ /* don't output ( */
	>>
	;

comment : 
        /* several strings in a row is really one string continued on
	   several lines. */
	( s:STRING! )*
        /* Why is this syntactic predicate necessary?? */
	{ (annotation)? annotation! }
	;

annotation :
	ANNOTATION class_specialization
	;
