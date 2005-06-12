/* arr-setnth.c */
#include "rml.h"
#include <stdio.h>

RML_BEGIN_LABEL(RML__array_5fupdate)
{
	rml_uint_t nelts = 0;
	void *arr = rmlA0;
	void *data;
	rml_uint_t idx = 0;
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
			/* also check here if the array AND the element is in the young generation */
			/*
			printf("\n%p < %p < %p < %p\n", rml_young_region, RML_UNTAGPTR(rmlA0), RML_UNTAGPTR(rmlA2), rml_young_limit); 
			*/
			/* check if are both in young 
			if((unsigned long)RML_UNTAGPTR(rmlA0) - (unsigned long)(void*)(rml_young_region) >= 0 &&
			   (unsigned long)(void*)(rml_young_limit) - (unsigned long)RML_UNTAGPTR(rmlA0) > 0 && 
			   RML_UNTAGPTR(rmlA2) - (void*)(rml_young_region) >= 0 &&
			   (void*)(rml_young_limit) - RML_UNTAGPTR(rmlA2) > 0)
			{
				printf("Both in young!"); 
				rmlA0 = arr;
				RML_TAILCALLK(rmlSC);
			}
			*/
			/* also check here if the array is not alreay in the trail */
			for (idx = rml_array_trail_size; &rml_array_trail[idx] >= rmlATP; idx--)
			if (rml_array_trail[idx] == rmlA0) /* if found, do not add again */
			{
			  rmlA0 = arr;
			  RML_TAILCALLK(rmlSC);
			}
		    /* add the address of the array into the roots to be
			taken into consideration at the garbage collection time */
			if( rmlATP == &rml_array_trail[0] ) 
			{
				(void)fprintf(stderr, "Array Trail Overflow!\n");
				rml_exit(1);
			}
			*--rmlATP = rmlA0;
		}
		rmlA0 = arr;
		RML_TAILCALLK(rmlSC);
	}

}
RML_END_LABEL
