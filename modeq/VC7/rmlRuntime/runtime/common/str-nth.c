/* str_nth.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__string_5fnth)
{
    void *str = rmlA0;
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
    if( i >= RML_HDRSTRLEN(RML_GETHDR(str)) ) {
	RML_TAILCALLK(rmlFC);
    } else {
	rml_uint_t ch = ((unsigned char*)RML_STRINGDATA(str))[i];
	rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM(ch));
	RML_TAILCALLK(rmlSC);
    }
}
RML_END_LABEL
