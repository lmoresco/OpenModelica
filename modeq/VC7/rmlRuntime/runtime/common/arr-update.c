/* arr-setnth.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__array_5fupdate)
{
	/*
    void *vec = rmlA0;
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
    if( i >= RML_HDRSLOTS(RML_GETHDR(vec)) ) {
	RML_TAILCALLK(rmlFC);
    } else {
	rmlA0 = RML_STRUCTDATA(vec)[i];
	RML_TAILCALLK(rmlSC);
    }
	*/
	rml_uint_t nelts = 0;
	void *arr = rmlA0;
	void *data;
	rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
	if( i-1 >= RML_HDRSLOTS(RML_GETHDR(arr)) ) 
	{
		RML_TAILCALLK(rmlFC);
	} 
	else 
	{
		/* update the array in place */
		RML_STRUCTDATA(arr)[i-1] = rmlA2;
		/* IF the object updated is not immediate add 
		 * the array address to the roots to be swept for pointers
		 * pointing in the newer generation
		 */
		if (!RML_ISIMM(rmlA2))
		{
			/* also check here if the array is in the young or old generation */
			/*
			char* yn = (char*)rml_young_limit;
			if( (rml_uint_t)(yn - (char*)rmlA0) >= 0 )
				fprintf(stderr, "arrYG/");
			else 
				fprintf(stderr, "arrOG/");
			if( (rml_uint_t)(yn - (char*)rmlA2) >= 0 )
				fprintf(stderr, "elYG\n");
			else 
				fprintf(stderr, "elOG\n");
			*/
		    /* add the address of the array into the roots to be
			taken into consideration at the garbage collection time */
			if( rmlATP == &rml_array_trail[0] ) 
			{
				(void)fprintf(stderr, "Array Trail Overflow!\n");
				rml_exit(1);
			}
			*--rmlATP = rmlA0;
		}
		RML_TAILCALLK(rmlSC);
	}

}
RML_END_LABEL
