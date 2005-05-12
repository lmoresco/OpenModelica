/* real_mod.c */
#include <math.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fmod)
{
    double d0 = rml_prim_get_real(rmlA0);
    double d1 = rml_prim_get_real(rmlA1);
    if( d1 == 0.0 )
	RML_TAILCALLK(rmlFC);
    rmlA0 = rml_prim_mkreal(fmod(d0, d1));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
