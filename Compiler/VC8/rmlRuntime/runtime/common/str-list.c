/* str_list.c */
#include "rml.h"

RML_BEGIN_LABEL(RML__string_5flist)
{
    /* Allocate a big blob for all the conses, i.e. 3 * #conses words,
     * and then initialize it.
     */
    rml_uint_t nelts = RML_HDRSTRLEN(RML_GETHDR(rmlA0));
    void **consp = (void**)rml_prim_alloc(3*nelts, 1);
    unsigned char *s = (unsigned char*)RML_STRINGDATA(rmlA0) + nelts;
    void *a0 = RML_TAGPTR(&rml_prim_nil);
    /* XXX: we should build the list in address order */
    for(; nelts > 0; a0 = RML_TAGPTR(consp), consp += 3, --nelts) {
	consp[0] = RML_IMMEDIATE(RML_CONSHDR);
	consp[1] = RML_IMMEDIATE(RML_TAGFIXNUM((rml_uint_t)*--s));
	consp[2] = a0;
    }
    rmlA0 = a0;
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL

/* adrpo added string to string char list */

RML_BEGIN_LABEL(RML__string_5flist_5fstring_5fchar)
{
    /* Allocate a big blob for all the conses, i.e. 3+strnwords * #conses words,
     * and then initialize it.
     */
    rml_uint_t nelts = RML_HDRSTRLEN(RML_GETHDR(rmlA0));
    void *a0 = RML_TAGPTR(&rml_prim_nil);
	rml_uint_t strheader = RML_STRINGHDR(1);
    rml_uint_t strnwords = RML_HDRSLOTS(strheader)+1;
    struct rml_string *p;
    void **consp = (void**)rml_prim_alloc((3+strnwords)*nelts, 1);
	void **strStartAddr = consp+(3*nelts); /* where the list ends the strings start */
    unsigned char *s = (unsigned char*)RML_STRINGDATA(rmlA0) + nelts;
    /* XXX: we should build the list in address order */
    for(; nelts > 0; a0 = RML_TAGPTR(consp), consp += 3, strStartAddr +=2, --nelts) 
	{
		consp[0] = RML_IMMEDIATE(RML_CONSHDR);
		p = (struct rml_string *)strStartAddr;
		p->header = strheader;
		p->data[0] = (rml_uint_t)*--s;
		p->data[1] = '\0';
		consp[1] = RML_TAGPTR(p);
		consp[2] = a0;
    }
    rmlA0 = a0;
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL
