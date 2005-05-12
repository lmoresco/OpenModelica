/* p_mkreal.c */
#include "rml.h"

void *rml_prim_mkreal(double d)
{
    rml_uint_t nwords = RML_SIZE_DBL/RML_SIZE_INT + 1;
    struct rml_real *p = (struct rml_real*)rml_prim_alloc(nwords, 0);
    rml_prim_set_real(p, d);
    p->header = RML_REALHDR;
    return RML_TAGPTR(p);
}
