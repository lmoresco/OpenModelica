/* list_str.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__list_5fstring)
{
    rml_uint_t len = 0;

    /* first compute the length of the list */
    {
	void *lst = rmlA0;
	for(; RML_GETHDR(lst) == RML_CONSHDR; ++len, lst = RML_CDR(lst))
	    ;
    }
    /* then allocate and initialize the string */
    {
	struct rml_string *str = rml_prim_mkstring(len, 1);	/* gets len+1 bytes */
	void *lst = rmlA0;
	unsigned char *s = (unsigned char*)str->data;
	rmlA0 = RML_TAGPTR(str);
	for(; len > 0; --len, lst = RML_CDR(lst))
	    *s++ = RML_UNTAGFIXNUM(RML_CAR(lst));
	*s = '\0';
    }
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
