/* p_motor.c */
#include <stdio.h>
#include "rml.h"

/*
 * Run labels "for ever".
 */
void rml_prim_motor(rml_labptr_t f)
{
#if	defined(RML_STATE_APTR) || defined(RML_STATE_LPTR)
    struct rml_state *rmlState = &rml_state;
#endif	/*RML_STATE_APTR || RML_STATE_LPTR*/
    if( rml_flag_no_stack_check ) {	/* run a simple and fast motor */
	for(;;)
	    f = RML_APPLY(f);
    } else {			/* run a careful and logging motor */
#ifdef	RML_MORE_LOGGING
	const char *previous_module = (const char*)0;
	unsigned char previous_known = 0;
#endif	/*RML_MORE_LOGGING*/
	for(;;) {
	    if( (void**)rmlSP < rmlSPMIN )
		rmlSPMIN = (void**)rmlSP;
	    /*
	     * Add a small buffer zone at the stack bottom, to reduce
	     * the risk of writes outside the stack bounds.
	     */
	    if( (void**)rmlSP < &rml_stack[32] ) {
		fprintf(stderr, "Stack overflow!\n");
		rml_exit(1);
	    }
	    f = RML_APPLY(f);
	    ++rml_call_count;
#ifdef	RML_MORE_LOGGING
	    if( previous_module == rml_latest_module ) {
		++rml_intra_calls;
		if( previous_known )
		    ++rml_intra_known_calls;
	    } else {
		++rml_inter_calls;
		if( previous_known )
		    ++rml_inter_known_calls;
	    }
	    previous_module = rml_latest_module;
	    previous_known = rml_latest_known;
#endif	/*RML_MORE_LOGGING*/
	}
    }
    /*NOTREACHED*/
}
