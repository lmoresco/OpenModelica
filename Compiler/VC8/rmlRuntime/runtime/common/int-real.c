/* int_real.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5freal)
{
    rmlA0 = rml_prim_mkreal((double)RML_UNTAGFIXNUM(rmlA0));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
