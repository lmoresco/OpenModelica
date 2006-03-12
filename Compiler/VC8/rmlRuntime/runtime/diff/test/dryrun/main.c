/* main.c */
#include <stdlib.h>
#include <stdio.h>
#include "ticks.h"
#if defined(DIFF)
#include "diff.h"
#endif
#if defined(MASK)
#include "mask.h"
#endif
#if defined(DEBUG)
#include "check.h"
unsigned long debug_motor;
unsigned long debug_entries;
unsigned long debug_dispatches;
#endif
#include "test.h"

static void motor(const struct label *label, long niter)
{
    while( (niter -= 16) >= 0 ) {
#if defined(DEBUG)
	++debug_motor;
#endif
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
	label = (*label->fun)(label);
    }
}

int main(int argc, char **argv)
{
    long ticks;
    long niter;

#if defined(DEBUG)
    check(test_checks);
#endif
    niter = (argc > 1) ? atol(argv[1]) : 4*1024*1024;
    ticks = ticks_now();
    motor(test_start, niter);
    ticks = ticks_now() - ticks;
    printf("%#.2f seconds\n",
	   (double)(unsigned)ticks / (double)ticks_per_sec());
#if defined(DEBUG)
    printf("#iter == %lu, #motor == %lu, #entries == %lu, #dispatches == %lu\n",
	   niter, debug_motor, debug_entries, debug_dispatches);
    if( debug_entries*32 != debug_dispatches )
	fprintf(stderr, "BUG: #dispatches should be %lu\n", debug_entries*32);
#endif
    return 0;
}
