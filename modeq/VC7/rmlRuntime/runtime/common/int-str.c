/* int_str.c */
#include <stdio.h>
#include <string.h>
#include "rml.h"

RML_BEGIN_LABEL(RML__int_5fstring)
{
    char buf[32];
    struct rml_string *str;

    (void)sprintf(buf, "%ld", (long)RML_UNTAGFIXNUM(rmlA0));
    str = rml_prim_mkstring(strlen(buf), 0);
    (void)strcpy(str->data, buf);	/* this also sets the ending '\0' */
    rmlA0 = RML_TAGPTR(str);
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
