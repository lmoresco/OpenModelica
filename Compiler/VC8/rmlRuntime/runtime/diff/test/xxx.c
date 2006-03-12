/* xxx.c */
#include <stdio.h>

struct label {
    struct label *(*fun)(struct label *);
} labels[3] = { 0, 0, 0 };

long diff(struct label *l1, struct label *l2)
{
#ifdef HACK
    return ((unsigned long)l1 - (unsigned long)l2) / sizeof(struct label*);
#else
    return l1 - l2;
#endif
}

int main(void)
{
    int k;
    printf("%d\n", sizeof(struct label));
    for(k = -(int)sizeof(struct label); k <= (int)sizeof(struct label); ++k)
	printf("%ld ", diff((struct label*)((char*)&labels[1] + k), &labels[1]));
    printf("\n");
    return 0;
}
