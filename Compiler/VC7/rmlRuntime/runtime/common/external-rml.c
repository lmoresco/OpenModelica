/******************************************************************************
 * @author Adrian Pop [adrpo@ida.liu.se, http://www.ida.liu.se/~adrpo]
 * Copyright (c) 2002-2006, Adrian Pop [adrpo@ida.liu.se],
 * Programming Environments Laboratory (PELAB),
 * Department of Computer and Information Science (IDA), 
 * Linkopings University (LiU). 
 * All rights reserved.
 *
 * http://www.ida.liu.se/~adrpo/license/
 *
 * NON-COMMERCIAL terms and conditions [NON-COMMERCIAL setting]:
 * Permission to use, copy, modify, and distribute this software and
 * its documentation in source or binary form (including products 
 * developed or generated using this software) for NON-COMMERCIAL 
 * purposes and without fee is hereby granted, provided that this 
 * copyright notice appear in all copies and that both the copyright 
 * notice and this permission notice and warranty disclaimer appear 
 * in supporting documentation, and that the name of The Author is not 
 * to be used in advertising or publicity pertaining to distribution 
 * of the software without specific, prior written permission.
 * 
 * COMMERCIAL terms and conditions [COMMERCIAL setting]:
 * COMMERCIAL use, copy, modification and distribution in source 
 * or binary form (including products developed or generated using
 * this software) is NOT permitted without prior written agreement 
 * from Adrian Pop [adrpo@ida.liu.se].
 * 
 * THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
 * OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
 * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
 * USE OR PERFORMANCE OF THIS SOFTWARE.
 *****************************************************************************/

 
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
	if (len1 != len2) 
	{
		rmlA0 = RML_FALSE;
		RML_TAILCALLK(rmlSC);
	}
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

