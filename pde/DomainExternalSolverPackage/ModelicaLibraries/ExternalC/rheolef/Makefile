#RHEOLEF_LIBDIR=/usr/local/rheolef-4.74-shared
#but set in the environment instead

include $(RHEOLEF_LIBDIR)/rheolef/rheolef.mk
CXXFLAGS  = $(INCLUDES_RHEOLEF)
LDLIBS    = $(LIBS_RHEOLEF)

#CXXFLAGS += -DWITHOUT_DYMOLA -DEXTSOLVERDEBUG
CXXFLAGS += -DWITHOUT_DYMOLA
#CFLAGS += -DWITHOUT_DYMOLA -DEXTSOLVERDEBUG
CFLAGS += -DWITHOUT_DYMOLA 

CXXFLAGS += -I../
CFLAGS += -I../

DESTDIR=../../ExternalC

default: all

all: $(DESTDIR)/extsolver

# default: testrheolef

POISSON_RHEOLEF= poisson_rheolef.cc
SOLVER_RHEOLEF=$(POISSON_RHEOLEF)


CCSRCS= $(SOLVER_RHEOLEF) extsolver.cc rheolef_common.cc
CCOBJS= $(CCSRCS:%.cc=%.o)
OBJS= $(COBJS) $(CCOBJS) read_array_common.o read_matrix.o

$(DESTDIR)/extsolver: $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)


read_array_common.o: ../read_array_common.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

read_matrix.o: ../read_matrix.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<




