default: lib

# default: test

DYMOLADIR=/d/Dymola53
DYMOLAINC=-I$(DYMOLADIR)/Source
DYMOLALIB=$(DYMOLADIR)/bin/lib/egcs/libds.a

CPPFLAGS += $(DYMOLAINC)
LDLIBS += $(DYMOLALIB)



SRCS=  meshext.c
OBJS=  $(SRCS:%.c=%.o)

lib: libmeshext.a

libmeshext.a: $(OBJS) 
	$(AR) -ruv $@ $(OBJS)
	ranlib $@



