/* list_nth.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__list_5fnth)
{
    rml_sint_t i = RML_UNTAGFIXNUM(rmlA1);
    void *lst = rmlA0;
    for(; RML_GETHDR(lst) == RML_CONSHDR; --i, lst = RML_CDR(lst)) {
	if( i == 0 ) {
	    rmlA0 = RML_CAR(lst);
	    RML_TAILCALLK(rmlSC);
	}
    }
    RML_TAILCALLK(rmlFC);
}
RML_END_LABEL

RML_BEGIN_LABEL(RML__list_5fget)
{
    rml_sint_t i = RML_UNTAGFIXNUM(rmlA1);
    void *lst = rmlA0;
	i--; /* list_get starts the index at 1 */
	if (i < 0) RML_TAILCALLK(rmlFC);
    for(; RML_GETHDR(lst) == RML_CONSHDR; --i, lst = RML_CDR(lst)) 
	{
		if ( i == 0 ) 
		{
			rmlA0 = RML_CAR(lst);
			RML_TAILCALLK(rmlSC);
		}
    }
    RML_TAILCALLK(rmlFC);
}
RML_END_LABEL
