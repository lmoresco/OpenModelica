/* p-init.c
 * initialization routines invoked by compiled RML code
 */
#include <stdio.h>
#include <stdlib.h>	/* abort() */
#include "rml.h"

extern void rml_gcinit(void);

void RML_5finit(void)
{
    static int init_done = 0;
    if( !init_done ) {
	rml_gcinit();
	init_done = 1;
    }
}

void rml_gval_init(struct rml_gval *first)
{
    struct rml_gval *prev = 0, *here = first;

    /*
     * Follow the "next" chain until we find an initialized node or a cycle.
     */
    for(;;) {
	struct rml_gval *next = here->next;
	if( next == 0 )		/* is here initialized? */
	    break;
	if( next == here ) {	/* is here busy? (here->next == next) */
	    fprintf(stderr, "Initialization error: global value dependency cycle detected:\n");
	    fprintf(stderr, "%s", here->name);
	    while( prev ) {
		fprintf(stderr, " <-- %s", prev->name);
		if( prev == here )
		    break;
		prev = prev->u.prev;
	    }
	    fprintf(stderr, "\n");
	    exit(1);
	}
	/* here is neither initialized nor busy */
	here->u.prev = prev;
	prev = here;
	here = next;
	prev->next = prev;
    }

    /*
     * "here" is an initialized node.
     * Copy "here"'s value to every node in the "prev" chain.
     */
    {
	void *value = here->u.value;

	while( prev ) {
	    here = prev;
	    prev = prev->u.prev;
	    here->u.value = value;
	    here->next = 0;
	}
    }
}
