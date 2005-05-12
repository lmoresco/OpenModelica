/* int_mul.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fmul)
{
    rmlA0 = RML_PRIM_INT_MUL(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
