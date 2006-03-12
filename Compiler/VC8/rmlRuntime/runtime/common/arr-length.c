/* arr-length.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__array_5flength)
{
    rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM(RML_HDRSLOTS(RML_GETHDR(rmlA0))));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
