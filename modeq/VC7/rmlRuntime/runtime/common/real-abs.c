/* real_abs.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fabs)
{
    double d = rml_prim_get_real(rmlA0);
    if( d < 0.0 )
	rmlA0 = rml_prim_mkreal(-d);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
