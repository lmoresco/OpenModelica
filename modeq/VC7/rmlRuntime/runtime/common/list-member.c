/* list_member.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__list_5fmember)
{
    void *x = rmlA0;
    void *ys = rmlA1;
    void *result = RML_FALSE;
    for(; RML_GETHDR(ys) == RML_CONSHDR; ys = RML_CDR(ys)) {
	if( rml_prim_equal(x, RML_CAR(ys)) != RML_FALSE ) {
	    result = RML_TRUE;
	    break;
	}
    }
    rmlA0 = result;
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
