/* main.c */
#include <stdio.h>
#define LIMIT	(4)

void try(unsigned long oldi)
{
    unsigned long newi;
    /*
     * BEGIN RANGE CHECKING
     */
#if defined(RNGCHK_C)
    newi = (oldi < LIMIT) ? oldi : 0;
#elif defined(RNGCHK_ALPHA)
    {
	unsigned long flags;
	newi = oldi;
	asm("cmpult %2,%3,%1; cmoveq %1,0,%0" : "=r"(newi), "=r"(flags) : "0"(newi), "ir"(LIMIT));
    }
#elif defined(RNGCHK_HPPA)
    newi = oldi;
    asm("comclr,>>= %2,%1,0\n ldi 0,%0" : "=r"(newi) : "0"(newi), "r"(LIMIT-1) : "cc");
#elif defined(RNGCHK_I386)
    {
	unsigned mask;
	/*
	 * cmpl	n,i		# compute i-n, set C = 1 if 0 <= i < n, 0 otherwise
	 * sbbl	mask,mask	# mask = -C, so mask == -1 if in range, 0 otherwise
	 */
	asm("cmpl %2,%1; sbbl %0,%0" : "=r"(mask) : "r"(oldi), "g"(LIMIT) : "cc");
	newi = oldi & mask;
    }
#elif defined(RNGCHK_I686)
    {
	unsigned zero = 0;
	/*
	 * cmpl	n,i		# compute i-n
	 *			# if 0 <= i < n, then C = 1, Z = 0
	 *			# if i == n, C = 0, Z = 1
	 *			# if i > n, C = 0, Z = 0
	 * cmovae zero,i	# AE means C==0: if so, clear i
	 *
	 * Unfortunately, the "cmov" instruction cannot have an immediate source
	 * operand. So we have to reserve a register or a memory location to hold
	 * the out-of-band value. We have three alternatives:
	 *
	 * 1. Reserve a register holding zero.
	 *    Not very useful on a register-starved x86 processor.
	 * 2. Reserve a memory location holding zero.
	 *    Perhaps not too bad, given a decent L1 cache.
	 * 3. Use 'n' as the out-of-band value, and keep 'n' in a register.
	 *    Pehaps a better alternative than 0, since it allows the compare
	 *	  to work on registers as well.
	 *
	 * The version here uses alternative #2.
	 */
	newi = oldi;
	asm("cmpl %2,%1; cmovae %3,%0" : "=r"(newi) : "0"(newi), "g"(LIMIT), "m"(zero) : "cc");
    }
#elif defined(RNGCHK_MIPS)
    {
	unsigned mask;
	asm("sltu %0,%1,%2; subu %0,$0,%0" : "=r"(mask) : "r"(oldi), "ir"(LIMIT) : "cc");
	newi = oldi & mask;
    }
#elif defined(RNGCHK_RS6000)
    {
	/* AFAIK, both i and n must be in registers. */
	unsigned mask;
	asm("subfc %0,%2,%1; subfe %0,%0,%0" : "=r"(mask) : "r"(oldi), "r"(LIMIT) : "cc");
	newi = oldi & mask;
    }
#elif defined(RNGCHK_SPARC7)
    {
	unsigned mask;
	asm("subcc %1,%2,%%g0; subx %%g0,%%g0,%0" : "=r"(mask) : "r"(oldi), "rI"(LIMIT) : "cc");
	newi = oldi & mask;
    }
#elif defined(RNGCHK_SPARC9)
    /*
     * subcc	i,n,%g0		# compute i-n, sets C = 1 if 0 <= i < n, 0 otherwise
     * movcc	%icc,%g0,i	# if Carry Clear, set i to zero
     */
    newi = oldi;
    asm("subcc %1,%2,%%g0; movcc %%icc,%%g0,%0" : "=r"(newi) : "0"(newi), "rI"(LIMIT) : "cc");
#else
#error "no range checking method specified"
#endif
    /*
     * END RANGE CHECKING
     */
    printf("rngchk(%ld, %ld) == %ld%s\n",
	   oldi, LIMIT, newi,
	   ((newi >= LIMIT) || (oldi < LIMIT && newi != oldi)) ? " ERROR" : "");
}

int main(void)
{
    long i;
    printf("legal range is [0..%d]\n", LIMIT-1);
    for(i = -5; i <= 5; ++i)
	try(i);
    return 0;
}
