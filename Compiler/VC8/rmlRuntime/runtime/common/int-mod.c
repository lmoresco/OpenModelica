/* int_mod.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fmod)
{
    if( rmlA1 != RML_IMMEDIATE(RML_TAGFIXNUM(0)) ) {
	rmlA0 = RML_PRIM_INT_MOD(rmlA0, rmlA1);
	RML_TAILCALLK(rmlSC);
    } else
	RML_TAILCALLK(rmlFC);
}
RML_END_LABEL
