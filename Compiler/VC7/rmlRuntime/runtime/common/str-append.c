/* str_append.c */
#include <string.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__string_5fappend)
{
    rml_uint_t len0 = RML_HDRSTRLEN(RML_GETHDR(rmlA0));
    rml_uint_t len1 = RML_HDRSTRLEN(RML_GETHDR(rmlA1));
    struct rml_string *str = rml_prim_mkstring(len0 + len1, 2);
    (void)memcpy(&str->data[0], RML_STRINGDATA(rmlA0), len0);
    (void)memcpy(&str->data[len0], RML_STRINGDATA(rmlA1),
		 len1+1);	/* +1 to copy terminating '\0' */
    rmlA0 = RML_TAGPTR(str);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
