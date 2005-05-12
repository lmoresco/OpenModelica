/* int_gt.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fgt)
{
    rmlA0 = RML_PRIM_INT_GT(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
