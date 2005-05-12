/* list_length.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__list_5flength)
{
    void *lst = rmlA0;
    rml_uint_t len = 0;
    for(; RML_GETHDR(lst) == RML_CONSHDR; ++len, lst = RML_CDR(lst))
	;
    rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM(len));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
