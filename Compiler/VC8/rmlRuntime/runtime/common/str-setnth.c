/* str_setnth.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__string_5fsetnth)
{
    void *strold = rmlA0; /* string */
	rml_uint_t len = RML_HDRSTRLEN(RML_GETHDR(rmlA0)); /* string lenght */
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1); /* index */
	rml_uint_t ch = (rml_uint_t)RML_UNTAGFIXNUM(rmlA2); /* char */
    if( i >= RML_HDRSTRLEN(RML_GETHDR(strold)) ) 
	{
		RML_TAILCALLK(rmlFC);
    } 
	else 
	{
		/* first copy the old string */
		struct rml_string *strnew = rml_prim_mkstring(len, 3);
		/* re-read after alloc, it may have been moved */
		strold = rmlA0;
		unsigned char *sold = (unsigned char*)RML_STRINGDATA(strold);
		unsigned char *snew = (unsigned char*)strnew->data;
		rmlA0 = RML_TAGPTR(strnew);
		for(; len > 0; --len)
			*snew++ = *sold++;
		/* update the char */
		*snew = '\0';
		RML_STRINGDATA(rmlA0)[i] = ch;
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL


RML_BEGIN_LABEL(RML__string_5fupdate)
{
    void *strold = rmlA0; /* string */
	rml_uint_t len = RML_HDRSTRLEN(RML_GETHDR(rmlA0)); /* string lenght */
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1); /* index */
	rml_uint_t ch = RML_UNTAGFIXNUM(rmlA2); /* char */
    if( i-1 >= RML_HDRSTRLEN(RML_GETHDR(strold)) ) 
	{
		RML_TAILCALLK(rmlFC);
    } 
	else 
	{
		/* first copy the old string */
		struct rml_string *strnew = rml_prim_mkstring(len, 3);
		/* re-read after alloc, it may have been moved */
		strold = rmlA0;
		unsigned char *sold = (unsigned char*)RML_STRINGDATA(strold);
		unsigned char *snew = (unsigned char*)strnew->data;
		rmlA0 = RML_TAGPTR(strnew);
		for(; len > 0; --len)
			*snew++ = *sold++;
		*snew = '\0';
		/* update the char */
		RML_STRINGDATA(rmlA0)[i-1] = ch;
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL

/* adrpo added setting of a string entry with a string char */

RML_BEGIN_LABEL(RML__string_5fsetnth_5fstring_5fchar)
{
    void *strold = rmlA0; /* string */
	rml_uint_t len = RML_HDRSTRLEN(RML_GETHDR(rmlA0)); /* string lenght */
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1); /* index */
	rml_uint_t ch = RML_STRINGDATA(rmlA2)[0]; /* char */
    if( i >= RML_HDRSTRLEN(RML_GETHDR(strold)) ) 
	{
		RML_TAILCALLK(rmlFC);
    } 
	else 
	{
		/* first copy the old string */
		struct rml_string *strnew = rml_prim_mkstring(len, 3);
		/* re-read after alloc, it may have been moved */
		strold = rmlA0;
		unsigned char *sold = (unsigned char*)RML_STRINGDATA(strold);
		unsigned char *snew = (unsigned char*)strnew->data;
		rmlA0 = RML_TAGPTR(strnew);
		for(; len > 0; --len)
			*snew++ = *sold++;
		*snew = '\0';
		/* update the char */
		RML_STRINGDATA(rmlA0)[i] = ch;
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL


RML_BEGIN_LABEL(RML__string_5fupdate_5fstring_5fchar)
{
    void *strold = rmlA0; /* string */
	rml_uint_t len = RML_HDRSTRLEN(RML_GETHDR(rmlA0)); /* string lenght */
    rml_uint_t i = (rml_uint_t)RML_UNTAGFIXNUM(rmlA1); /* index */
	rml_uint_t ch = RML_STRINGDATA(rmlA2)[0]; /* char */
    if( i-1 >= RML_HDRSTRLEN(RML_GETHDR(strold)) ) 
	{
		RML_TAILCALLK(rmlFC);
    } 
	else 
	{
		/* first copy the old string */
		struct rml_string *strnew = rml_prim_mkstring(len, 3);
		/* re-read after alloc, it may have been moved */
		strold = rmlA0;
		unsigned char *sold = (unsigned char*)RML_STRINGDATA(strold);
		unsigned char *snew = (unsigned char*)strnew->data;
		rmlA0 = RML_TAGPTR(strnew);
		for(; len > 0; --len)
			*snew++ = *sold++;
		*snew = '\0';
		/* update the char */
		RML_STRINGDATA(rmlA0)[i-1] = ch;
	}
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
