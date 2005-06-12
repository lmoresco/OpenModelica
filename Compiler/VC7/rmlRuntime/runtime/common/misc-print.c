/* misc_print.c */
#include <stdio.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__print)
{
    void *str = rmlA0;
    fwrite(RML_STRINGDATA(str), RML_HDRSTRLEN(RML_GETHDR(str)), 1, stdout);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL

RML_BEGIN_LABEL(RML__debug_5fprint)
{
	void *str = rmlA0;
	/*if (execution_type == RMLDB_STEP || rmldb_show == RMLDB_SHOW)*/
	{
		printf ("%s=[", RML_STRINGDATA(str));
		rmldb_var_print(rmlA1);
		printf ("]\n");
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL

void rmldb_var_print(void *p)
{
	/* printf("[%p]", p); */
	if (!p) { printf ("NIL"); fflush(stdout); return; }
	if( RML_ISIMM(p) ) 
	{
		printf ("%d", RML_UNTAGFIXNUM(p));    
	} 
	else 
	{
		rml_uint_t phdr = RML_GETHDR(p);            
		if( phdr == RML_REALHDR ) 
		{
			printf ("%f", rml_prim_get_real(p));
			fflush(stdout);
		} else 
			if( RML_HDRISSTRING(phdr) ) 
			{
				printf ("\"%s\"", RML_STRINGDATA(p));
				fflush(stdout);
				/* use if neccesarry RML_HDRSTRLEN(phdr) */
			} else 
				if( RML_HDRISSTRUCT(phdr) ) 
				{
					void **pp = RML_STRUCTDATA(p);

					rml_uint_t slots = RML_HDRSLOTS(phdr);
					rml_uint_t constr = RML_HDRCTOR(phdr);
					rml_uint_t sl = slots;
					if (slots == 0)
					{
						printf ("{S(%d)[%d]=NIL}", constr, slots);
						fflush(stdout);
						return;
					}
					
					printf ("S(%d)[%d](", constr, slots);

					fflush(stdout);
					// function definition
					if ((constr == 64 || constr==13) &&
						slots > 1000000) return;
					if( slots != 0 )
					{
						// printf ("\n\t"); 
						while( --slots > 0 )
						{
							printf("%d=", sl-slots); 
							rmldb_var_print(*pp++);
							printf (",");
							fflush(stdout);
						}
						p = *pp; 
						rmldb_var_print(*pp); printf (")"); fflush(stdout);
						// goto tail_recur_debug;  
					}					    
				} 
				else 
				{
					printf ("UNKNOWN"); fflush(stdout);
				}
	}
}
