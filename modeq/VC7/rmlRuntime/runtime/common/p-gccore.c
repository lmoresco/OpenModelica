/* p-gccore.c
 * A simple 2-generational copying compacting garbage collector for RML.
 *
 * There are two main memory areas:
 * -	The young region, where objects are initially allocated.
 * -	The older region, to which young objects are promoted if
 *	they survive a minor collection.
 *	The older region is split in two halves, current and reserve, and
 *	behaves roughly as in a conventional two-space copying collector.
 *	The size of any of these regions must be a multiple (2 or higher)
 * 	of RML_YOUNG_SIZE, in order to guarantee that a minor collection of the
 *	young region cannot overflow the current region.
 *	If, after a minor collection, the available space in the current
 *	region is less than RML_YOUNG_SIZE, a major collection is performed to
 *	copy the live parts of the current region to the reserve region;
 *	then the current and reserve regions are swapped. Should less than
 *	RML_YOUNG_SIZE space be available after the major collection, then the
 *	objects are copied to new and larger older regions, and the original
 *	older regions are deallocated.
 *
 * The RML trail is used to register locations in the older region that may
 * refer to objects in the young region. The entire trail is always scanned.
 * (Eventually, the Uppsala Prolog collector [see PLILP'94], may be used.)
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>	/* strerror() */
#include <errno.h>
#include "rml.h"
#include "z-ysize.h"
#include "p-gccore.h"

/* the young region */
void *rml_young_region[RML_YOUNG_SIZE];

/* the older region */
static rml_uint_t rml_older_size;
static void **rml_current_region;
static void **rml_current_next;
static void **rml_reserve_region;

static void **rml_alloc_core(rml_uint_t nslots)
{
    unsigned long nbytes = nslots * sizeof(void*);
    void **p = malloc(nbytes);
    if( !p ) {
	fprintf(stderr, "malloc(%lu) failed: %s\n",
		nbytes, strerror(errno));
	exit(1);
    }
    return p;
}

static void rml_free_core(void **p, size_t nslots_unused)
{
    free(p);
}

/* the roots */
#if	!defined(RML_STACK_SIZE)
#define RML_STACK_SIZE	(64*1024)
#endif
unsigned long rml_stack_size;
void **rml_stack;
void **rmlSPMIN;

#if	!defined(RML_TRAIL_SIZE)
#define RML_TRAIL_SIZE	(64*1024)
#endif
void *rml_trail[RML_TRAIL_SIZE];

#ifdef	RML_STATE_JOIN

struct rml_state rml_state = {
    0,				/* SP */
    0,				/* FC */
    0,				/* SC */
    &rml_trail[RML_TRAIL_SIZE],	/* TP */
    {0,},			/* ARGS[] */
    &rml_young_region[0],	/* young_next */
    &rml_young_region[RML_YOUNG_SIZE],	/* young_limit; never changes */
};

#else	/*!RML_STATE_JOIN*/

void *rmlSP;
void *rmlFC;
void *rmlSC;
void **rmlTP = &rml_trail[RML_TRAIL_SIZE];
void *rmlARGS[RML_NUM_ARGS];
void **rml_young_next = &rml_young_region[0];
void **rml_young_limit = &rml_young_region[RML_YOUNG_SIZE];

#endif	/*RML_STATE_JOIN*/

void rml_gcinit(void)
{
    if( rml_stack_size == 0 )
	rml_stack_size = RML_STACK_SIZE;
    rml_stack = rml_alloc_core(rml_stack_size);
    rmlSPMIN = &rml_stack[rml_stack_size];
    rml_state_SP = &rml_stack[rml_stack_size];
    rml_state_FC = &rml_stack[rml_stack_size];
    rml_state_SC = &rml_stack[rml_stack_size];

    rml_older_size = 4*RML_YOUNG_SIZE;
    rml_current_region = rml_alloc_core(rml_older_size);
    rml_current_next = rml_current_region;
    rml_reserve_region = rml_alloc_core(rml_older_size);
}

/* misc */
char rml_flag_bench;
unsigned long rml_clock_start;
char rml_flag_gclog;
char rml_flag_log;
char rml_flag_no_stack_check;
unsigned long rml_minorgc_count;
unsigned long rml_majorgc_count;
unsigned long rml_call_count;
#ifdef	RML_MORE_LOGGING
const char *rml_latest_module;
unsigned char rml_latest_known;
unsigned long rml_intra_calls;
unsigned long rml_intra_known_calls;
unsigned long rml_inter_calls;
unsigned long rml_inter_known_calls;
#endif	/*RML_MORE_LOGGING*/

void rml_exit(int status)
{
    if( rml_flag_log ) {
	fprintf(stderr, "[HEAP:\t%lu minor collections, %lu major collections, %lu words currently in use]\n",
		rml_minorgc_count,
		rml_majorgc_count,
		(unsigned long)(rml_state_young_next - rml_young_region)
		+ (unsigned long)(rml_current_next - rml_current_region));
	fprintf(stderr, "[STACK:\t%lu words currently in use (%lu words max, %lu words total)]\n",
		(unsigned long)(&rml_stack[rml_stack_size] - (void**)rml_state_SP),
		(unsigned long)(&rml_stack[rml_stack_size] - rmlSPMIN),
		rml_stack_size);
	fprintf(stderr, "[TRAIL:\t%lu words currently in use]\n",
		(unsigned long)(&rml_trail[RML_TRAIL_SIZE] - rml_state_TP));
	fprintf(stderr, "[MOTOR:\t%lu tailcalls performed]\n",
		rml_call_count);
#ifdef	RML_MORE_LOGGING
	fprintf(stderr, "[CALLS:\t%lu intra, %lu known intra, %lu inter, %lu known inter]\n",
		rml_intra_calls, rml_intra_known_calls,
		rml_inter_calls, rml_inter_known_calls);
#endif	/*RML_MORE_LOGGING*/
    }
    if( rml_flag_bench ) {
	unsigned long rml_clock_end = rml_prim_clock();
	double secs = (double)(rml_clock_end - rml_clock_start) / (double)RML_CLOCKS_PER_SEC;
	fprintf(stderr, "[%s:\t%#.2f seconds, %lu minor collections, %lu major collections]\n",
		status ? "FAIL" : "BENCH",
		secs, rml_minorgc_count, rml_majorgc_count);
    }
    exit(status);
}

/* Forward the vector scan[0..nwords-1] of values using next as the allocation
 * pointer. Return the updated allocation pointer.
 * Objects located outside of [region_low,region_low+region_nbytes[ remain in place.
 */
#if defined(__GNUC__)
#define INLINE __inline__
#else
#define INLINE /*empty*/
#endif

static INLINE void **rml_forward_vec(
    void **scan,
    rml_uint_t nwords,
    void **next,
    char *region_low,
    rml_uint_t region_nbytes)
{
    for(; nwords > 0; ++scan, --nwords) {
	/* Forward the value pointed to by `*scan' to the next region.
	 * Update `*scan' with the new address.
	 * Leave forwarding address behind in `**scan'.
	 * Update the allocation pointer `next'.
	 */
	void **old;
	rml_uint_t hdr;

	/* If the value is immediate, do nothing. */
	old = (void**)*scan;
	if( RML_ISIMM(old) )
	    continue;

	/* If not allocated in this region, do nothing. */
	if( (rml_uint_t)((char*)old - region_low) >= region_nbytes )
	    continue;

	/* If already moved, replace `*scan' with the forwarding address. */
	hdr = RML_GETHDR(old);
	if( RML_HDRISFORWARD(hdr) ) {
	    *scan = (void*)hdr;
	    continue;
	}
	/* Copy node to next region.
	 * Update `*scan' with new address.
	 * Leave forwarding address behind in old node.
	 */
	*scan = RML_TAGPTR(next);
	old = (void**)RML_UNTAGPTR(old);
	*old++ = RML_TAGPTR(next);
	*next++ = (void*)hdr;
	for(hdr = RML_HDRSLOTS(hdr); hdr > 0; --hdr)	/* reuse `hdr' as `#slots' */
	    *next++ = *old++;
    }
    return next;
}

/*
 * External roots callback.
 */
struct rml_xgcstate {
    void **next;
    char *region_low;
    rml_uint_t region_nbytes;
};

void rml_user_gc_callback(struct rml_xgcstate *s, void **vec, rml_uint_t nelts)
{
    s->next = rml_forward_vec(vec, nelts, s->next, s->region_low, s->region_nbytes);
}

/* Forward all roots. Return updated allocation pointer.
 * Objects located outside of [region_low,region_low+region_nbytes[ remain in place.
 */
static void **rml_forward_all(
    rml_uint_t nliveargs,
    void **next,
    char *region_low,
    rml_uint_t region_nbytes)
{
    next = rml_forward_vec(rml_state_SP, &rml_stack[rml_stack_size] - (void**)rml_state_SP, next, region_low, region_nbytes);
    next = rml_forward_vec(rml_state_ARGS, nliveargs, next, region_low, region_nbytes);
    {
	void **TP = rml_state_TP;
	rml_sint_t cnt = &rml_trail[RML_TRAIL_SIZE] - TP;
	next = rml_forward_vec(TP, (rml_uint_t)cnt, next, region_low, region_nbytes);
	for(; --cnt >= 0; ++TP) {
	    void *ref_node = *TP;	/* known to be a BOUND ref node */
	    next = rml_forward_vec(&RML_REFDATA(ref_node), 1, next, region_low, region_nbytes);
	}
    }
    {
	struct rml_xgcstate state;
	state.next = next;
	state.region_low = region_low;
	state.region_nbytes = region_nbytes;
	rml_user_gc(&state);
	next = state.next;
    }
    return next;
}

static void **rml_collect(
    void **scan,
    char *region_low,
    rml_uint_t region_nbytes,
    rml_uint_t nliveargs
    )
{
    void **next;

    /* forward all roots */
    next = rml_forward_all(nliveargs, scan, region_low, region_nbytes);

    /* compute the transitive closure of the copied roots */
    while( scan < next ) {
	rml_uint_t hdr = *(rml_uint_t*)scan;
	rml_uint_t slots = RML_HDRSLOTS(hdr);
	++scan;	/* since slots doesn't include the header itself */
	if( RML_HDRHASPTRS(hdr) )
	    next = rml_forward_vec(scan, slots, next, region_low, region_nbytes);
	scan += slots;
    }

    /* return final allocation pointer */
    return next;
}

/* Do a major collection. */

static void rml_major_collection(rml_uint_t nwords, rml_uint_t nliveargs)
{
    void **next, **scan;
    rml_uint_t current_inuse;

    ++rml_majorgc_count;
    if( rml_flag_gclog ) {
	fprintf(stderr, "[major collection #%lu..", rml_majorgc_count);
	fflush(stderr);
    }

    /* collect the current region, forwarding to the reserve region */
    next = rml_collect(rml_reserve_region,
		       (char*)rml_current_region,
		       (char*)rml_current_next - (char*)rml_current_region,
		       nliveargs);

    /* update the older region state variables */
    rml_current_next = next;
    scan = rml_reserve_region;
    current_inuse = next - scan;
    next = rml_current_region;
    rml_current_region = scan;
    rml_reserve_region = next;

    /* Check if the older region should be expanded.
     * Expansion is triggered if more than 75% is in use.
     * The new size is chosen to make the heap at least 50% free.
     */
    current_inuse += nwords;
    if( 4*current_inuse > 3*rml_older_size ) {
	rml_uint_t new_size;

	if( rml_flag_gclog ) {
	    fprintf(stderr, " expanding heap..");
	    fflush(stderr);
	}

	new_size = (2 * current_inuse) + RML_YOUNG_SIZE;

	/* expand the older region */
	rml_free_core(rml_reserve_region, rml_older_size);
	rml_reserve_region = rml_alloc_core(new_size);
	next = rml_collect(rml_reserve_region,
			   (char*)rml_current_region,
			   (char*)rml_current_next - (char*)rml_current_region,
			   nliveargs);
	rml_current_next = next;
	rml_free_core(rml_current_region, rml_older_size);
	rml_current_region = rml_reserve_region;
	rml_older_size = new_size;
	rml_reserve_region = rml_alloc_core(rml_older_size);
    }

    /* done with the major collection */
    if( rml_flag_gclog )
	fprintf(stderr, " %lu%% used]\n",
		(unsigned long)((current_inuse*100)/rml_older_size));
}

/* Do a minor collection. */

void rml_minor_collection(rml_uint_t nliveargs)
{
    void **next;
    rml_uint_t current_nfree;

    ++rml_minorgc_count;

    /* collect the young region, forwarding to the current region */
    next = rml_collect(rml_current_next,
		       (char*)rml_young_region,
		       RML_YOUNG_SIZE * sizeof(void*),
		       nliveargs);

    /* update the older region state variables */
    rml_current_next = next;
    current_nfree = rml_older_size - (next - rml_current_region);

    /* check if a major collection should be done */
    if( current_nfree < RML_YOUNG_SIZE )
	rml_major_collection(0, nliveargs);
}

/* If a minor collection doesn't give us enough memory,
 * try to allocate in the current older region.
 */
void **rml_older_alloc(rml_uint_t nwords, rml_uint_t nargs)
{
    void **next = rml_current_next;
    rml_uint_t nfree = rml_older_size - (next - rml_current_region);
    if( nfree >= nwords + RML_YOUNG_SIZE ) {
	rml_current_next = next + nwords;
	return next;
    } else {
	rml_major_collection(nwords, nargs);
	next = rml_current_next;
	nfree = rml_older_size - (next - rml_current_region);
	if( nfree >= nwords + RML_YOUNG_SIZE ) {
	    rml_current_next = next + nwords;
	    return next;
	}
	return 0;
    }
}
