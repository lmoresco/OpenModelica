extern void *alloc_bytes(unsigned nbytes);
extern void *alloc_words(unsigned nwords);

extern void print_icon(FILE*, void*);
extern void print_rcon(FILE*, void*);
extern void print_scon(FILE*, void*);

extern void *mmc_mk_icon(int);
extern void *mmc_mk_rcon(double);
extern void *mmc_mk_scon(char*);
extern void *mmc_mk_nil(void);
extern void *mmc_mk_cons(void*, void*);
extern void *mmc_mk_none(void);
extern void *mmc_mk_some(void*);
extern void *mmc_mk_box0(unsigned ctor);
extern void *mmc_mk_box1(unsigned ctor, void*);
extern void *mmc_mk_box2(unsigned ctor, void*, void*);
extern void *mmc_mk_box3(unsigned ctor, void*, void*, void*);
extern void *mmc_mk_box4(unsigned ctor, void*, void*, void*, void*);
extern void *mmc_mk_box5(unsigned ctor, void*, void*, void*, void*, void*);
