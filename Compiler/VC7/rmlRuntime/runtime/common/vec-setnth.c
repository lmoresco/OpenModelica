/* vec-setnth.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__vector_5fsetnth)
{
	rml_uint_t nelts = 0;
	void *vec = rmlA0;
	rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
	nelts = RML_HDRSLOTS(RML_GETHDR(vec));
	/* printf("setting element %d of the vector with %d elements\n", i, nelts); */
	if( i >= nelts) 
	{
		/* printf("element %d OUTSIDE the vector bounds\n", i); */
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
		/* 
		printf("vector copied, now setting element:");
		printf ("%d=[", i);
		rmldb_var_print(rmlA2);
		printf ("]\n");
		*/
		RML_STRUCTDATA(rmlA0)[i] = rmlA2;
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
