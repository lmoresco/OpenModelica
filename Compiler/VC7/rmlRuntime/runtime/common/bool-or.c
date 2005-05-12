/* bool_or.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__bool_5for)
{
    rmlA0 = RML_PRIM_BOOL_OR(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
