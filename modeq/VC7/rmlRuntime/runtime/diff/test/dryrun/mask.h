/* mask.h */

struct label {
    const struct label *(*fun)(const struct label*);
    unsigned long tag;
    unsigned long *mask;
};
