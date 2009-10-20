/* file main.c */
/* Main program for the small assignment evaluator */
#include <stdio.h>
#include "rml.h"
#include "Assignment.h"

extern void* absyntree;

RML_DEFINE_MODULE("Main")
RML_FORWARD_LABEL(Main__main);

void Main_5finit(void)
{
	static int done = 0;
	if( done ) return;
	done = 1;
	RML_5finit();
	Assignment_5finit();
}

RML_BEGIN_LABEL(Main__main)
{
  int res;
  void* rememberSC = rmlSC;
  void* rememberFC = rmlFC;
  
  /* Initialize the RML modules */
  printf("[Init]\n");

  /* Parse the input into an abstract syntax tree (in RML form)
     using yacc and lex */

  printf("[Parse. Enter an expression, then press CTRL+z (Windows) or CTRL+d (Linux).]\n");
  fflush(stdout);
  
  if (yyparse() !=0)
  {
    fprintf(stderr,"Parsing failed!\n");
    exit(1);
  }

  /* Evalute it using the RML relation "eval" */

  printf("[Eval]\n");
  rmlA0 = absyntree;
  if (!rml_prim_once(RML_LABPTR(Assignment__evalprogram)) )
  {
    fprintf(stderr,"Evaluation failed!\n");
    RML_TAILCALLK(rememberFC);
  }
  
  res=RML_UNTAGFIXNUM(rmlA0);
  printf("Result: %d\n", res);
  RML_TAILCALLK(rememberSC);
}
RML_END_LABEL

