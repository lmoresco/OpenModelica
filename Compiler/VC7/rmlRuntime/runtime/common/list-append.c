/* list_append.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__list_5fappend)
{
    rml_uint_t nelts;
    void *lst;

    /* count the number of elements in the first list */
    lst = rmlA0;
    nelts = 0;
    while( RML_GETHDR(lst) == RML_CONSHDR ) {
	lst = RML_CDR(lst);
	++nelts;
    }

    /* cons up fresh copy of first list, tack on second list last */
    if( nelts == 0 )
	rmlA0 = rmlA1;
    else {
	void **chunk = (void**)rml_prim_alloc(3*nelts, 2);
	lst = rmlA0;
	rmlA0 = RML_TAGPTR(chunk);
	do {
	    chunk[0] = RML_IMMEDIATE(RML_CONSHDR);
	    chunk[1] = RML_CAR(lst);
	    chunk[2] = RML_TAGPTR(chunk + 3);
	    lst = RML_CDR(lst);
	    chunk += 3;
	} while( --nelts != 0 );
	/* set the CDR of the last copied CONS to the second list */
	chunk[-1] = rmlA1;
    }

    /* return resulting list */
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
