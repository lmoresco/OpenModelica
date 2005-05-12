/* int_add.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fadd)
{
    rmlA0 = RML_PRIM_INT_ADD(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
