/* p_clock.c
 * Extremely system dependent implementation of a simple
 * timer facility, analogous to ANSI-C's clock().
 */
#include "rml.h"

#ifdef RML_CLOCK_RUSAGE
#include <sys/time.h>
#include <sys/resource.h>
extern int getrusage(int, struct rusage*);

unsigned long rml_prim_clock(void)
{
    struct rusage ru;
    unsigned long usecs;
    double scale;

    (void)getrusage(RUSAGE_SELF, &ru);
    usecs = ru.ru_utime.tv_sec * 1000000 + ru.ru_utime.tv_usec
	  + ru.ru_stime.tv_sec * 1000000 + ru.ru_stime.tv_usec;
    scale = (double)RML_CLOCKS_PER_SEC / 1000000.0;
    return (unsigned long)((double)usecs * scale);
}
#endif

#ifdef RML_CLOCK_TIMES
#include <sys/times.h>
#include <limits.h>
#include <time.h>	/* for glibc2 */
extern clock_t times(struct tms*);

unsigned long rml_prim_clock(void)
{
    struct tms tms;
    double scale;

    (void)times(&tms);
    scale = (double)RML_CLOCKS_PER_SEC / (double)CLK_TCK;
    return (unsigned long)((double)(tms.tms_utime + tms.tms_stime) * scale);
}
#endif

#ifdef RML_CLOCK_PARIX
#include <sys/time.h>

unsigned long rml_prim_clock(void)
{
    double scale = (double)RML_CLOCKS_PER_SEC / (double)CLOCK_TICK;
    return (unsigned long)((double)TimeNow() * scale);
}
#endif

#ifdef RML_CLOCK_ANSIC
#include <time.h>

unsigned long rml_prim_clock(void)
{
    double scale = (double)RML_CLOCKS_PER_SEC / (double)CLOCKS_PER_SEC;
    return (unsigned long)((double)clock() * scale);
}
#endif
