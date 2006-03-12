/* int_max.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fmax)
{
    rmlA0 = RML_PRIM_INT_MAX(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
