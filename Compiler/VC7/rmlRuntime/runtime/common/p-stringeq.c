/* p_stringeq.c */
#include <string.h>
#include "rml.h"

rml_sint_t rml_prim_stringeq(void *p, rml_uint_t qhdr, const char *q)
{
    return RML_GETHDR(p) == qhdr && !memcmp(RML_STRINGDATA(p), q, RML_HDRSTRLEN(qhdr));
}
