/* arr-list.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__array_5flist)
{
    /* Allocate a big blob for all the conses, i.e. 3 * #conses words,
     * and then initialize it.
     */
    rml_uint_t nelts = RML_HDRSLOTS(RML_GETHDR(rmlA0));
    void **consp = (void**)rml_prim_alloc(3*nelts, 1);
    void **vecp = RML_STRUCTDATA(rmlA0) + nelts;
    void *a0 = RML_TAGPTR(&rml_prim_nil);
    /* XXX: we should build the list in address order */
    for(; nelts > 0; a0 = RML_TAGPTR(consp), consp += 3, --nelts) {
	consp[0] = RML_IMMEDIATE(RML_CONSHDR);
	consp[1] = *--vecp;
	consp[2] = a0;
    }
    rmlA0 = a0;
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
