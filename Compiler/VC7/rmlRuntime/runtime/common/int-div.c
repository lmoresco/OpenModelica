/* int_div.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fdiv)
{
    if( rmlA1 != RML_IMMEDIATE(RML_TAGFIXNUM(0)) ) {
	rmlA0 = RML_PRIM_INT_DIV(rmlA0, rmlA1);
	RML_TAILCALLK(rmlSC);
    } else
	RML_TAILCALLK(rmlFC);
}
RML_END_LABEL
