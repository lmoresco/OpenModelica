/* check.c */
#if defined(DEBUG)
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include "check.h"

void check(const struct check checks[])
{
    size_t i;
    for(i = 0; checks[i].exp1 != 0; ++i) {
	if( checks[i].val1 != checks[i].val2 ) {
	    fprintf(stderr, "%s == %lu != %s == %lu\n",
		    checks[i].exp1, checks[i].val1, checks[i].exp2, checks[i].val2);
	    exit(1);
	}
    }
}
#endif
