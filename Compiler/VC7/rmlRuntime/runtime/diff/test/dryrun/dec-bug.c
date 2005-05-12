/* dec-bug.c
 * This C source demonstrates a bug that is present in both the DEC Alpha
 * C compiler for OSF/1 V3.2 and the MIPS C compiler for Ultrix 4.3.
 *
 * Submitted June 1996 by Mikael Pettersson (mpe@ida.liu.se),
 * Dept. of Computer and Information Science, Linkoping Univ., Sweden.
 *
 * The correct output of this program is:
 *	#iter == 8, #motor == 8, #entries == 8, #dispatches == 64
 * If there is a problem, the program outputs:
 *	BUG: #dispatches should be 64
 *
 * For the Alpha:
 * Compile with "cc -O1 -std1 dec-bug.c" and it works.
 * Compile with "cc -O2 -std1 dec-bug.c" and it FAILS.
 * Compile with "cc -O2 -std1 -DFIXBUG_O2 dec-bug.c" and it works again.
 * Compile with "cc -O3 -std1 -DFIXBUG_O2 dec-bug.c" and it FAILS again.
 *
 * For the MIPS:
 * Compile with "cc -O1 dec-bug.c" and it works.
 * Compile with "cc -O2 dec-bug.c" and it FAILS.
 * Compile with "cc -O2 -DFIXBUG_O2 dec-bug.c" and it works again.
 * Compile with "cc -O3 -DFIXBUG_O2 dec-bug.c" and it FAILS again.
 */
#include <stdio.h>

unsigned long count_motor = 0;
unsigned long count_entries = 0;
unsigned long count_dispatches = 0;

struct label {
    struct label *(*fun)(struct label*);
    unsigned long tag;
    unsigned long *mask;
};

struct label *test_modfun(struct label*);
#if !defined(FIXBUG_O2)
static
#endif
unsigned long test_mask = 0;
struct label test_labels[8] = {
    {test_modfun,0,&test_mask},
    {test_modfun,1,&test_mask},
    {test_modfun,2,&test_mask},
    {test_modfun,3,&test_mask},
    {test_modfun,4,&test_mask},
    {test_modfun,5,&test_mask},
    {test_modfun,6,&test_mask},
    {test_modfun,7,&test_mask}
};

struct label *test_modfun(struct label *label)
{
    struct label *label0 = &test_labels[0];
    ++count_entries;
    test_mask = ~0;
unknown_dispatch:
    ++count_dispatches;
    switch( label->tag & *label->mask ) {
      default: case 0:	test_mask = 0; return &label0[7];
      case 1:	label = &label0[0]; goto unknown_dispatch;
      case 2:	label = &label0[1]; goto unknown_dispatch;
      case 3:	label = &label0[2]; goto unknown_dispatch;
      case 4:	label = &label0[3]; goto unknown_dispatch;
      case 5:	label = &label0[4]; goto unknown_dispatch;
      case 6:	label = &label0[5]; goto unknown_dispatch;
      case 7:	label = &label0[6]; goto unknown_dispatch;
    }
}

void motor(struct label *label, long niter)
{
    while( --niter >= 0 ) {
	++count_motor;
	label = (*label->fun)(label);
    }
}

int main(void)
{
    long niter = 8;
    motor(&test_labels[7], niter);
    printf("#iter == %lu, #motor == %lu, #entries == %lu, #dispatches == %lu\n",
	   niter, count_motor, count_entries, count_dispatches);
    if( count_dispatches != count_entries*8 )
	printf("BUG: #dispatches should be %lu\n", count_entries*8);
    return 0;
}
