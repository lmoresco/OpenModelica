/* int_lt.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5flt)
{
    rmlA0 = RML_PRIM_INT_LT(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
