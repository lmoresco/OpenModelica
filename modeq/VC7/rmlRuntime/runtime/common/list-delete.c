/* list_delete.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__list_5fdelete)
{
    rml_sint_t nelts = RML_UNTAGFIXNUM(rmlA1);
    if( nelts < 0 )
	RML_TAILCALLK(rmlFC);
    else if( nelts == 0 ) {
	if( RML_GETHDR(rmlA0) == RML_CONSHDR )
	    rmlA0 = RML_CDR(rmlA0);
	else
	    RML_TAILCALLK(rmlFC);
    } else { /* nelts > 0 */
	void **chunk = (void**)rml_prim_alloc(3*nelts, 1);
	void *lst = rmlA0;
	rmlA0 = RML_TAGPTR(chunk);
	for(;;) {
	    if( RML_GETHDR(lst) == RML_CONSHDR ) {
		if( nelts == 0 ) {
		    chunk[-1] = RML_CDR(lst);
		    break;
		} else {
		    chunk[0] = RML_IMMEDIATE(RML_CONSHDR);
		    chunk[1] = RML_CAR(lst);
		    chunk[2] = RML_TAGPTR(chunk + 3);
		    lst = RML_CDR(lst);
		    chunk += 3;
		    --nelts;
		    continue;
		}
	    } else	/* NIL */
		RML_TAILCALLK(rmlFC);
	}
    }

    /* return resulting list */
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
