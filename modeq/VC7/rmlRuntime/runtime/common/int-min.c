/* int_min.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fmin)
{
    rmlA0 = RML_PRIM_INT_MIN(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
