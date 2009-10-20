#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "rml.h"
#include "yacclib.h"

void *mmc_mk_icon(int i)
{
    return RML_IMMEDIATE(RML_TAGFIXNUM((rml_sint_t)i));
}

void *mmc_mk_rcon(double d)
{
    struct rml_real *p = alloc_words(RML_SIZE_DBL/RML_SIZE_INT + 1);
    rml_prim_set_real(p, d);
    p->header = RML_REALHDR;
    return RML_TAGPTR(p);
}

void *mmc_mk_scon(char *s)
{
    unsigned nbytes = strlen(s);
    unsigned header = RML_STRINGHDR(nbytes);
    unsigned nwords = RML_HDRSLOTS(header) + 1;
    struct rml_string *p = alloc_words(nwords);
    p->header = header;
    memcpy(p->data, s, nbytes+1);	/* including terminating '\0' */
    return RML_TAGPTR(p);
}

void *mmc_mk_nil(void)
{
    return RML_TAGPTR(&rml_prim_nil);
}

void *mmc_mk_cons(void *car, void *cdr)
{
    return mmc_mk_box2(1, car, cdr);
}

void *mmc_mk_none(void)
{
    static struct rml_header none = { RML_STRUCTHDR(0, 0) };
    return RML_TAGPTR(&none);
}

void *mmc_mk_some(void *x)
{
    return mmc_mk_box1(1, x);
}

void *mmc_mk_box0(unsigned ctor)
{
    struct rml_struct *p = alloc_words(1);
    p->header = RML_STRUCTHDR(0, ctor);
    return RML_TAGPTR(p);
}

void *mmc_mk_box1(unsigned ctor, void *x0)
{
    struct rml_struct *p = alloc_words(2);
    p->header = RML_STRUCTHDR(1, ctor);
    p->data[0] = x0;
    return RML_TAGPTR(p);
}

void *mmc_mk_box2(unsigned ctor, void *x0, void *x1)
{
    struct rml_struct *p = alloc_words(3);
    p->header = RML_STRUCTHDR(2, ctor);
    p->data[0] = x0;
    p->data[1] = x1;
    return RML_TAGPTR(p);
}

void *mmc_mk_box3(unsigned ctor, void *x0, void *x1, void *x2)
{
    struct rml_struct *p = alloc_words(4);
    p->header = RML_STRUCTHDR(3, ctor);
    p->data[0] = x0;
    p->data[1] = x1;
    p->data[2] = x2;
    return RML_TAGPTR(p);
}

void *mmc_mk_box4(unsigned ctor, void *x0, void *x1, void *x2, void *x3)
{
    struct rml_struct *p = alloc_words(5);
    p->header = RML_STRUCTHDR(4, ctor);
    p->data[0] = x0;
    p->data[1] = x1;
    p->data[2] = x2;
    p->data[3] = x3;
    return RML_TAGPTR(p);
}

void *mmc_mk_box5(unsigned ctor, void *x0, void *x1, void *x2, void *x3, void *x4)
{
    struct rml_struct *p = alloc_words(6);
    p->header = RML_STRUCTHDR(5, ctor);
    p->data[0] = x0;
    p->data[1] = x1;
    p->data[2] = x2;
    p->data[3] = x3;
    p->data[4] = x4;
    return RML_TAGPTR(p);
}
