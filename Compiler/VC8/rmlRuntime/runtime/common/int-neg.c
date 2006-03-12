/* int_neg.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fneg)
{
    rmlA0 = RML_PRIM_INT_NEG(rmlA0);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
