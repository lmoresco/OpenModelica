/* misc_clock.c */
#include "rml.h"
#include <string.h>


RML_BEGIN_LABEL(RML__if_5fexp)
{
	if (RML_UNTAGFIXNUM(rmlA0))
		rmlA0 = rmlA1;
	else
		rmlA0 = rmlA2;
    RML_TAILCALLK(rmlSC);
}
RML_END_LABEL

RML_BEGIN_LABEL(RML__string_5fequal)
{
	char *str1 = RML_STRINGDATA(rmlA0);
	char *str2 = RML_STRINGDATA(rmlA1);
	rml_uint_t len1 = strlen(str1);
	rml_uint_t len2 = strlen(str2);
	if (len1 != len2) RML_FALSE; 
	if( !memcmp(str1, str2, len1) )
		    rmlA0 = RML_TRUE;
		else
		    rmlA0 = RML_FALSE;
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL

RML_BEGIN_LABEL(RML__string_5fcompare)
{
	char *str1 = RML_STRINGDATA(rmlA0);
	char *str2 = RML_STRINGDATA(rmlA1);
	int result = strcmp(str1, str2);
	rmlA0 = RML_IMMEDIATE(RML_TAGFIXNUM(result));
	RML_TAILCALLK(rmlSC);
}
RML_END_LABEL

