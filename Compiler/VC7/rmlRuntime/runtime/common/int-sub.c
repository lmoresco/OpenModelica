/* int_sub.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fsub)
{
    rmlA0 = RML_PRIM_INT_SUB(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
