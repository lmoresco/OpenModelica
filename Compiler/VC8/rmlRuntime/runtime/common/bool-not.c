/* bool_not.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__bool_5fnot)
{
    rmlA0 = RML_PRIM_BOOL_NOT(rmlA0);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
