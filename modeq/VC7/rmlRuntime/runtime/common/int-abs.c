/* int_abs.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fabs)
{
    rmlA0 = RML_PRIM_INT_ABS(rmlA0);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
