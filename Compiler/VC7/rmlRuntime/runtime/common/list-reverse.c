/* list_reverse.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__list_5freverse)
{
    void *a1;		/* cached A1 */
    struct rml_struct *cons;

    /* A1 := A0; A0 := NIL */
    a1 = rmlA0;
    rmlA0 = RML_TAGPTR(&rml_prim_nil);

    /* while CONSP(A1) do A0 := CONS(CAR(A1), A0); A1 := CDR(A1) end */
    while( RML_GETHDR(a1) == RML_CONSHDR ) {
	rmlA1 = a1;
	cons = (struct rml_struct*)rml_prim_alloc(3, 2);
	a1 = rmlA1;
	cons->header = RML_CONSHDR;
	cons->data[0] = RML_CAR(a1);
	cons->data[1] = rmlA0;
	rmlA0 = RML_TAGPTR(cons);
	a1 = RML_CDR(a1);
    }

    /* return A0 */
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
