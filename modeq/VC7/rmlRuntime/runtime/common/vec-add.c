/* vec-add.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__vector_5fadd)
{
	rml_uint_t nelts = 0;
	void *vec = rmlA0;
	void *data;
	nelts = RML_HDRSLOTS(RML_GETHDR(vec));
	{
		/* first alocate old_vector.length+1 then copy the old vector */
		struct rml_struct *vec_new = (struct rml_struct*)rml_prim_alloc(2+nelts, 1);
		void **vecp = vec_new->data;
		rml_uint_t i = 0;
		vec_new->header = RML_STRUCTHDR(nelts+1, 0);
		rmlA0 = RML_TAGPTR(vec_new);
		/* copy the old vector */
		for(i=0; i < nelts; i++)
			*vecp++ = RML_STRUCTDATA(vec)[i];
		/* set the last */
		*vecp = rmlA1;
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
