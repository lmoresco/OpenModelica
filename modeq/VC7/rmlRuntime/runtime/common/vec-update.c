/* vec-setnth.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__vector_5fupdate)
{
	rml_uint_t nelts = 0;
	void *vec = rmlA0;
	void *data;
	rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
	nelts = RML_HDRSLOTS(RML_GETHDR(vec));
	if( i-1 >= nelts ) 
	{
		RML_TAILCALLK(rmlFC);
	} 
	else 
	{
		/* first copy the old vector */
		struct rml_struct *vec_new = (struct rml_struct*)rml_prim_alloc(1+nelts, 3);
		void **vecp = vec_new->data;
		rml_uint_t idx = 0;
		/* re-read after alloc, it may have been moved */
		vec = rmlA0;
		vec_new->header = RML_STRUCTHDR(nelts, 0);
		rmlA0 = RML_TAGPTR(vec_new);
		for(idx=0; idx < nelts; idx++)
			*vecp++ = RML_STRUCTDATA(vec)[idx];
		RML_STRUCTDATA(vec_new)[i-1] = rmlA2;
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
