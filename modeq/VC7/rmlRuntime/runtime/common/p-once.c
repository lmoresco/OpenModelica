/* p_once.c */
#include <setjmp.h>
#include "rml.h"

RML_BEGIN_LABEL(rml_sclam_once)
{
    jmp_buf *there = (jmp_buf*)RML_FETCH(RML_OFFSET(rmlSC, 1));
    longjmp(*there, 2);
    return 0;
}
RML_END_LABEL

RML_BEGIN_LABEL(rml_fclam_once)
{
    jmp_buf *there = (jmp_buf*)RML_FETCH(RML_OFFSET(rmlFC, 2));
    longjmp(*there, 1);
    return 0;
}
RML_END_LABEL

int rml_prim_once(rml_labptr_t f)
{
    void *origSP, *origSC, *origFC;
    jmp_buf here;
    int status;

    origSC = rml_state_SC;
    origFC = rml_state_FC;
    origSP = rml_state_SP;

    RML_STORE(RML_OFFSET(origSP, -1), (void*)here);
    RML_STORE(RML_OFFSET(origSP, -2), RML_LABVAL(rml_sclam_once));
    RML_STORE(RML_OFFSET(origSP, -3), RML_LABVAL(rml_fclam_once));
    rml_state_SC = RML_OFFSET(origSP, -2);
    rml_state_FC = RML_OFFSET(origSP, -3);
    rml_state_SP = RML_OFFSET(origSP, -3);

    /* ANSI-C 4.6.1.1, 3.6.4, and 3.6.5 imply that one cannot
     * portably assign the value of "setjmp()" to a variable.
     * Below, I'd really like to write:
     *		if( (status = setjmp(here)) == 0 )
     *		    rml_prim_motor(f);
     * but instead I "switch()" on the different cases.
     * (Note: I have yet to find an implementation where
     * the code above actually breaks.)
     */
    switch( setjmp(here) ) {
      case 0:		/* starting */
	rml_prim_motor(f);
	/*FALLTHROUGH*/
      case 1:		/* rml_fclam_once: failure */
	status = 1;
	break;
      default:		/* rml_sclam_once: success */
	status = 2;
    }
    /* According to ANSI-C 4.6.2.1, as I haven't changed the orig*
     * variables between the setjmp() and longjmp() calls, they have
     * their correct values now, even though they aren't `volatile'.
     */
    rml_state_SC = origSC;
    rml_state_FC = origFC;
    rml_state_SP = origSP;
    return status - 1;	/* 0 on failure, 1 on success */
}
