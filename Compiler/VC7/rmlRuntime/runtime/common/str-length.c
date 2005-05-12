/* str_length.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__string_5flength)
{
    rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM(RML_HDRSTRLEN(RML_GETHDR(rmlA0))));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
