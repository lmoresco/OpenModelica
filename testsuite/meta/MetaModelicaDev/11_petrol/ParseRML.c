#include <stdio.h>
#include <errno.h>
#include <string.h>
#include "rml.h"

#ifndef RML_INSPECTBOX
#define RML_INSPECTBOX(d,h,p) (RML_ISIMM((d)=(p))?0:(((h)=(void*)RML_GETHDR((p))),0))
#define rml_prim_deref_imm(x) x
#endif

void Parse_5finit(void) {}

extern void *absyntree;

RML_BEGIN_LABEL(Parse__parse) {
    void *a0, *a0hdr;
    RML_INSPECTBOX(a0, a0hdr, rmlA0);
    if( a0hdr == RML_IMMEDIATE(RML_UNBOUNDHDR) )
        RML_TAILCALLK(rmlFC);
    else {
        if(yyparse()==0) {
            rmlA0 = absyntree;
            RML_TAILCALLK(rmlSC);
        }
        else RML_TAILCALLK(rmlFC);
    }
}

