default: all

all: lib 

# default: test

DYMOLADIR=/d/Dymola53
DYMOLAINC=-I$(DYMOLADIR)/Source
DYMOLALIB=$(DYMOLADIR)/bin/lib/egcs/libds.a

CPPFLAGS += $(DYMOLAINC)
LDLIBS += $(DYMOLALIB)

DESTPATH=../Applications

LIBEXTSRCS= read_array_common.c read_matrix.c 

LIBRHEOLEFSRCS= poisson_rheolef.c
LIBBAMGSRCS= bamg.c
LIBMESHEXTSRCS= meshext.c

LIBEXTOBJS=  $(LIBEXTSRCS:%.c=%.o) 
LIBRHEOLEFOBJS= $(LIBRHEOLEFSRCS:%.c=%.o)
LIBBAMGOBJS= $(LIBBAMGSRCS:%.c=%.o)
LIBMESHEXTOBJS=  $(LIBMESHEXTSRCS:%.c=%.o)

lib: $(DESTPATH)/librheolef.a $(DESTPATH)/libbamg.a $(DESTPATH)/libmeshext.a

$(DESTPATH)/librheolef.a: $(LIBEXTOBJS) $(LIBRHEOLEFOBJS)
	$(AR) -ruv $@ $(LIBEXTOBJS) $(LIBRHEOLEFOBJS)
	ranlib $@

$(DESTPATH)/libbamg.a: $(LIBEXTOBJS) $(LIBBAMGOBJS)
	$(AR) -ruv $@ $(LIBEXTOBJS) $(LIBBAMGOBJS)
	ranlib $@

$(DESTPATH)/libmeshext.a: $(LIBEXTOBJS) $(LIBMESHEXTOBJS)
	$(AR) -ruv $@ $(LIBEXTOBJS) $(LIBMESHEXTOBJS) $(LIBBAMGOBJS)
	ranlib $@



