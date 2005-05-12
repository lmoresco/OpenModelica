/* real_eq.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5feq)
{
    double d0 = rml_prim_get_real(rmlA0);
    double d1 = rml_prim_get_real(rmlA1);
    rmlA0 = (d0 == d1) ? RML_TRUE : RML_FALSE;
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
