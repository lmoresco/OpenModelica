/* vec-add.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__array_5fvector)
{
	rml_uint_t nelts = 0;
	void *vec = rmlA0;
	void *data;
	nelts = RML_HDRSLOTS(RML_GETHDR(vec));
	{
		/* first alocate old_vector.length then copy the old vector */
		struct rml_struct *vec_new = (struct rml_struct*)rml_prim_alloc(1+nelts, 1);
		void **vecp = vec_new->data;
		rml_uint_t i = 0;
		/* re-read after alloc, it may have been moved */
		vec = rmlA0;
		vec_new->header = RML_STRUCTHDR(nelts, 0);
		rmlA0 = RML_TAGPTR(vec_new);
		/* copy the old vector */
		for(i = 0; i < nelts; i++)
			*vecp++ = RML_STRUCTDATA(vec)[i];
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL

RML_BEGIN_LABEL(RML__array_5fcopy)
{
	rml_uint_t nelts = 0;
	void *vec = rmlA0;
	void *data;
	nelts = RML_HDRSLOTS(RML_GETHDR(vec));
	{
		/* first alocate old_vector.length then copy the old vector */
		struct rml_struct *vec_new = (struct rml_struct*)rml_prim_alloc(1+nelts, 1);
		void **vecp = vec_new->data;
		rml_uint_t i = 0;
		/* re-read after alloc, it may have been moved */
		vec = rmlA0;
		vec_new->header = RML_STRUCTHDR(nelts, 0);
		rmlA0 = RML_TAGPTR(vec_new);
		/* copy the old vector */
		for(i = 0; i < nelts; i++)
			*vecp++ = RML_STRUCTDATA(vec)[i];
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
