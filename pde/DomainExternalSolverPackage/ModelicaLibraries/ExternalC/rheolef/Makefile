#RHEOLEF_LIBDIR=/home/levsa/pkg/rheolef-3.105/lib


include $(RHEOLEF_LIBDIR)/rheolef/rheolef.mk
CXXFLAGS  = $(INCLUDES_RHEOLEF)
LDLIBS    = $(LIBS_RHEOLEF)

CXXFLAGS += -DWITHOUT_DYMOLA # -DEXTSOLVERDEBUG
CFLAGS += -DWITHOUT_DYMOLA # -DEXTSOLVERDEBUG

CXXFLAGS += -I../

DESTDIR=../../Applications

default: all

all: $(DESTDIR)/extsolver

# default: testrheolef

POISSON_RHEOLEF= poisson_rheolef.cc
SOLVER_RHEOLEF=$(POISSON_RHEOLEF)


CCSRCS= $(SOLVER_RHEOLEF) extsolver.cc rheolef_common.cc
CCOBJS= $(CCSRCS:%.cc=%.o)
CSRCS=  ../read_array_common.c ../read_matrix.c
COBJS= $(CSRCS:%.c=%.o)
SRCS= $(CSRCS) $(CCSRCS)
OBJS= $(COBJS) $(CCOBJS)

$(DESTDIR)/extsolver: $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)



