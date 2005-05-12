/* real_neg.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fneg)
{
    rmlA0 = rml_prim_mkreal(-rml_prim_get_real(rmlA0));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
