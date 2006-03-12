/* real_atan.c */
#include <math.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fatan)
{
    rmlA0 = rml_prim_mkreal(atan(rml_prim_get_real(rmlA0)));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
