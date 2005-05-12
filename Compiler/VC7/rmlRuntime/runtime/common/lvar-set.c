/* lvar_set.c */
#include <stdio.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__lvar_5fset)
{
    void *lvar = rmlA0;
    if( RML_GETHDR(lvar) == RML_UNBOUNDHDR ) {
	RML_GETHDR(lvar) = RML_BOUNDHDR;
	RML_REFDATA(lvar) = rmlA1;
	if( rmlTP == &rml_trail[0] ) {
	    (void)fprintf(stderr, "Trail overflow!\n");
	    rml_exit(1);
	}
	*--rmlTP = lvar;
	RML_TAILCALLK(rmlSC);
    } else
	RML_TAILCALLK(rmlFC);
}
RML_END_LABEL
