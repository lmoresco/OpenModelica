/* misc_print.c */
#include <stdio.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__print)
{
    void *str = rmlA0;
    fwrite(RML_STRINGDATA(str), RML_HDRSTRLEN(RML_GETHDR(str)), 1, stdout);
	fflush(stdout);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL



void rmldb_var_print(void *p)
{
	/* rmldb_sprintf("[%p]", p); */
	if (!p) { rmldb_sprintf ("NIL"); fflush(stdout); return; }
	if( RML_ISIMM(p) ) 
	{
		rmldb_sprintf ("%d", RML_UNTAGFIXNUM(p));    
	} 
	else 
	{
		rml_uint_t phdr = RML_GETHDR(p);            
		if( phdr == RML_REALHDR ) 
		{
			rmldb_sprintf ("%f", rml_prim_get_real(p));
			fflush(stdout);
		} else 
			if( RML_HDRISSTRING(phdr) ) 
			{
				rmldb_sprintf ("\"%s\"", RML_STRINGDATA(p));
				fflush(stdout);
				/* use if neccesarry RML_HDRSTRLEN(phdr) */
			} else 
				if( RML_HDRISSTRUCT(phdr) ) 
				{
					rml_uint_t slots = RML_HDRSLOTS(phdr);
					rml_uint_t constr = RML_HDRCTOR(phdr);
					void **pp = NULL;
					if (slots == 0)
					{
						rmldb_sprintf ("{S(%d)[%d]=NIL}", constr, slots);
						fflush(stdout);
						return;
					}
					
					rmldb_sprintf ("S(%d)[%d](", constr, slots);

					pp = RML_STRUCTDATA(p);
					fflush(stdout);
					// function definition
					if ((constr == 64 || constr==13) &&
						slots > 1000000) return;
					if( slots != 0 )
					{
						// rmldb_sprintf ("\n\t"); 
						while( --slots > 0 )
						{
							rmldb_var_print(*pp++);
							rmldb_sprintf (",");
							fflush(stdout);
						}
						p = *pp; 
						rmldb_var_print(*pp); rmldb_sprintf (")"); fflush(stdout);
						// goto tail_recur_debug;  
					}					    
				} 
				else 
				{
					rmldb_sprintf ("UNKNOWN"); fflush(stdout);
				}
	}
}
