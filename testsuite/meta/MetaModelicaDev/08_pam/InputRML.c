#include <stdio.h>
#include <errno.h>
#include <string.h>
#include "rml.h"

#ifndef RML_INSPECTBOX
#define RML_INSPECTBOX(d,h,p) (RML_ISIMM((d)=(p))?0:(((h)=(void*)RML_GETHDR((p))),0))
#define rml_prim_deref_imm(x) x
#endif

void Input_5finit(void) {}

RML_BEGIN_LABEL(Input__read) {
    void *a0, *a0hdr;
    int i =0;
    RML_INSPECTBOX(a0, a0hdr, rmlA0);
    if( a0hdr == RML_IMMEDIATE(RML_UNBOUNDHDR) )
        RML_TAILCALLK(rmlFC);
    else {
        if(scanf("%d", &i)!=0) {
            rmlA0 = (void*) mk_icon(i);
            RML_TAILCALLK(rmlSC);
        }
        else RML_TAILCALLK(rmlFC);
    }
}
RML_END_LABEL


