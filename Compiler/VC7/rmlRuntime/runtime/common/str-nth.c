/* str_nth.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__string_5fnth)
{
    void *str = rmlA0;
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
    if( i >= RML_HDRSTRLEN(RML_GETHDR(str)) ) {
	RML_TAILCALLK(rmlFC);
    } else {
	rml_uint_t ch = ((unsigned char*)RML_STRINGDATA(str))[i];
	rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM(ch));
	RML_TAILCALLK(rmlSC);
    }
}
RML_END_LABEL

RML_BEGIN_LABEL(RML__string_5fnth_5fstring_5fchar)
{
    void *str = rmlA0;
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
    if( i >= RML_HDRSTRLEN(RML_GETHDR(str)) ) {
	RML_TAILCALLK(rmlFC);
    } 
	else 
	{
		struct rml_string *strnew = rml_prim_mkstring(1, 2);
		/* re-read after alloc, it may have been moved */
		unsigned char *snew = (unsigned char*)strnew->data;
		*snew++ = ((unsigned char*)RML_STRINGDATA(rmlA0))[i];
		*snew = '\0';
		rmlA0 = RML_TAGPTR(strnew);
		RML_TAILCALLK(rmlSC);
    }
}
RML_END_LABEL

RML_BEGIN_LABEL(RML__string_5fget)
{
    void *str = rmlA0;
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
    if( i-1 >= RML_HDRSTRLEN(RML_GETHDR(str)) ) {
	RML_TAILCALLK(rmlFC);
    } else {
	rml_uint_t ch = ((unsigned char*)RML_STRINGDATA(str))[i-1];
	rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM(ch));
	RML_TAILCALLK(rmlSC);
    }
}
RML_END_LABEL

RML_BEGIN_LABEL(RML__string_5fget_5fstring_5fchar)
{
    void *str = rmlA0;
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1);
    if( i-1 >= RML_HDRSTRLEN(RML_GETHDR(str)) ) {
	RML_TAILCALLK(rmlFC);
    } 
	else 
	{
		struct rml_string *strnew = rml_prim_mkstring(1, 2);
		/* re-read after alloc, it may have been moved */
		unsigned char *snew = (unsigned char*)strnew->data;
		*snew++ = ((unsigned char*)RML_STRINGDATA(rmlA0))[i-1];
		*snew = '\0';
		rmlA0 = RML_TAGPTR(strnew);
		RML_TAILCALLK(rmlSC);
    }
}
RML_END_LABEL
