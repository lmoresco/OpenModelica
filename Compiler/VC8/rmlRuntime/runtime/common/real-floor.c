/* real_floor.c */
#include <math.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5ffloor)
{
    rmlA0 = rml_prim_mkreal(floor(rml_prim_get_real(rmlA0)));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
