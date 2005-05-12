/* bool_and.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__bool_5fand)
{
    rmlA0 = RML_PRIM_BOOL_AND(rmlA0, rmlA1);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
