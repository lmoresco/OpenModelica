/* ticks.c */
#include "ticks.h"
#include "config.h"

#ifdef TICKS_TIMES
#include <sys/times.h>
#include <limits.h>
extern clock_t times(struct tms*);

long ticks_now(void)
{
    struct tms tms;

    times(&tms);
    return tms.tms_utime + tms.tms_stime;
}

unsigned long ticks_per_sec(void)
{
    return CLK_TCK;
}
#endif	/*TICKS_TIMES*/

#ifdef TICKS_RUSAGE
#include <sys/time.h>
#include <sys/resource.h>
extern int getrusage(int, struct rusage*);

long ticks_now(void)
{
    struct rusage ru;
    unsigned long usecs;

    getrusage(RUSAGE_SELF, &ru);
    usecs = ru.ru_utime.tv_sec * 1000000 + ru.ru_utime.tv_usec
	  + ru.ru_stime.tv_sec * 1000000 + ru.ru_stime.tv_usec;
    return usecs;
}

unsigned long ticks_per_sec(void)
{
    return 1000000;
}
#endif	/*TICKS_RUSAGE*/

#ifdef TICKS_PARIX
#include <sys/time.h>

long ticks_now(void)
{
    return TimeNow();
}

unsigned long ticks_per_sec(void)
{
    return CLOCK_TICK;
}
#endif	/*TICKS_PARIX*/

#ifdef TICKS_ANSIC
#include <time.h>

long ticks_now(void)
{
    return clock();
}

unsigned long ticks_per_sec(void)
{
    return CLOCKS_PER_SEC;
}
#endif	/*TICKS_ANSIC*/
