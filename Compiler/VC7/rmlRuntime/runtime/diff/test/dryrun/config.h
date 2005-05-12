/* config.h */

#if defined(__hpux) && defined(__hppa)
#define TICKS_TIMES
#endif

#if defined(__linux__) && defined(__i386__)
#define TICKS_TIMES
#endif

#if defined(__osf__) && defined(__alpha)
#define TICKS_RUSAGE
#endif

#if defined(__PARIX__)
#define TICKS_PARIX
#endif

#if defined(__sun) && defined(__SVR4)
#define TICKS_TIMES
#endif

#if defined(__mips) && defined(__sgi)
#define TICKS_TIMES
#endif

#if defined(ultrix) && defined(mips)
#define TICKS_RUSAGE
#endif

#if defined(_AIX) && defined(_POWER)
#define TICKS_RUSAGE
#endif
