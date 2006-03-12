/* int_int.c (implements both char_int and int_char) */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fint)
{
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL


/* 
 * adrpo added int_string_char and string_char_int
 */

RML_BEGIN_LABEL(RML__int_5fstring_5fchar)
{
	struct rml_string *strnew = rml_prim_mkstring(1, 1);
	strnew->data[0] = (rml_uint_t)RML_UNTAGFIXNUM(rmlA0);
	strnew->data[1] = '\0';
	rmlA0 = RML_TAGPTR(strnew);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL

RML_BEGIN_LABEL(RML__string_5fchar_5fint)
{
	rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM((rml_uint_t)RML_STRINGDATA(rmlA0)[0]));
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
