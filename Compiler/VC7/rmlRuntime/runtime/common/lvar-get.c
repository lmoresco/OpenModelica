/* lvar_get.c */
#include "rml.h"

#define RML_NONEHDR	RML_STRUCTHDR(0,0)
#define RML_SOMEHDR	RML_STRUCTHDR(1,1)

static const struct rml_header rml_prim_none = { RML_NONEHDR };

RML_BEGIN_LABEL(RML__lvar_5fget)
{
    if( RML_GETHDR(rmlA0) == RML_BOUNDHDR ) {
	struct rml_struct *option = (struct rml_struct*)rml_prim_alloc(2, 1);
	option->header = RML_SOMEHDR;
	option->data[0] = RML_REFDATA(rmlA0);
	rmlA0 = RML_TAGPTR(option);
    } else
	rmlA0 = RML_TAGPTR(&rml_prim_none);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
