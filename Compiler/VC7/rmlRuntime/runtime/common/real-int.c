/* real_int.c */
#include <math.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fint)
{
    double d0 = floor(rml_prim_get_real(rmlA0));
    rml_sint_t i0 = RML_TAGFIXNUM((rml_sint_t)d0);
    if( (double)RML_UNTAGFIXNUM(i0) == d0 ) {
	rmlA0 = RML_IMMEDIATE(i0);
	RML_TAILCALLK(rmlSC);
    } else
	RML_TAILCALLK(rmlFC);
}
RML_END_LABEL
