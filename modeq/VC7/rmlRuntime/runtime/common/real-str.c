/* real_str.c */
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__real_5fstring)
{
	int expo;
	int count;
	int i;

    char buf[32], *q;
    struct rml_string *str;

    /* The reason for this code is that no printf f.p. conversion
     * modifier does exactly what we want:
     * %f doesn't generate exponents for large-magnitude numbers
     * %e generates exponents even for small-magnitude numbers
     * %g does use exponents when necessary, but also omits zero fractions
     * %#g emits zero fractions, but also emits excessive trailing zeros
     *
     * As a workaround, use %g but scan the output and append ".0" if no
     * fraction or exponent was emitted.
     */
    sprintf(buf, "%.15g", rml_prim_get_real(rmlA0));
	expo = 0;
	count = 0;
	for(q = buf; ;) {	/* make sure it doesn't look like an int */
	char c = *q++;
	if( isdigit(c) ) {
		if (expo) count++;
	    continue;
	}

	if( c == '\0' && ! expo) {	/* looks like int -- append ".0" */
	    q[-1] = '.';
	    q[0] = '0';
	    q[1] = '\0';
	    break;
	}

	if( c == '-' )
	    continue;

	if( c == 'e' ) {
		expo = 1;
		continue;
	}

	/* This makes sure that the 1.0e-005 is rewritten to 1.0e-05 like in 
	   the cygwin version so that the testsuite works */ 
	if (expo && count >= 3 && q[-1-count] == '0') {
		for(i=count; i>0; i--) {
			q[-1-i] = q[-i];
		}
	}

	/* If we get here we found
	 * '.', indicating a fraction (ok),
	 * or something else, probably indicating nan or inf (bad).
	 * In either case, leave the string as-is.
	 */

	break;
    }


    str = rml_prim_mkstring(strlen(buf), 0);
    strcpy(str->data, buf);	/* this also sets the ending '\0' */
    rmlA0 = RML_TAGPTR(str);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
