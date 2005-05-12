/* misc_tick.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__tick)
{
    static rml_sint_t counter;
    rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM(counter));
    ++counter;
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
