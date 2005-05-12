/* lvar_new.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__lvar_5fnew)
{
    struct rml_ref *lvar = (struct rml_ref*)rml_prim_alloc(2, 0);
    lvar->header = RML_UNBOUNDHDR;
    /* lvar->data need not be initialized */
    rmlA0 = RML_TAGPTR(lvar);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
