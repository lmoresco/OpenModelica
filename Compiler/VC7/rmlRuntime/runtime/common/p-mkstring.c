/* p_mkstring.c */
#include <string.h>
#include "rml.h"

struct rml_string *rml_prim_mkstring(rml_uint_t nbytes, rml_uint_t nliveargs)
{
    rml_uint_t header = RML_STRINGHDR(nbytes);
    rml_uint_t nwords = RML_HDRSLOTS(header) + 1;
    struct rml_string *p = (struct rml_string*)rml_prim_alloc(nwords, nliveargs);
    p->header = header;
    return p;
}
