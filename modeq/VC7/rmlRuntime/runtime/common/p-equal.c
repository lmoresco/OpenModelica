/*
 * p_equal.c -- implements polymorphic equality for RML
 * (This is the reason why reference nodes must still be distinguishable
 * from all other values.)
 */
#include <string.h>
#include "rml.h"

void *rml_prim_equal(void *p, void *q)
{
  tail_recur:
    /* INV: ISIMM(p) <==> ISIMM(q) */
    if( p == q ) {
	/* Identical objects are always equal. */
	return RML_TRUE;
    } else if( RML_ISIMM(p) ) {
	/* Different immediate values. */
	return RML_FALSE;
    } else {
	/* Non-identical boxed values. */
	rml_uint_t phdr = RML_GETHDR(p);
	rml_uint_t qhdr = RML_GETHDR(q);

	if( phdr == qhdr ) {
	    if( phdr == RML_REALHDR ) {
		return (rml_prim_get_real(p) == rml_prim_get_real(q))
		    ? RML_TRUE
		    : RML_FALSE;
	    } else if( RML_HDRISSTRING(phdr) ) {
		if( !memcmp(RML_STRINGDATA(p), RML_STRINGDATA(q), RML_HDRSTRLEN(phdr)) )
		    return RML_TRUE;
		else
		    return RML_FALSE;
	    } else if( RML_HDRISSTRUCT(phdr) ) {
		rml_uint_t slots = RML_HDRSLOTS(phdr);
		void **pp = RML_STRUCTDATA(p);
		void **qq = RML_STRUCTDATA(q);
		if( slots == 0 )
		    return RML_TRUE;
		while( --slots > 0 )
		    if( rml_prim_equal(*pp++, *qq++) == RML_FALSE )
			return RML_FALSE;
		p = *pp;
		q = *qq;
		goto tail_recur;
	    } else {
		/* Non-identical reference nodes. */
		return RML_FALSE;
	    }
	} else {
	    /* Different sized strings, different constructors of some datatype,
	     * or reference nodes with different instantiation states.
	     */
	    return RML_FALSE;
	}
    }
}
