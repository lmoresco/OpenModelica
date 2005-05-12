/* check.h */

#if defined(DEBUG)
struct check {
    size_t	val1;
    const char	*exp1;
    size_t	val2;
    const char	*exp2;
};

extern void check(const struct check[]);
#endif
