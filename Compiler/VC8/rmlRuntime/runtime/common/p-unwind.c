/* p_unwind.c */
#include "rml.h"

void rml_prim_unwind_(void **saveTP)	/* PRE: rmlTP < saveTP */
{
    void **TP = rml_state_TP;
    do {
	RML_GETHDR(*TP) = RML_UNBOUNDHDR;
    } while( ++TP < saveTP );
    rml_state_TP = TP;
}
