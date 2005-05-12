/* p_get_real.c */
#include "rml.h"

#ifdef	RML_DBL_STRICT
double rml_prim_get_real(void *p)
{
    union rml_double_as_words u;
    u.data[0] = RML_REALDATA(p)[0];
    u.data[1] = RML_REALDATA(p)[1];
    return u.d;
}
#endif	/* RML_DBL_STRICT */
