/* int_ge.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fge)
{
    rmlA0 = RML_PRIM_INT_GE(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
