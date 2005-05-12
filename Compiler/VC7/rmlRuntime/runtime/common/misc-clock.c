/* misc_clock.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__clock)
{
    rmlA0 = rml_prim_mkreal((double)rml_prim_clock() / (double)RML_CLOCKS_PER_SEC);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
