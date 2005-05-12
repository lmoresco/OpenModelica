/* int_ne.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fne)
{
    rmlA0 = RML_PRIM_INT_NE(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
