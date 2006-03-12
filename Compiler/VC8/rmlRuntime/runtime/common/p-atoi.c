/* p-atoi.c */
#include "rml.h"

rml_sint_t rml_prim_atoi(const struct rml_string *str)
{
    rml_sint_t nchars;
    const unsigned char *s;
    unsigned char c;
    rml_uint_t value;
    int negate;
    
    nchars = RML_HDRSTRLEN(str->header);
    if( nchars <= 0 )
	return 0;
    s = (const unsigned char*)str->data;
    if( *s == '-' )
	++s, --nchars, negate = 1;
    else
	negate = 0;
    for(value = 0; --nchars >= 0 && (c = *s++) >= '0' && c <= '9';)
	value = value * 10 + (c - '0');
    if( negate )
	value = -value;
    return (rml_sint_t)value;
}
