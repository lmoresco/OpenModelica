/* list_vec.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__list_5fvector)
{
    rml_uint_t nelts = 0;

    /* first compute the length of the list */
    {
	void *lst = rmlA0;
	for(; RML_GETHDR(lst) == RML_CONSHDR; ++nelts, lst = RML_CDR(lst))
	    ;
    }
    /* then allocate and initialize the vector */
    {
	struct rml_struct *vec = (struct rml_struct*)rml_prim_alloc(1+nelts, 1);
	void *lst = rmlA0;
	void **vecp = vec->data;
	vec->header = RML_STRUCTHDR(nelts, 0);
	rmlA0 = RML_TAGPTR(vec);
	for(; nelts > 0; --nelts, lst = RML_CDR(lst))
	    *vecp++ = RML_CAR(lst);
    }
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
