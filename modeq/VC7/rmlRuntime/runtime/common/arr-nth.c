/* arr-nth.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__array_5fnth)
{
    void *vec = rmlA0;
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
    if( i >= RML_HDRSLOTS(RML_GETHDR(vec)) ) {
	RML_TAILCALLK(rmlFC);
    } else {
	rmlA0 = RML_STRUCTDATA(vec)[i];
	RML_TAILCALLK(rmlSC);
    }
}
RML_END_LABEL
