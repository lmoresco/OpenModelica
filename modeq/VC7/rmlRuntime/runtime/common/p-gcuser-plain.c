/* p_gcuser.c
 * mutator interface to the collector
 */
#include <stdio.h>
#include "rml.h"
#include "z-ysize.h"
#include "p-gccore.h"

void *rml_prim_gcalloc(rml_uint_t nwords, rml_uint_t nargs)
{
    void **p;
    rml_minor_collection(nargs);
    if( nwords > rml_young_size ) /* RML_YOUNG_SIZE ) */ 
	{
	  if( (p = rml_older_alloc(nwords, nargs)) != 0 ) 
	  {
	    rml_state_young_next = rml_young_region;
	    return (void*)p;
	  }
	  fprintf(stderr, "rml_prim_gcalloc failed to get %lu words\n",
		(unsigned long)nwords);
	  rml_exit(1);
    }
    p = rml_young_region;
    rml_state_young_next = p + nwords;
    return (void*)p;
}

void *rml_prim_alloc(rml_uint_t nwords, rml_uint_t nargs)
{
#if	defined(RML_STATE_APTR) || defined(RML_STATE_LPTR)
    struct rml_state *rmlState = &rml_state;
#endif	/*RML_STATE_APTR || RML_STATE_LPTR*/
    void **p = rml_young_next;
    if( (rml_young_next = p + nwords) >= rml_young_limit )
	p = rml_prim_gcalloc(nwords, nargs);
    return p;
}
