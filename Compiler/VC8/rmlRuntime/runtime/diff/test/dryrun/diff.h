/* diff.h */

struct label {
    const struct label *(*fun)(const struct label*);
};
