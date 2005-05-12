/* real_pow.c */
#include <math.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fpow)
{
    double d0 = rml_prim_get_real(rmlA0);
    double d1 = rml_prim_get_real(rmlA1);
    rmlA0 = rml_prim_mkreal(pow(d0, d1));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
