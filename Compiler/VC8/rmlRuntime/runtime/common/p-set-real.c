/* p_set_real.c */
#include "rml.h"

#ifdef	RML_DBL_STRICT
void rml_prim_set_real(struct rml_real *p, double d)
{
    union rml_double_as_words u;
    u.d = d;
    p->data[0] = u.data[0];
    p->data[1] = u.data[1];
}
#endif	/* RML_DBL_STRICT */
