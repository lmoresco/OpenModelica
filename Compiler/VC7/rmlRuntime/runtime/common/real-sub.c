/* real_sub.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fsub)
{
    double d0 = rml_prim_get_real(rmlA0);
    double d1 = rml_prim_get_real(rmlA1);
    rmlA0 = rml_prim_mkreal(d0 - d1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
