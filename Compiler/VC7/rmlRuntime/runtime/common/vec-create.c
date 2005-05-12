/* vec-reserve.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__vector_5fcreate)
{
    /* then allocate and initialize the vector */
	rml_uint_t nelts = 0;
	nelts = RML_UNTAGFIXNUM(rmlA0);
    {
		struct rml_struct *vec = (struct rml_struct*)rml_prim_alloc(1+nelts, 2);
		void **vecp = vec->data;
		vec->header = RML_STRUCTHDR(nelts, 0);
		rmlA0 = RML_TAGPTR(vec);
		for(; nelts > 0; --nelts)
			*vecp++ = rmlA1;
    }
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
