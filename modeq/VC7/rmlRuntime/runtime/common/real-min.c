/* real_min.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fmin)
{
    if( rml_prim_get_real(rmlA1) < rml_prim_get_real(rmlA0) )
	rmlA0 = rmlA1;
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
