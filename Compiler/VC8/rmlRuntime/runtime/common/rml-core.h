/*

    This file is part of Relational Meta-Language (RML).
	http://www.ida.liu.se/~pelab/rml

RML COPYRIGHT NOTICE, LICENSE AND DISCLAIMER.

------------------------------------------------------------------------
Portions Copyright (c) 2002-2005 by Adrian Pop
(Versions above rml-2.1.8)

Permission to use, copy, modify, and distribute this software and
its documentation for NON-COMMERCIAL purposes and without fee is hereby 
granted, provided that this copyright notice appear in all copies and 
that both the copyright notice and this permission notice and warranty
disclaimer appear in supporting documentation, and that the name of
The Author not be used in advertising or publicity pertaining to
distribution of the software without specific, written prior permission.
For COMMERCIAL uses of versions above rml-2.1.8 please contact 
Adrian Pop, adrpo@ida.liu.se. 

THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, INDIRECT OR
CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
USE OR PERFORMANCE OF THIS SOFTWARE.

------------------------------------------------------------------------
Portions Copyright (c) 1994-2000 by Mikael Pettersson.
(Versions up to rml-2.1.8)

Permission to use, copy, modify, and distribute this software and
its documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both the copyright notice and this permission notice and warranty
disclaimer appear in supporting documentation, and that the name of
The Author not be used in advertising or publicity pertaining to
distribution of the software without specific, written prior permission.

THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, INDIRECT OR
CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
USE OR PERFORMANCE OF THIS SOFTWARE.

 * rml-core.h
 */
/*
 * A value is represented as a 32-bit quantity with a tag in the lowest bit.
 * An even value i<<1 represents the integer i.
 * An odd value p+3 represents (a pointer to) the node at even address p-3.
 * A value is typed as `void*'. When manipulated as an integer (possibly unsigned),
 * the typedef rml_sint_t (or rml_uint_t) is used. This type is either int or long.
 * False and true are represented as the fixnums 0 and 1, respectively.
 *
 * On a 64-bit machine, a value is a 64-bit quantity.
 */
#define RML_IMMEDIATE(i)	((void*)(i))
#define RML_TAGFIXNUM(i)	((i) << 1)
#define RML_UNTAGFIXNUM(x)	((rml_sint_t)(x) >> 1)	/* SIGNED right-shift */
#define RML_FALSE		RML_IMMEDIATE(RML_TAGFIXNUM(0))
#define RML_TRUE		RML_IMMEDIATE(RML_TAGFIXNUM(1))
#define RML_ISIMM(x)		(!((rml_uint_t)(x) & 1))
#define RML_FIXNUM_AND(x,y)	RML_IMMEDIATE((rml_sint_t)(x) & (rml_sint_t)(y))
#define RML_FIXNUM_OR(x,y)	RML_IMMEDIATE((rml_sint_t)(x) | (rml_sint_t)(y))
#define RML_FIXNUM_LT(x,y)	((rml_sint_t)(x) <  (rml_sint_t)(y))
#define RML_FIXNUM_LE(x,y)	((rml_sint_t)(x) <= (rml_sint_t)(y))
#define RML_FIXNUM_EQ(x,y)	((x) == (y))
#define RML_FIXNUM_NE(x,y)	((x) != (y))
#define RML_FIXNUM_GE(x,y)	((rml_sint_t)(x) >= (rml_sint_t)(y))
#define RML_FIXNUM_GT(x,y)	((rml_sint_t)(x) >  (rml_sint_t)(y))
#define RML_FIXNUM_ADD(x,y)	RML_IMMEDIATE((rml_sint_t)(x) + (rml_sint_t)(y))
#define RML_FIXNUM_DIV(x,y)	RML_IMMEDIATE(RML_TAGFIXNUM((rml_sint_t)(x) / (rml_sint_t)(y)))
#define RML_FIXNUM_MOD(x,y)	RML_IMMEDIATE((rml_sint_t)(x) % (rml_sint_t)(y))
#define RML_FIXNUM_MUL(x,y)	RML_IMMEDIATE((rml_sint_t)(x) * RML_UNTAGFIXNUM(y))
#define RML_FIXNUM_NEG(x)	RML_IMMEDIATE(-(rml_sint_t)(x))
#define RML_FIXNUM_SUB(x,y)	RML_IMMEDIATE((rml_sint_t)(x) - (rml_sint_t)(y))
#define RML_TAGPTR(p)		((void*)((char*)(p) + 3))
#define RML_UNTAGPTR(x)		((void*)((char*)(x) - 3))
#define RML_GETHDR(x)		(*(rml_uint_t*)RML_UNTAGPTR(x))

/*
 * A word is a 32-bit quantity.
 * A node is a word-aligned structure, starting with a 32-bit unsigned header.
 * The high 22 bits of the header, `slots', contain the number of words
 * of the node, not counting the header itself.
 * The low 10 bits of the header contain a tag.
 * [ABCDEFGH00]	a structure with constructor A*128+B*64+C*32+D*16+E*8+F*4+G*2+H
 * [0000000001]	an unbound reference node; `slots' is 1
 * [0000000010]	an instantiated reference node; `slots' is 1
 * [XY00000101]	a byte string with `slots*4+X*2+Y-4' bytes
 *		slots is always >= 1, and a '\0' follows the last byte
 * [0000001001]	a 64-bit floating-point value; `slots' is 2
 * [xxxxxxxx11]	(used during garbage collection) a forwarded node;
 *		the header itself is the forwarding address, i.e.
 *		the header is RML_TAGPTR(forward_address)
 *
 * (IDEA: let RML_BOUNDHDR be a special case of constructor node, using tag 0)
 *
 * Bit 0 is zero if the node contains pointers, 1 otherwise.
 * Since structure headers have zeroes in their lowest two bits, they
 * could be used to directly index jump tables.
 *
 * On a 64-bit machine, words are 64 bits, the header is 64 bits, `slots'
 * is 54 bits, and strings and reals have the following tags:
 * [XYZ0000101]	a byte string with `slots*8+X*4*Y*2+Z-8' bytes
 * [0000001001]	a 64-bit floating-point value; `slots' is 1
 *
 * The definition of RML_STRINGHDR(nbytes) is
 *	((nbytes + RML_SIZE_INT) << (10-RML_LOG2_SIZE_INT)) + 5
 * but this requires 3 arithmetic operations (add; shift; add).
 * Noting that (x + y) << z == (x << z) + (y << z), we have
 *	(nbytes<<(10-RML_LOG2_SIZE_INT))+(RML_SIZE_INT<<(10-RML_LOG2_SIZE_INT))+5
 * The middle expression simplifies to (1 << 10), so the final form is:
 *	(nbytes << (10-RML_LOG2_SIZE_INT)) + ((1 << 10) + 5)
 * which only requires 2 arithmetic operations (shift; add).
 */
#define RML_UNBOUNDHDR		(0x401)
#define RML_BOUNDHDR		(0x402)
#define RML_STRINGHDR(nbytes)	(((nbytes)<<(10-RML_LOG2_SIZE_INT))+((1<<10)+5))
#define RML_HDRISSTRING(hdr)	(((hdr) & ((1<<(10-RML_LOG2_SIZE_INT))-1)) == 5)
#define RML_HDRSTRLEN(hdr)	(((hdr) >> (10-RML_LOG2_SIZE_INT)) - RML_SIZE_INT)
#define RML_REALHDR		(((RML_SIZE_DBL/RML_SIZE_INT) << 10) + 9)
#define RML_STRUCTHDR(slots,ctor) (((slots) << 10) + (((ctor) & 255) << 2))
#define RML_HDRISSTRUCT(hdr)	(!((hdr) & 3))
#define RML_HDRCTOR(hdr)	(((hdr) >> 2) & 255)
#define RML_NILHDR		RML_STRUCTHDR(0,0)
#define RML_CONSHDR		RML_STRUCTHDR(2,1)
#define RML_HDRSLOTS(hdr)	((hdr) >> 10)
#define RML_HDRHASPTRS(hdr)	(!((hdr) & 1))
#define RML_HDRISFORWARD(hdr)	(((hdr) & 3) == 3)

/*
 * Node layout and access macros
 */

struct rml_header {
    rml_uint_t header;
};

/* REFERENCES */

struct rml_ref {
    rml_uint_t header;	/* RML_{UN,}BOUNDHDR */
    void *data;
};
#define RML_REFDATA(x) (((struct rml_ref*)RML_UNTAGPTR(x))->data)

/* STRINGS */

struct rml_string {
    rml_uint_t header;	/* RML_STRINGHDR(bytes) */
    char data[1];	/* `bytes' elements + terminating '\0' */
};
#define RML_STRINGDATA(x) (((struct rml_string*)RML_UNTAGPTR(x))->data)

#define RML_DEFSTRINGLIT(NAME,LEN,VAL)	\
    struct {				\
	rml_uint_t header;		\
	char data[LEN+1];		\
    } NAME = { RML_STRINGHDR(LEN), VAL }
#define RML_REFSTRINGLIT(NAME) RML_TAGPTR(&(NAME).header)

/* REALS */

struct rml_real {
    rml_uint_t header;	/* RML_REALHDR */
    rml_uint_t data[RML_SIZE_DBL/RML_SIZE_INT];
};
#define RML_REALDATA(x) (((struct rml_real*)RML_UNTAGPTR(x))->data)

#ifdef	RML_DBL_PAD
struct rml_real_lit {	/* there must be no padding between `header' and `data' */
    rml_uint_t filler;
    rml_uint_t header;
    double data;
};
#define RML_DEFREALLIT(NAME,VAL) struct rml_real_lit NAME = {0,RML_REALHDR,VAL}
#else	/* !RML_DBL_PAD */
struct rml_real_lit {	/* there must be no padding between `header' and `data' */
    rml_uint_t header;
    double data;
};
#define RML_DEFREALLIT(NAME,VAL) struct rml_real_lit NAME = {RML_REALHDR,VAL}
#endif	/* RML_DBL_PAD */
#define RML_REFREALLIT(NAME) RML_TAGPTR(&(NAME).header)

#ifdef	RML_DBL_STRICT
union rml_double_as_words {
    double d;
    rml_uint_t data[2];
};
extern double rml_prim_get_real(void*);
extern void rml_prim_set_real(struct rml_real*, double);
#else	/* !RML_DBL_STRICT */
#define rml_prim_get_real(x)	(*(double*)RML_REALDATA(x))
#define rml_prim_set_real(p,d)	(*(double*)((p)->data) = (d))
#endif	/* RML_DBL_STRICT */

/* STRUCTS */

struct rml_struct {
    rml_uint_t header;	/* RML_STRUCTHDR(slots,ctor) */
    void *data[1];	/* `slots' elements */
};
#define RML_STRUCTDATA(x) (((struct rml_struct*)RML_UNTAGPTR(x))->data)
#define RML_CAR(X)	RML_FETCH(RML_OFFSET(RML_UNTAGPTR(X),1))
#define RML_CDR(X)	RML_FETCH(RML_OFFSET(RML_UNTAGPTR(X),2))

#define RML_DEFSTRUCTLIT(NAME,LEN,CON)	\
    struct {				\
	rml_uint_t header;		\
	void *data[LEN];		\
    } NAME = { RML_STRUCTHDR(LEN,CON),
#define RML_DEFSTRUCT0LIT(NAME,CON) struct rml_header NAME = { RML_STRUCTHDR(0,CON) }
#define RML_REFSTRUCTLIT(NAME) RML_TAGPTR(&(NAME).header)
#define __CRAP }	/* restore Emacs C-mode indentation state */

/*
 * Additional operators used by the C code
 */
#define RML_OFFSET(p,i)		((void*)((void**)(p) + (i)))
#define RML_FETCH(p)		(*(void**)(p))
#define RML_STORE(dst,val)	(*(void**)(dst) = (val))

/*
 * Strictly internal declarations
 */
extern rml_sint_t rml_prim_atoi(const struct rml_string*);
#define RML_CLOCKS_PER_SEC	1000	/* milliseconds */
extern unsigned long rml_prim_clock(void);
extern char rml_flag_bench;
extern unsigned long rml_clock_start;
extern char rml_flag_gclog;
extern char rml_flag_log;
extern unsigned long rml_call_count;
extern char rml_flag_no_stack_check;

/* adrpo added look into p-gccore.c for more */
/* the young region */
extern void **rml_young_region;
extern unsigned long rml_young_size;

/* the older region */
extern unsigned long rml_older_size;
extern void **rml_current_region;
extern void **rml_current_next;
extern void **rml_reserve_region;

/* the roots */
extern void **rmlSPMIN;
extern void **rml_stack;
extern unsigned long rml_stack_size;

extern void *rml_trail[];
extern unsigned long rml_trail_size;

extern void *rml_array_trail[];
extern unsigned long rml_array_trail_size;

extern unsigned long rml_allocated_from_c;


#ifdef	RML_MORE_LOGGING
extern const char *rml_latest_module;
extern unsigned char rml_latest_known;
extern unsigned long rml_intra_calls;
extern unsigned long rml_intra_known_calls;
extern unsigned long rml_inter_calls;
extern unsigned long rml_inter_known_calls;
#endif	/*RML_MORE_LOGGING*/
extern void rml_exit(int);
extern struct rml_string *rml_prim_mkstring(rml_uint_t, rml_uint_t);
extern void *rml_prim_mkreal(double);

/* adrpo added 2004-11-03 */
extern void rml_show_status(void);


/*
 * Module init stuff
 */
struct rml_gval {
    union {
	void *value;
	struct rml_gval *prev;
    } u;
    struct rml_gval *next;
    const char *name;
};     
#define RML_GVAL_VALUE(GVAL) ((GVAL).u.value)
extern void rml_gval_init(struct rml_gval*);
extern void RML_5finit(void);
extern void Main_5finit(void);	/* user's Main_init */

/*
 * Memory allocation operations
 */
extern void *rml_prim_alloc(rml_uint_t, rml_uint_t);

/*
 * Primitive operations
 * Some of these have both macro and non-macro versions.
 * These could have the same names in ANSI-C, but alas not
 * in some not-quite ANSI-C compilers.
 */
extern const struct rml_header rml_prim_nil;
#define rml_prim_marker()	((void*)(rmlTP))
extern rml_sint_t rml_prim_stringeq(void*, rml_uint_t, const char*);
extern void *rml_prim_equal(void*, void*);
extern void  rml_prim_unwind_(void**);
#define rml_prim_unwind(XTP) do{if(rmlTP<(void**)(XTP))rml_prim_unwind_((void**)(XTP));}while(0)

/*
 * Primitive operations for inlinable primitive procedures.
 * Preconditions like division by zero are supposed to have been checked.
 */
#define RML_PRIM_MKBOOL(FLAG)	((FLAG) ? RML_TRUE : RML_FALSE)
#define RML_PRIM_BOOL_NOT(X)	RML_PRIM_MKBOOL(((X) == RML_FALSE))
#define RML_PRIM_INT_NEG(X)	RML_FIXNUM_NEG((X))
#define RML_PRIM_INT_ABS(X)	(RML_FIXNUM_LT((X),RML_IMMEDIATE(RML_TAGFIXNUM(0))) ? RML_FIXNUM_NEG((X)) : (X))
#define RML_PRIM_BOOL_AND(X,Y)	RML_FIXNUM_AND((X),(Y))
#define RML_PRIM_BOOL_OR(X,Y)	RML_FIXNUM_OR((X),(Y))
#define RML_PRIM_INT_ADD(X,Y)	RML_FIXNUM_ADD((X),(Y))
#define RML_PRIM_INT_SUB(X,Y)	RML_FIXNUM_SUB((X),(Y))
#define RML_PRIM_INT_MUL(X,Y)	RML_FIXNUM_MUL((X),(Y))
#define RML_PRIM_INT_DIV(X,Y)	RML_FIXNUM_DIV((X),(Y))
#define RML_PRIM_INT_MOD(X,Y)	RML_FIXNUM_MOD((X),(Y))
#define RML_PRIM_INT_MAX(X,Y)	(RML_FIXNUM_GE((X),(Y)) ? (X) : (Y))
#define RML_PRIM_INT_MIN(X,Y)	(RML_FIXNUM_LE((X),(Y)) ? (X) : (Y))
#define RML_PRIM_INT_LT(X,Y)	RML_PRIM_MKBOOL(RML_FIXNUM_LT((X),(Y)))
#define RML_PRIM_INT_LE(X,Y)	RML_PRIM_MKBOOL(RML_FIXNUM_LE((X),(Y)))
#define RML_PRIM_INT_EQ(X,Y)	RML_PRIM_MKBOOL(RML_FIXNUM_EQ((X),(Y)))
#define RML_PRIM_INT_NE(X,Y)	RML_PRIM_MKBOOL(RML_FIXNUM_NE((X),(Y)))
#define RML_PRIM_INT_GE(X,Y)	RML_PRIM_MKBOOL(RML_FIXNUM_GE((X),(Y)))
#define RML_PRIM_INT_GT(X,Y)	RML_PRIM_MKBOOL(RML_FIXNUM_GT((X),(Y)))

/*
 * Handling of external (user) roots.
 *
 * - User defines a function "rml_user_gc()".
 * - rml_user_gc() is called from the RML gc at gc time.
 *   The user's function is required to find ALL external references
 *   into the RML heap and to call rml_user_gc_callback() on the
 *   address of each such reference. It is safe to call the callback
 *   on any cell containing an RML value.
 *   For performance, the callback is passed a pointer to a vector
 *   of references and its length.
 *   The rml_user_gc() function should be prepared to find and ignore
 *   already-forwarded objects; use the RML_HDRISFORWARD() test for this.
 * - The RML library provides a dummy implementation of rml_user_gc(),
 *   for applications not needing gc of external roots.
 */
struct rml_xgcstate;	/* opaque for users */
extern void rml_user_gc_callback(struct rml_xgcstate *state, void **vec, rml_uint_t nelts);
extern void rml_user_gc(struct rml_xgcstate *state);
