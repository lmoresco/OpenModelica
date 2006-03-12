/* mask.c */
#include <stddef.h>
#include "mask.h"
#if defined(DEBUG)
#include "check.h"
extern unsigned long debug_entries;
extern unsigned long debug_dispatches;
#endif
#include "test.h"
#if defined(__STDC__)
#define GLUE(A,B) A##B
#else
#define GLUE(A,B) A/**/B
#endif

#if defined(DEBUG)
const struct check test_checks[] = {
#if defined(JPTAB) && defined(NOSHIFT)
    { sizeof(void**), "sizeof(void**)", sizeof(struct label*), "sizeof(struct label*)" },
#endif
    /* Sentinel for (a) termination, and (b) making the array non-empty. */
    { 0, 0, 0, 0 }
};
#endif

static const struct label *test_modfun(const struct label*);
unsigned long test_mask = 0;
#if defined(JPTAB) && defined(NOSHIFT)
#define SCALE(L) L*sizeof(void**)
#else
#define SCALE(L) L
#endif
#define DEFLAB(L) {test_modfun,SCALE(L),&test_mask}

static const struct label test_labels[32] = {
    DEFLAB(0),	DEFLAB(1),	DEFLAB(2),	DEFLAB(3),
    DEFLAB(4),	DEFLAB(5),	DEFLAB(6),	DEFLAB(7),
    DEFLAB(8),	DEFLAB(9),	DEFLAB(10),	DEFLAB(11),
    DEFLAB(12),	DEFLAB(13),	DEFLAB(14),	DEFLAB(15),
    DEFLAB(16),	DEFLAB(17),	DEFLAB(18),	DEFLAB(19),
    DEFLAB(20),	DEFLAB(21),	DEFLAB(22),	DEFLAB(23),
    DEFLAB(24),	DEFLAB(25),	DEFLAB(26),	DEFLAB(27),
    DEFLAB(28),	DEFLAB(29),	DEFLAB(30),	DEFLAB(31)
};
const struct label *test_start = &test_labels[31];

static const struct label *test_modfun(const struct label *label)
{
#if !defined(JPTAB)
#define CASE0 default: case 0
#define CASE(K) case K
#else	/* JPTAB */
    static const void * const * const case_table[] = {
	&&case0, &&case1, &&case2, &&case3,
	&&case4, &&case5, &&case6, &&case7,
	&&case8, &&case9, &&case10, &&case11,
	&&case12, &&case13, &&case14, &&case15,
	&&case16, &&case17, &&case18, &&case19,
	&&case20, &&case21, &&case22, &&case23,
	&&case24, &&case25, &&case26, &&case27,
	&&case28, &&case29, &&case30, &&case31
    };
#if defined(NOSHIFT)
    const char *case_ptr = (const char*)case_table;
#else
    const void * const * const *case_ptr = &case_table[0];
#endif
#define CASE0 case0
#define CASE(K) GLUE(case,K)
#endif	/* JPTAB */

    const struct label *label0 = &test_labels[0];
    unsigned long k;

#if defined(DEBUG)
    ++debug_entries;
#endif
    *label->mask = ~0;	/* instead of: test_mask = ~0; */
unknown_dispatch:
#if defined(DEBUG)
    ++debug_dispatches;
#endif

    /* determine index */
    k = label->tag & *label->mask;

    /* go to the correct case */
#if defined(JPTAB)
    goto **(const void * const * const *)(case_ptr + k);
#else	/* !JPTAB */
    switch( k )
#endif	/* JPTAB */
    {
      CASE0:	test_mask = 0; return &label0[31];
      CASE(1):	label = &label0[0]; goto unknown_dispatch;
      CASE(2):	label = &label0[1]; goto unknown_dispatch;
      CASE(3):	label = &label0[2]; goto unknown_dispatch;
      CASE(4):	label = &label0[3]; goto unknown_dispatch;
      CASE(5):	label = &label0[4]; goto unknown_dispatch;
      CASE(6):	label = &label0[5]; goto unknown_dispatch;
      CASE(7):	label = &label0[6]; goto unknown_dispatch;
      CASE(8):	label = &label0[7]; goto unknown_dispatch;
      CASE(9):	label = &label0[8]; goto unknown_dispatch;
      CASE(10):	label = &label0[9]; goto unknown_dispatch;
      CASE(11):	label = &label0[10]; goto unknown_dispatch;
      CASE(12):	label = &label0[11]; goto unknown_dispatch;
      CASE(13):	label = &label0[12]; goto unknown_dispatch;
      CASE(14):	label = &label0[13]; goto unknown_dispatch;
      CASE(15):	label = &label0[14]; goto unknown_dispatch;
      CASE(16): label = &label0[15]; goto unknown_dispatch;
      CASE(17): label = &label0[16]; goto unknown_dispatch;
      CASE(18): label = &label0[17]; goto unknown_dispatch;
      CASE(19): label = &label0[18]; goto unknown_dispatch;
      CASE(20): label = &label0[19]; goto unknown_dispatch;
      CASE(21): label = &label0[20]; goto unknown_dispatch;
      CASE(22): label = &label0[21]; goto unknown_dispatch;
      CASE(23): label = &label0[22]; goto unknown_dispatch;
      CASE(24): label = &label0[23]; goto unknown_dispatch;
      CASE(25): label = &label0[24]; goto unknown_dispatch;
      CASE(26): label = &label0[25]; goto unknown_dispatch;
      CASE(27): label = &label0[26]; goto unknown_dispatch;
      CASE(28): label = &label0[27]; goto unknown_dispatch;
      CASE(29): label = &label0[28]; goto unknown_dispatch;
      CASE(30): label = &label0[29]; goto unknown_dispatch;
      CASE(31): label = &label0[30]; goto unknown_dispatch;
    }
}
