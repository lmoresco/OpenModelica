/* real_sqrt.c */
#include <math.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fsqrt)
{
    double d0 = rml_prim_get_real(rmlA0);
    if( d0 >= 0.0 ) {
	rmlA0 = rml_prim_mkreal(sqrt(d0));
	RML_TAILCALLK(rmlSC);
    } else
	RML_TAILCALLK(rmlFC);
}
RML_END_LABEL
