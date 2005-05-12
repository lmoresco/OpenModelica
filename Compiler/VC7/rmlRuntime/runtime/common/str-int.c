/* str-int.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__string_5fint)
{
    const struct rml_string *str = (const struct rml_string*)RML_UNTAGPTR(rmlA0);
    rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM(rml_prim_atoi(str)));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
