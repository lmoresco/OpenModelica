/* misc_print.c */
#include <stdio.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__print)
{
    void *str = rmlA0;
    fwrite(RML_STRINGDATA(str), RML_HDRSTRLEN(RML_GETHDR(str)), 1, stdout);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
